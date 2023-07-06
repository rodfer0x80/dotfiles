#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define INITIAL_SIZE 256
#define CHUNK_SIZE 256

int scaleInput(char** input, int* position, int* size, int *chunk)
{
    if (*(position) + *(chunk) > *(size))
    {
        *(size) *= 2;
        char* scaled_input = (char*)realloc(*(input), *(size) * sizeof(char));
        
        //free(*(input));
        *(input) = scaled_input;

        if (*(input) == NULL)
        {
            free(*(input));
            return 1;
        }
    }

    return 0;
}

int getStdin(char** input, int* position, int* bytes_read, int* chunk)
{
    if (fgets(*(input) + *(position), *(chunk), stdin) == NULL) {
        //free(*(input));
        //*(input) = NULL;
        return 0;
    }

    *(bytes_read) = strlen(*(input) + *(position));
    *(position) += *(bytes_read);
    
    return 0;
}

int writeOutput(char** output, int* position, int* size)
{

    return 0;
}

int readInput(char** input, int* position, int* size, int* bytes_read, int* chunk)
{
    *(input) = (char*)malloc(*(size) * sizeof(char));
    if (input == NULL)
    {
        write(2, (char*)"Memory allocation failed.\n\0", 28);
        return 1;
    }
    
    do {
        if (scaleInput(input, position, size, chunk))
        {
            write(2, (char*)"Memory reallocation failed.\n\0", 30);
            return 2;
        }
    
        if (getStdin(input, position, bytes_read, chunk))
        {
            write(2, (char*)"Error reading stdin.\n\0", 23);
            return 3;
        }
    } while (*(bytes_read) == *(chunk) - 1 && *(input[*(position) - 1]) != EOF);
    return 0;
}

int parseInput(char** input, char** output)
{
    // reverse string from input to output using int as ptr
    bool newline_flag = false;
    int length = strlen(*input);
    *output = (char*)malloc((length + 1) * sizeof(char));

    if (*output == NULL) {
        write(2, (char*)"Memory allocation failed.\n\0", 28);
        return 1;
    }

    
    int i = 0;
    int ii = 0;
    while (i < length)
    {
        if ((i == 0) && (strcmp(&(*input)[length - i - 1], "\n") == 0))
        {
            newline_flag = true;
            i++;
        } else
        {
            (*output)[ii] = (*input)[length - i - 1];
            i++;
            ii++;
        }
    }

    if (newline_flag)
    {
        (*output)[ii] = '\n';
        ii++;
    }

    (*output)[ii] = '\0';

    return 0;
}

int main(int argc, char** argv)
{    
    char* input = NULL;
    char* output = NULL;
    
    int size = INITIAL_SIZE;
    int position = 0;
    int bytes_read = 0;
    int chunk = CHUNK_SIZE;
    
    int ret = 0;

    ret = readInput(&input, &position, &size, &bytes_read, &chunk);
    if (ret)
    {
        write(2, (char*)"Error reading input.\n\0", 25);
        return ret;

    }
    
    ret  = parseInput(&input, &output);
    if (ret)
    {
        write(2, (char*)"Error parsing input.\n\0", 25);
        return ret;
    }
    free(input);
    
    if (write(1, output, strlen(output)) == -1)
    {
        write(2, (char*)"Error writting output.\n\0", 25);
        return ret;
    }
    free(output);

    return 0;
    
}
