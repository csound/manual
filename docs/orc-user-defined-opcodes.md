# User Defined Opcodes (UDO)

User Defined Opcodes are functions written in Csound code. They are located in the global space of the orchestra code, or loaded in a text file via `#include`.

The definition of a User Defined Opcode starts with the keyword `opcode` and ends with the keyword `endop`. The syntax and implementation of UDOs has changed in Csound 7; so there are two different syntax conventions which can be used.

## Old style UDO definition

The implementation is described in detail in the manual page for `opcode` (link to that page).

## New style UDO definition

User Defined Opcodes now follow the syntax `opcode name(inargs):(outargs)`. 

```
opcode myop(inval:i):(i)
  xout(inval+1)
endop

opcode empty():void
  puts("empty!",1)
endop

instr 1
  print(myop(17))
  empty()
endin
schedule(1,0,0
```

Give example for pass-by-reference as difference to old style UDOs.
