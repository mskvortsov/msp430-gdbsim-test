  .text
  .globl _start
_start:
  ; set stack pointer to the last RAM word
  ; should be in sync with memory.x linker map
  mov #0x38fe, r1
  call #main
  call #386
