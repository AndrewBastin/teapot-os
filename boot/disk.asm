; Loads sector specified in DH from disk DL into ES:BX
disk_read:
  pusha

  mov ah, 0x02              ; Read Function
  mov al, dh                ; Sectors to read
  mov ch, 0x00              ; Cylinder Number
  mov cl, 0x02              ; Sector number
  mov dh, 0x00              ; Disk Number

  ; DL is configured as the routine params
  ; ES:BX is the destination of the interrupt result and is configured so
  int 0x13                  ; Fire Interrupt
  jc disk_err               ; Carry will be set if there was a disk error 

  popa
  ret

disk_err:
  mov bx, DISK_ERR          ; Move the message to the BX
  call print_str            ; Call the print routine [string.asm]

  jmp $                     ; Infinite Loop

DISK_ERR:
  db `Disk Error.`, 0
