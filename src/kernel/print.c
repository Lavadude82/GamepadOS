#include <string.c>

void putc(char chr, int position, int color)
{
    *(char*)(0xb8000 + (position*2)) = chr;
    *(char*)(0xb8001 + (position*2)) = color;
}

void print(int color, char* string)
{
    for (int i = 0; strlen(string) > i; i++)
    {
        putc(string[i], i, color);
    }
}

void rainbow_print(char* string)
{
    int current_color = 1;
    for (int i = 0; strlen(string) > i; i++)
    {
        if (current_color == 15) current_color = 1;

        putc(string[i], i, current_color);

        current_color++;
    }
}