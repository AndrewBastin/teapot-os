#include "panic.h"

#include "../io/vga.h"

/**
 * Reports panic and stops everything 
 */
void panic(char *message) {
  textmode_print("Kernel Panic", TTY_BLUE, TTY_WHITE, 0, 0);
  textmode_print("Message: ", TTY_BLUE, TTY_WHITE, 0, 1);
  textmode_print(message, TTY_BLUE, TTY_WHITE, 9, 1);

  // Don't return
  while (1);
}
