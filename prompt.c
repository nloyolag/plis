#include <stdio.h>
#include <stdlib.h>

#include <editline/readline.h>
#include <editline/history.h>

// cc -std=c99 -Wall prompt.c -ledit -o prompt

int main(int argc, char** argv) {

    while (1) {
        char * input = readline("plis> ");
        add_history(input);
        free(input);
    }

    return 0;
}
