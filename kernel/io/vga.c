#include "vga.h"

#define VRAM 0xB8000

#define TM_WIDTH 80
#define TM_HEIGHT 25

void textmode_print(char *str, enum TTY_COLOR bg, enum TTY_COLOR fg, unsigned short x, unsigned short y) {
  volatile char *vram = (volatile char *) (VRAM + (y * TM_WIDTH * 2) + (x * 2));

  char color = (bg << 4) | fg;
  
  while (*str != '\0') {
    *vram++ = *str++;
    *vram++ = color;
  }
}


// TODO : Rewrite this with a memcpy implementation to be faster
void textmode_clrscr() {
  volatile char *vram = (volatile char *) VRAM;

  int i = 0;
  
  while (i < TM_WIDTH * TM_HEIGHT) {
    *vram++ = '\0';
    *vram++ = 0x0;

    i++;
  }

}
