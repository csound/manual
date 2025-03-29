# Traditional and Functional Code Style

Since Csound 6 it is possible to write Csound orchestra code in functional style. Csound 7 removed some limitations so that now both ways of Csound code can be used universally.

The traditional way of writing Csound code has the output of an opcode left of the opcode name, separated by a space or tab. If there are several outputs, they are separated by commas. The input argument is written at the right hand side of the opcode name, separated by a space or tab. If there are several inputs, they are separated by commas.

```csound-orc
aLeft, aRight pan2 aSig, 0.5
```

The functional way of writing Csound code sets an equal sign between output(s) and opcode name, and puts the input argument(s) in parenthesis which follow the opcode name. The rate of the opcode (`i` or `k` or `a`) is specified after a colon which follows the opcode name.

```csound-orc
aLeft, aRight = pan2:a(aSig, 0.5)
```

In the case of `pan2` the `:a` can be omitted because `pan2` only has this a-rate version. Other opcodes have different rates so that specifying the rate is mandatory in Csound 6. 

``` csound-orc
aSig = oscili:a(0.2, 400)
kSig = oscili:k(10, 0.5)
```

In Csound 7, the parser selects the appropriate rate by the output variable so that this code is fine, too:

``` csound-orc
aSig = oscili(0.2, 400)
kSig = oscili(10, 0.5)
```
