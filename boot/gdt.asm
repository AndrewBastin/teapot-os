gdt_start:                              ; Start of the GDT (1 byte null descriptor)
  dd 0x0                                ; Null 4 bytes 
  dd 0x0                                ; Null 4 bytes 

gdt_code:                               ; GDT entry for CODE segment
  dw 0xffff                             ; Segment Length (bits 0-15)
  dw 0x0                                ; Segment Base (bits 0-15)
  db 0x0                                ; Segment Base (bits 16-23)
  db 10011010b                          ; Flags (8 bits)
  db 11001111b                          ; Flags (4 bits) + segment length, bits 16-19
  db 0x0                                ; Segment Base (bits 24-31)

gdt_data:                               ; GDT entry for DATA segment
  dw 0xffff                             ; Segment Length (bits 0-15)
  dw 0x0                                ; Segment Base (bits 0-15)
  db 0x0                                ; Segment Base (bits 16-23)
  db 10010010b                          ; Flags (8 bits)
  db 11001111b                          ; Flags (4 bits) + segment length, bits 16-19
  db 0x0                                ; Segment Base (bits 24-31)

gdt_end:                                ; End of descriptor


gdt_desc:                               ; Descriptor addresses
  dw gdt_end - gdt_start - 1
  dd gdt_start


; Constants for later use
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

