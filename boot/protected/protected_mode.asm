[bits 16]
start_protected_mode:
  cli                               ; Clear Interrupts
  lgdt [gdt_desc]                   ; Load GDT Descriptor
  mov eax, cr0                      ; Copy cr0 to eax
  or eax, 0x1                       ; Set the 32-bit mode bit in cr0
  mov cr0, eax                      ; Copy eax to cr0
  jmp CODE_SEG:init_pm              ; Far Jump


[bits 32]
init_pm:
  mov ax, DATA_SEG                  ; Load Data Segment address to AX
  mov ds, ax                        ; Move data segment address to DS segment register
  mov ss, ax                        ; Move data segment address to SS segment register
  mov es, ax                        ; Move data segment address to ES segment register
  mov fs, ax                        ; Move data segment address to FS segment register
  mov gs, ax                        ; Move data segment address to GS segment register

  mov ebp, 0x90000                  ; Move Stack Base Pointer to the top of the free space
  mov esp, ebp                      ; Set stack pointer to the base pointer

  call PM_START
