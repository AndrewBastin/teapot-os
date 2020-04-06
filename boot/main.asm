[org 0x7c00]                                        ; Assembler info for jump codes

KERNEL_LOC equ 0x1000                               ; Where the kernel will be located in the memory

mov bp, 0x8000                                      ; Move the base pointer of the stack away
mov sp, bp                                          ; Set the stack pointer to base pointer

mov bx, message_about                               ; Move the about message to BX
call print_str
call newline

mov bx, message_load_kernel
call print_str
call newline

; DL is set to the boot drive by the BIOS
call kernel_load                                    ; Load Kernel from drive 0

mov bx, message_load_protected_mode
call print_str
call newline

call start_protected_mode                           ; Start protected mode

jmp $                                               ; Infinite loop (we shouldn't reach here)

; Bootloader functions
%include "boot/string.asm"
%include "boot/disk.asm"
%include "boot/gdt.asm"
%include "boot/kernel.asm"
%include "boot/protected/protected_mode.asm"
%include "boot/protected/display.asm"

[bits 32]
PM_START:                                           ; start_protected_mode calls jumps to this label once done
  mov ebx, message_loaded_protected_mode
  call prot_print_str

  call kernel_start                                 ; Start the kernel

  jmp $                                             ; Infinite Loop 

message_about:
  db `This is a tiny little bootloader`, 0

message_load_kernel:
  db `Loading kernel`, 0

message_load_protected_mode:
  db `Loading protected mode`, 0

message_loaded_protected_mode:
  db `In protected mode`, 0

times 510-($-$$) db 0
dw 0xaa55

; Bootsector end (512 bytes)
