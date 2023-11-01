#!/usr/bin/python3


from pwn import *


## Load
exe = 'challenge'
elf = context.binary = ELF(exe, checksec=False)


## Patch
elf.asm(elf.symbols.alarm, 'ret')
# elf.asm(elf.symbols.ptrace, 'ret')


## Save
elf.save("patched")

