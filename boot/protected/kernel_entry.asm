[bits 32]                         ; 32-bit protected mode code
[extern kmain]                    ; kmain function is the main kernel function

kernel_main:
  call kmain                      ; Start the Kernel
  jmp $                           ; Infinite loop if Kernel yielded control
