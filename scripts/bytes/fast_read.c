/*
  What's the fastest way to read a file?
  
  fast_read is a program that reads a file into memory using multiple parallel threads
  with a stochastic hill climb optimizer to find the fastest thread count and block size.
  
  Example run (note the effect of page cache, read is basically memcpy after that point):
  $ ./fast_read iotest_6G.dat
  Opening file iotest_6G.dat for reading
  Reading 6442450944 bytes
  Read 6442450944 bytes in 1.422697 s, 4.5 GB/s, t=16 bs=1024
  Read 6442450944 bytes in 0.335576 s, 19.2 GB/s, t=17 bs=1024
  Read 6442450944 bytes in 0.086056 s, 74.9 GB/s, t=16 bs=768
  Read 6442450944 bytes in 0.077247 s, 83.4 GB/s, t=15 bs=768
  Read 6442450944 bytes in 0.072509 s, 88.9 GB/s, t=16 bs=768
  Read 6442450944 bytes in 0.069172 s, 93.1 GB/s, t=24 bs=640
  Read 6442450944 bytes in 0.069024 s, 93.3 GB/s, t=32 bs=1664
  Read 6442450944 bytes in 0.068385 s, 94.2 GB/s, t=32 bs=1152
  Read 6442450944 bytes in 0.067516 s, 95.4 GB/s, t=32 bs=384
  Read 6442450944 bytes in 0.067513 s, 95.4 GB/s, t=32 bs=384

  Example run using direct IO to bypass page cache (i.e. raw disk bandwidth)
  $ ./fast_read --direct iotest_6G.dat
  Opening file iotest_6G.dat for reading
  Reading 6442450944 bytes
  Read 6442450944 bytes in 0.339347 s, 19.0 GB/s, t=16 bs=3072
  Read 6442450944 bytes in 0.330758 s, 19.5 GB/s, t=17 bs=3072
  Read 6442450944 bytes in 0.329682 s, 19.5 GB/s, t=16 bs=2816
  Read 6442450944 bytes in 0.329402 s, 19.6 GB/s, t=16 bs=2560
  Read 6442450944 bytes in 0.326667 s, 19.7 GB/s, t=18 bs=2304
  Read 6442450944 bytes in 0.325206 s, 19.8 GB/s, t=18 bs=2304
  Read 6442450944 bytes in 0.325151 s, 19.8 GB/s, t=19 bs=2304
  Read 6442450944 bytes in 0.325151 s, 19.8 GB/s, t=21 bs=2304
  Read 6442450944 bytes in 0.324033 s, 19.9 GB/s, t=21 bs=2816
  Read 6442450944 bytes in 0.323688 s, 19.9 GB/s, t=10 bs=3072
  
  Compile: cc -O3 -fopenmp -o fast_read fast_read.c
*/
#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <fcntl.h>
#include <string.h>
#include <math.h>

#define LOG2(X) ((unsigned) (8*sizeof (unsigned long long) - __builtin_clzll((X)) - 1))

int main(int argc, char **argv) {
    if (argc < 2 || strncmp(argv[1], "--help", 7) == 0) {
        printf("USAGE: fast_read [--direct] FILENAME\n");
        return -1;
    }

    int num_threads = 16;
    int block_size = 1024*1024;
    int direct_io = 0;

    direct_io = strncmp(argv[1], "--direct", 9) == 0 ? 1 : 0;

    if (direct_io) {
        block_size *= 3;
    }

    int fastest_found_num_threads = num_threads;
    int fastest_found_block_size = block_size;

    // File to read into memory.
    char *fn = argv[argc-1];

    printf("Opening file %s for reading\n", fn);

    FILE *fp = fopen(fn, "rb");
    if (fp == NULL) {
        printf("Error opening file %s\n", fn);
    }
    // Get file size
    fseek(fp, 0, SEEK_END);
    size_t fsize = ftell(fp);
    fclose(fp);
    printf("Reading %lu bytes\n", fsize);

    int iterations_since_last_fastest_found = 0;

    double fastest_time = 1e9;
    double fastest_time_decayed = fastest_time;

    for (int i = 0; i < 1000; i++) {
        double start = omp_get_wtime();

        size_t read_count = 0;

        iterations_since_last_fastest_found++;

        fastest_time_decayed *= 1.0005;

        int jump_multiplier = pow(((double)rand() / (double)RAND_MAX), 2.0) * LOG2(iterations_since_last_fastest_found/4) + 1;

        int r = rand();
        if (r < RAND_MAX/3) {
            num_threads += jump_multiplier;
        } else if (r < RAND_MAX/3 * 2) {
            num_threads -= jump_multiplier;
            if (num_threads < 1) num_threads = 1;
        } else {
            num_threads = fastest_found_num_threads;
        }

        jump_multiplier = pow(((double)rand() / (double)RAND_MAX), 2.0) * LOG2(iterations_since_last_fastest_found/4) + 1;

        r = rand();
        if (r < RAND_MAX/3) {
            block_size += jump_multiplier*256*1024;
        } else if (r < RAND_MAX/3 * 2) {
            block_size -= jump_multiplier*256*1024;
            if (block_size < 1024) block_size = 128*1024;
        } else {
            block_size = fastest_found_block_size;
        }

        // Read the entire file into memory
        // Using num_threads OpenMP threads
        // Read the file in block_size chunks
        #pragma omp parallel for num_threads(num_threads)
        for (int t = 0; t < num_threads; t++) {
            int tfp = open(fn, O_RDONLY | (direct_io == 0 ? 0 : O_DIRECT), 0);
            // Allocate memory
            char *data;
            posix_memalign((void *)&data, 1024*1024, block_size);
            size_t rb = 0;
            for (off_t i = t*block_size; i < fsize; i += num_threads*block_size) {
                lseek(tfp, i, SEEK_SET);
                rb += read(tfp, data, block_size);
            }
            close(tfp);
            read_count += rb;
        }

        double cpu_time_used = omp_get_wtime() - start;

        if (cpu_time_used < fastest_time_decayed) {
            fastest_time_decayed = cpu_time_used;
            fastest_found_num_threads += (num_threads - fastest_found_num_threads);
            fastest_found_block_size += (block_size - fastest_found_block_size);
            iterations_since_last_fastest_found = 0;
        }

        if (cpu_time_used < fastest_time) {
            fastest_time = cpu_time_used;
            printf("Read %lu bytes in %f s, %.1f GB/s, t=%d bs=%d\n", read_count, cpu_time_used, read_count / cpu_time_used / 1e9, num_threads, block_size/1024);
        }
    }
    return 0;
}
