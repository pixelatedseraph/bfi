#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdint.h>
#include<stdbool.h>

#define non_nullable
#define private

typedef enum{
    //arithemetic
    bf_command_plus,
    bf_command_minus,

    //shift pointer
    bf_command_left,
    bf_command_right,
    
    //io
    bf_command_dot,
    bf_command_comma,

    //looping
    bf_command_open_bracket,
    bf_command_close_bracket,
}BrainFuckCommands;

#define BF_TAPE_SIZE 30000

typedef struct BrainFuck{
    char*  MemoryTape;
    FILE*  FilePointer;
    size_t CurrentPointer;

    void (*printMemoryTape) (struct BrainFuck self);
    void (*deleteBrainFuck) (struct BrainFuck* self);

}BrainFuck;

private static inline void _print_memory_tape(BrainFuck self){
    printf("%s\n",self.MemoryTape);
}

private static void _delete_brain_fuck(BrainFuck* self){
    free(self->MemoryTape);
    fclose(self->FilePointer);
    self->CurrentPointer = 0;

    self->printMemoryTape = NULL;
    self->deleteBrainFuck = NULL;
}


non_nullable BrainFuck newBrainFuck(const char* restrict path){
    BrainFuck brainFuck;
    brainFuck.MemoryTape = malloc(BF_TAPE_SIZE);

    if(!brainFuck.MemoryTape){
        fprintf(stderr,"Failed to perfom allocation\n");
        exit(EXIT_FAILURE);
    }

    brainFuck.FilePointer = fopen(path,"r");

    if(!brainFuck.FilePointer){
        fprintf(stderr,"No such file\n");
        free(brainFuck.MemoryTape);
        exit(EXIT_FAILURE);
    }

    else if(!strstr(path,".bf")){
        fprintf(stderr,"Not a valid brainfuck program\n");
        exit(EXIT_FAILURE);
    }

    fseek(brainFuck.FilePointer,0,SEEK_END);
    long sourceFileSize = ftell(brainFuck.FilePointer);
    rewind(brainFuck.FilePointer);

    fread(brainFuck.MemoryTape,1,sourceFileSize,brainFuck.FilePointer);
    brainFuck.CurrentPointer = 0;


    //Method Registeration
    brainFuck.printMemoryTape = _print_memory_tape;
    brainFuck.deleteBrainFuck = _delete_brain_fuck;

    return brainFuck;
}

#define printMemoryTape() printMemoryTape(brainFuck)
#define deleteBrainFuck() deleteBrainFuck(&brainFuck)


#define abortExecution(ErrorMessage) {\
    fprintf(stderr,#ErrorMessage);   \
    return -1;      }\


int main(int argc,char** argv){
    if(argc != 2)
        abortExecution("No Input Files");
    
    BrainFuck brainFuck = newBrainFuck(argv[1]);
    
    brainFuck.printMemoryTape();

    brainFuck.deleteBrainFuck();

    return 0;
}

