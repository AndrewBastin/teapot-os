[bits 16]

KERNEL_SIZE equ 16                ; Number of sectors required for kernel (multiply by 512 to get the size in bytes)
KERNEL_LOC equ 0x1000             ; Where the kernel will be located in the memory

; Expects DL to contain the boot drive number
kernel_load:
  mov bx, KERNEL_LOC              ; disk_load copies to ES:BX so setting BX to the required position
  mov dh, KERNEL_SIZE             ; setting the number of sectors to read
  ; DL is already the drive number

  call disk_read                  ; Call the disk load routine
  ret                             ; Yield back


[bits 32]

kernel_start:
  call KERNEL_LOC                 ; Execute loaded kernel code
  jmp $
