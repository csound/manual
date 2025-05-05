<!--
id:poscil3
category:Signal Generators:Basic Oscillators
-->
# poscil3
High precision oscillator with cubic interpolation.

_poscil3_ (precise oscillator) is the same as [oscil3](../opcodes/oscil3.md), but
always employs floating-point table indexing, instead of integer math. It is only a bit slower than _oscil3_ when reading power-two size tables.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = poscil3(aamp, acps [, ifn, iphs])
    ares = poscil3(aamp, kcps [, ifn, iphs])
    ares = poscil3(kamp, acps [, ifn, iphs])
    ares = poscil3(kamp, kcps [, ifn, iphs])
    ires = poscil3(kamp, kcps [, ifn, iphs])
    kres = poscil3(kamp, kcps [, ifn, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares poscil3 aamp, acps [, ifn, iphs]
    ares poscil3 aamp, kcps [, ifn, iphs]
    ares poscil3 kamp, acps [, ifn, iphs]
    ares poscil3 kamp, kcps [, ifn, iphs]
    ires poscil3 kamp, kcps [, ifn, iphs]
    kres poscil3 kamp, kcps [, ifn, iphs]
    ```

### Initialization

_ifn_ -- (optional) function table number.  This defaults to -1 which indicates a sinewave.

_iphs_ (optional, default=0) -- initial phase (normalized table index 0-1).  If a negative value is given initialisation of the phase is skipped.

### Performance

_ares_ -- output signal

_kamp_, _aamp_ -- the amplitude of the output signal.

_kcps_, _acps_ -- the frequency of the output signal in cycles per second.

_poscil3_ works like [poscil](../opcodes/poscil.md), but uses cubic interpolation.

## Examples

Here is an example of the poscil3 opcode. It uses the file [poscil3.csd](../examples/poscil3.csd).

``` csound-orc title="Example of the poscil3 opcode." linenums="1"
--8<-- "examples/poscil3.csd"
```

Here is another example of the poscil3 opcode, which uses a table filled from a sound file. It uses the file [poscil3-file.csd](../examples/poscil3-file.csd).

``` csound-orc title="Another example of the poscil3 opcode." linenums="1"
--8<-- "examples/poscil3-file.csd"
```

## See also

[Basic Oscillators](../siggen/basic.md)

## Credits

Authors: John ffitch, Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.52

variants with a-rate amplitude or frequency new in 5.16

Function table optional in Csound version 6.00

Skip of initialisation new in version 6.06
