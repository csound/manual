# What's new in Csound 7

Csound 7 brings major changes which offer new possibilities for users and modernize coding. Nevertheless Csound 7 keeps backwards compatibility: Despite new syntax features any valid Csound code from the past can be run without any code change.

## Explicit Variable Types

Variable names no longer have to start with `i`, `k`, `a` etc. to declare their data type implicitely. Instead any name (except existing opcodes or keywords) can be used, and the type declared explicitely:

```csound-orc title="Explicit Varaible Types" linenums="1"
maxamp@global:i = 0dbfs / 5

instr 1
  freq:i = 444
  ramp:k = linseg(maxamp,p3,0)
  sound:a = poscil(ramp,freq)
  outall(sound)
endin
schedule(1,0,2)
```

## New UDO Syntax and Pass-by-reference

User Defined Opcodes now follow the syntax `opcode name(inargs):(outargs)`. 

```csound-orc
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
schedule(1,0,0)
```

Give example for pass-by-reference ...

## Removed Limitations for Functional Style

Multiple output arguments can now be used in functional style, e.g.

```csound-orc
nchnls = 2
instr 1
  sig:a = rand(0dbfs/10)
  aL,aR = pan2(sig,3/4)
  out(aL,aR)
endin
schedule(1,0,1)
```

## For-Loop

Is it going to happen??

## User-Defined Types

```csound-orc
struct MyType val0:i, val1:i

instr 1
testVal:MyType init 8, 88
print(testVal.val0)
print(testVal.val1)
endin
schedule(1,0,0)
```
