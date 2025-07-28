# What's new in Csound 7

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

In this syntax, global variables are annotated with an `@global` sign,
at the time of creation, then used freely in the code,

```
freq@global:k = init(0)
```

In addition to this, a number of new standard variable types have been
introduced, which are outlined below. These new types are only
available under explicit semantics. 

## Functional Style Improvements

Multiple output arguments can now be used in functional style, e.g.

```csound-orc title="Multiple output arguments in functional style"
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

## Boolean Types

Boolean variable types `b` and `B` have been exposed, with two constants `true` and
`false` also introduced for convenience,

```
test:b = a > b
if test then
 prints "true test\n"
else 
 prints "false test\n"
endif
```

The `b` type operates at i-time only. For perf-time tests, we use
the `B` type instead.

## Complex Type

Complex numbers are supported natively in the language now. All
basic complex arithmetic operations and functions are supported
for both scalars and arrays. For example, the following code
implements single-sideband modulation using `Complex` arrays 

```csound-orc title="Complex type"
instr 1
 sig:Complex[] = hilbert(oscili(p4,p5))
 mod:Complex[] = oscili(0.5,100,-1,0.25), oscili(0.5,100)
 ssb:Complex[] = mod * sig
 out real(ssb)
endin
```

## Instrument Definition Type

Csound 7 introduces a new type `InstrDef` to hold instrument
definitions. The _name_ of an instrument becomes a global constant of
that type, which may be referred directly in the code, 

```csound-orc
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

```csound-orc
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

A new type for instrument instances is also present, `Instr`.
Instrument instances can be assigned to variables and manipulated
by various opcodes. For example, 

```csound-orc
instr Container
  myInstr:InstrDef = create({{ out Osci(p4,p5) }})
  myInstance:Instr = create(myInstr)
  err1:i = init(myInstance,0.5,440)
  err2:k = perf(myInstance)
  delete(myInstance) 
  delete(myInstr) 
endin
```

In addition to these, several other opcodes can be used to 
manipulate instances in Csound code.

## Opcode Reference and Opcode Types

References to opcodes can be assigned to variables and instantiated
as Opcode-type objects, for example

```csound-orc
instr 1
  obj:Opcode = create(oscili)
  sig:a = run(obj, p4, p5)
  out(sig)
endin
```

Opcode objects may be invoked in loops, passed as parameters, have
their init and perf functions executed, exist in arrays, etc. 
For example, we can run an array of opcodes in parallel,

```csound-orc title="Array of opcodes in parallel"
instr 1
  freq:i[] = [300, 400, 500, 600]
  obj:Opcode[] = create(reson, lenarray(freq))
  src:a = rand(linenr(.1,0.1,0.1,0.01),2,1)
  sig:a[] = run(obj, src, freq, freq/7, 2)
  out(sig[0]+sig[1],sig[2]+sig[3])
endin
schedule(1,0,10)
```

or in series

```csound-orc title="Array of opcodes in series"
   obj:Opcode[] = create(reson, 4)
   sig:a = rand(linenr(p4,0.1,0.1,0.01))
   sig = run(obj, sig, p5, p5/p6, 1)
```

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

## New-style UDO Syntax and Pass-by-reference

User Defined Opcodes now follow the syntax `opcode
name(inargs):(outargs)`, with types defined explicitly.

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
caller and the UDO. The classic opcode syntax always implies
pass-by-copy, as before. 

When using the newly-introduced standard types, and user-defined
types, the new-style syntax is mandatory as there is no support for
multi-character types in the classic UDO form.

## Local Sampling Rate for UDOs

UDOs can now be set to a local sampling rate, which may be higher
or lower than the calling environment. The opcodes `oversample` and
`undersample` are used to set the local sampling rate. The limitations
are that the sampling rate always needs to be an integer multiple or
divisor of the caller sampling rate and local ksmps are not allowed 
together with local sampling rates.

## Array Initializers, Generators, Slices

Arrays can be initialised by using a shorthand form, 
which is translated into a `fillarray` expression

```csound-orc title="Array initialization"
instr 1
  foo:i[] = [1,2,3]  // foo:i[] = fillarray(1,2,3)
  bar:k[] = [4,5,6]  // etc
  print(foo[1])
  printk(0,bar[1])
  turnoff
endin
schedule(1, 0, 1)
```

For array generation, a similar form exists, which is translated into
`genarray`

```csound-orc title="Array generation"
instr 1
  foo:i[] = [1 ... 10, 2]  // foo:i[] = genarray(1,10,2)
  print(foo[1]) // prints 3
endin
```

Slices are similarly treated, with a slightly different syntax (and
invoking `slicearray`)

```csound-orc title="Array generation"
instr 1
  foo:i[] = [1,2,3,4,5]  
  bar:i[] = [1 : 3, 1] // slicearray(1,3,1)
  print(bar[0]) // prints 2
endin
```

## For-Loop

In extension to the already existing `while` loop, also `for` can be used.

```csound-orc title="For-loop"
/* for-in loop
   for var in array do
     ...
   od
   running either at i or k (perf) time
*/

/* case 1
   loop var is not declared
   loop type follows array type
   (i-type in this case)
*/
instr 1
  for j in [1,2,3] do
    print j
  od
endin

/* case 2
   loop var is declared
   loop type follows var type
   regardless of array type
*/
instr 2
  j:k init 0
  for j in [1,2,3] do
    printk2 j
  od
  turnoff
endin
```

## UDP Server OSC message support

The UDP server now has builtin support for OSC messages. It also
includes message addresses for channels and events. To
access these messages a new overload of `OSClisten` is provided,
taking the message address and type only and returning the message
data,

```csound-orc
instr 1
 freq:k = chnget("freq")
 amp:k = chnget("amp")
    out oscili(0dbfs*amp, p4*freq)
 status:k, f:k, mess:S, n:k = OSClisten("/in", "fsi")
 puts mess, status
 printk2 n
 printk2 f
 status, nums:k[] = OSClisten("/ina", "fi")
 printk2 nums[0]
 printk2 nums[1] 
endin
```

which can be controlled by the following messages,

```
instr 2
 OSCsend 0, "localhost", 7000, "/csound/event/instr", "ffff", 1, 0, 1, 300
 OSCsend 1, "localhost", 7000, "/csound/channel/freq/amp", "ff", p4, p5
 OSCsend 2, "localhost", 7000, "/in", "fsi", p5, "hello", p4
 OSCsend 3, "localhost", 7000, "/ina", "fi", p5, p4
 OSCsend 4, "localhost", 7000, "/csound/event", "s", "i3 4 1"
 OSCsend 5, "localhost", 7000, "/csound/compile", "s", "schedule 1,2,2,500"
endin
```

## MIDI File Input Opcodes

Support for multiple MIDI input files with port mapping has been
added. Opcodes for opening files and transport control are available.

## Unary-minus Precedence 

The precedence of unary minus has been changed to match other
programming languages such as Python, Perl, Ruby, etc. Now it
has the same precedence as binary minus, as opposed to the
highest precedence.

The only significant impact is observed in expressions involving
exponentiation:

```
a = -2^2 // -4 now, before was (-2)^2 = 4 
```

If users have encountered this type of expression in the past, code
may need to be adapted to the new semantics.

## Limitations Removed

The previous power-of-two limitation for table sizes has been removed,
so that any size tables can be used everywhere.

The limitation of event parameter numbers has been lifted, any number
of parameters are possible everywhere.

Multi-line strings (`{{ }}`) can now be used inside other multi-line
strings (with any number of embedding levels).

