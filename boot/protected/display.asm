[bits 32]

VIDEO_MEM equ 0xb8000               ; Location of the video memory
WHITE_ON_BLACK equ 0x0c             ; Character metadata for White text on Black Background

; Address of the string (null-terminated) is stored in EBX
prot_print_str:
  pusha

  mov edx, VIDEO_MEM

  prot_print_str_loop:
    mov al, [ebx]                   ; Read character
    mov ah, WHITE_ON_BLACK          ; Set data 

    cmp al, 0                       ; Check if end of string
    je prot_print_str_end

    mov [edx], ax                   ; Store character (and metadata) to video memory
    add ebx, 1                      ; Increment to next character in source string
    add edx, 2                      ; Increment to next character in video memory

    jmp prot_print_str_loop


  prot_print_str_end:
    popa
    ret
