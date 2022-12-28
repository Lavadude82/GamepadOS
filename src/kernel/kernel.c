#include <print.c>
#include <tty.c>

void main(char boot_disk)
{
    asm("cli");
    
    rainbow_print("This is rainbow print!");

    return;
}