# Instruments

Instruments are the main building blocks in Csound. An instrument definition starts with the keyword [instr](../opcodes/instr.md), followed by a space, and a number or name. In case the numbers or names are separated by comma, the same instrument definition applies to different instrument numbers or names. The instrument definition ends with the keywor [endin](../opcodes/endin.md).

``` csound-orc
instr 10
  puts("instrument 10", 1)
endin

instr printme
  puts("instrument 'printme'", 1)
endin

instr Multiple, 2, 3
  print(p1)
endin
```

## Named Instruments

An instrument name may consist of any number of letters, digits, and the underscore (_) character, however, the first character must not be a digit. Optionally, the instrument name may be prefixed with the '+' character (see below), for example:

``` csound-orc
instr +Reverb
```

For all instrument names, a number is automatically assigned (note: if the message level (-m) is not zero, these numbers are printed to the console during orchestra compilation), following these rules:

- Any unused instrument numbers are taken up in ascending order, starting from 1.  
- The numbers are assigned in the order of instrument name definition, so named instruments that are defined later will always have a higher number (except if the '+' modifier is used).  
- If the instrument name was prefixed with '+', the assigned number will be higher than that of any of the (both numbered and named) other instruments without '+'. If there are multiple '+' instruments, the numbering of these will follow the order of definition, according to the above rule.

Using '+' is mainly useful for global output or effect instruments, that must be performed after the other instruments.

An example for instrument numbers:

``` csound-orc
instr 1, 2
endin

instr Instr1
endin

instr +Effect1, Instr2
endin

instr 100, Instr3, +Effect2, Instr4, 5
endin
```

In this example, the instrument numbers are assigned as follows:

```
Instr1:  3
Effect1: 101
Instr2:  4
Instr3:  6
Effect2: 102
Instr4:  7
```

Named instruments can be called by using the name in double quotes (note: the '+' character should be omitted), e.g.

``` csound-sco
i "Effect1" 0 60
```

in the score, or

``` csound-orc
schedule("Effect1", 0, 60)
```

in the orchestra code.

## Order of Execution

### Initialization

Initializing the instrument code follows the order as written in the text, regardless any instrument number. This is an example which increments a global i-variable:

``` csound-orc
giVal = 0

instr 10
  giVal += 1
  print(giVal)
endin
schedule(10, 0, 1)

instr printme
  giVal += 1
  print(giVal)
endin
schedule("printme", 0, 1)

instr Multiple, 2, 3
  giVal += 1
  print(giVal)
endin
schedule("Multiple", 0, 1)
schedule(2, 0, 1)
schedule(3, 0, 1)
```

This returns (in assigning instrument number 1 to `printme` and instrument number 4 to `Multiple`):

```
instr 10:	giVal = 1.000
instr 1:	giVal = 2.000
instr 4:	giVal = 3.000
instr 2:	giVal = 4.000
instr 3:	giVal = 5.000
```

### Performance

During performance the instruments are executed following their numbers (from low to high). This is an example which increments a global k-Variable:

``` csound-orc
gkVal init 0

instr 10
  gkVal += 1
  printk(0, gkVal)
  turnoff
endin
schedule(10, 0, 1)

instr printme
  gkVal += 1
  printk(0, gkVal)
  turnoff
endin
schedule("printme", 0, 1)

instr Multiple, 2, 3
  gkVal += 1
  printk(0, gkVal)
  turnoff
endin
schedule("Multiple", 0, 1)
schedule(2, 0, 1)
schedule(3, 0, 1)
```

This returns (in assigning instrument number 1 to 'printme' and instrument number 4 to 'Multiple'):

```
instr 1:	time     0.00000:     1.00000
instr 2:	time     0.00000:     2.00000
instr 3:	time     0.00000:     3.00000
instr 4:	time     0.00000:     4.00000
instr 10:	time     0.00000:     5.00000
```

## Instances and Events

Instrument code gets loaded into the audio engine as *instances*. Instances can be loaded simultaneously or sequentially without any predefined limit. 

Instances are called by *events*. These *instrument events* can originate from different sources:  
1. The standard numeric score as in `i 1 0 1`  
2. Orchestra opcodes as in `schedule(1,0,1)`  
3. MIDI note-on messages.  
4. Real-time input via keys, API or network.

Note that a new instrument instance tries to re-use the memory allocation of an old instance. This might result in unexpected behaviour as the second instance continues where the first instance left:

``` csound-orc
instr 1
  kVal = random:k(0, 10)
  prints("kVal initialized as %f\n", i(kVal))
  printks("kVal rendered as %f\n", 0, kVal)
  turnoff
endin
schedule(1, 0, 1)
schedule(1, 1, 1)
```

```
kVal initialized as 0.000000
kVal rendered as 8.828730
kVal initialized as 8.828730
kVal rendered as 2.913418
```

## Explicit Numbered Instances

If an instrument is called with a fractional number, this number indicates a certain instance. This feature allows to treat different instances in a different way.

``` csound-orc
instr 1
  print(p1)
  if (p1 == 1.001) then
    puts("hu", 1)
  else
    puts("ha", 1)  
  endif
endin
schedule(1.001, 0, 1)
schedule(1.002, 1, 1)

instr Two
  print(p1)
  if (p1 == 2.001) then
    puts("ho", 1)
  else
    puts("hi", 1)  
  endif
endin
schedule("Two.001", 2, 1)
schedule("Two.002", 3, 1)
```

This returns:

```
instr 1:	p1 = 1.001
hu
instr 1:	p1 = 1.002
ha
instr 2:	p1 = 2.001
ho
instr 2:	p1 = 2.002
hi
```
