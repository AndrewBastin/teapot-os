#include "io/vga.h"
#include "util/panic.h"

void kmain() {
  textmode_clrscr();
  textmode_print("Loaded Kernel successfully", TTY_BLACK, TTY_LIGHT_RED, 10, 20);

  panic("This is a test panic");
}
