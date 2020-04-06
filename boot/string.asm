; Andrew's Tiny Bootloader's String Utilities defintions

; Prints a Null-Terminated string at an address to display (TTY)
; Parameters -> BX (address of the string)
print_str:
  pusha

  loop:
    mov al, [bx]
    cmp al, 0         ; Check if AL has the null terminator 
    je done           ; If null terminator, done

    mov ah, 0x0e      ; TTY mode
    int 0x10          ; Fire interrupt

    inc bx            ; Increment BX
    jmp loop          ; Loop back up

  done:
    popa
    ret

; Prints a newline character to the display (TTY)
newline:
  pusha

  mov ah, 0x0e        ; TTY Mode
  mov al, 0x0a        ; Newline character
  int 0x10            ; Fire Interrupt
  mov al, 0x0d        ; Carriage Return character
  int 0x10

  popa
  ret 
