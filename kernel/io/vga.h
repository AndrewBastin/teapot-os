#ifndef IO_VGA_H

#define IO_VGA_H 

enum TTY_COLOR {
  TTY_BLACK = 0x0,
  TTY_BLUE = 0x1,
  TTY_GREEN = 0x2,
  TTY_CYAN = 0x3,
  TTY_RED = 0x4,
  TTY_PURPLE = 0x5,
  TTY_BROWN = 0x6,
  TTY_GRAY = 0x7,
  TTY_DARK_GRAY = 0x8,
  TTY_LIGHT_BLUE = 0x9,
  TTY_LIGHT_GREEN = 0xA,
  TTY_LIGHT_CYAN = 0xB,
  TTY_LIGHT_RED = 0xC,
  TTY_LIGHT_PURPLE = 0xD,
  TTY_YELLOW = 0xE,
  TTY_WHITE = 0xF
};

/**
 * Prints the given string at the given character position in Text Mode TTY
*/
void textmode_print(char *str, enum TTY_COLOR bg, enum TTY_COLOR fg, unsigned short x, unsigned short y); 

/**
 * Clears the entire screen
 */
void textmode_clrscr();

#endif
