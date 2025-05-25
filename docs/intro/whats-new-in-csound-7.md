-# What's new in Csound 7

Csound 7 brings major changes which offer new possibilities for users and modernize coding. Nevertheless Csound 7 keeps backwards compatibility: Despite new syntax features any valid Csound code from the past can be run without any code change.

## Explicit Variable Types

Variable names no longer have to start with `i`, `k`, `a` etc. to declare their data type implicitely. Instead any name (except existing opcodes or keywords) can be used, and the type declared explicitely:

```csound-orc title="Explicit Variable Types"
maxamp@global:i = 0dbfs / 5

instr 1
  freq:i = 444
  ramp:k = linseg(maxamp,p3,0)
  sound:a = poscil(ramp,freq)
  outall(sound)
endin
schedule(1,0,2)
```

In addition, a number of new variable types have been introduced.


## New UDO Syntax and Pass-by-reference

User Defined Opcodes now follow the syntax `opcode name(inargs):(outargs)`. 

```csound-orc
opcode myop(inval:i):(i)
  xout(inval+1)
endop

opcode empty():void
  puts("empty!", 1)
endop

instr 1
  print(myop(17))
  empty()
endin
schedule(1, 0, 0)
```

When the new opcode syntax is used, the default call semantics is by
reference, instead of copy. The exceptions are when local sampling
rate or local ksmps are used, when pass-by-copy is used. In
pass-by-reference semantics all arguments data are shared between the
caller and the UDO. 

The classic opcode syntax always implies pass-by-copy. 

## Local Sampling Rate for UDOs

UDOs can now be set to a local sampling rate, which may be higher
or lower than the calling environment. The opcodes `oversample` and
`undersample` are used to set the local sampling rate. The limitations
are that the sampling rate always needs to be an integer multiple or
divisor of the caller sampling rate and local ksmps are not allowed 
together with local sampling rates.

## Functional Style Enhancements

Multiple output arguments can now be used in functional style, e.g.

```csound-orc
nchnls = 2
instr 1
  sig:a = rand(0dbfs/10)
  aL,aR = pan2(sig, 3/4)
  out(aL, aR)
endin
schedule(1, 0, 1)
```

Additionally, the new parser makes functional expressions behave
exactly as the classic syntax, with no penalties.

<!--
For-Loop
<span style="color:red">Is it going to happen??</span>
-->

## User-Defined Types

The type system in Csound 7 is very sophisticated and it allows new
types to be added using Csound code (similarly to user-defined
opcodes). Once created, these types are available to define new
variables, arguments etc.

```csound-orc
struct MyType val0:i, val1:i

instr 1
testVal:MyType init 8, 88
print(testVal.val0)
print(testVal.val1)
endin
schedule(1, 0, 0)
```

## Instrument Definition Type

Csound 7 introduces a new type `InstrDef` to hold instrument
definitions. The _name_ of an instrument becomes a global constant of
that type, which may be referred directly in the code, 

```
instr Ping
 out(oscili(expon(p4,p3,0.001), p5))
 schedule(Ping,0.1,0.2,rnd(0.5),500+rnd(100))
endin
schedule(Ping,0,0.2,0.5,500)
```

Furthermore, instrument definitions can be created directly from
Csound code. If the `InstrDef` var is not yet available, we
can use the self-reference `this_instr`. The following
code demonstrates this,

```
Ping:InstrDef = create({{
  out(oscili(expon(p4,p3,0.001),p5))
  schedule(this_instr,0.1,0.2,rnd(0.5),500+rnd(100))
  }})
schedule(Ping,0,0.2,0.5,500)
```

Notice that with this code pattern, we do not need to enclose the
instrument inside `instr` and `endin`, and the instrument
number is assigned dynamically.

## Instrument Instance Type

Instrument instances can be assigned to variables and manipulated
by opcodes.


## Opcode Reference and Opcode Types

References to opcodes can be assigned to variables and instantiated
as Opcode-type objects.

## Complex Type

Complex numbers are supported natively in the language now.

## Limitations Removed

The previous power-of-two limitation for table sizes has been removed,
so that any size tables can be used everywhere.

The limitation of event parameter numbers has been lifted, any number
of parameters are possible everywhere.
