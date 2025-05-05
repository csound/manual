<!--
id:poscil
category:Signal Generators:Basic Oscillators
-->
# poscil
High precision oscillator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = poscil(aamp, acps [, ifn, iphs])
    ares = poscil(aamp, kcps [, ifn, iphs])
    ares = poscil(kamp, acps [, ifn, iphs])
    ares = poscil(kamp, kcps [, ifn, iphs])
    ires = poscil(kamp, kcps [, ifn, iphs])
    kres = poscil(kamp, kcps [, ifn, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares poscil aamp, acps [, ifn, iphs]
    ares poscil aamp, kcps [, ifn, iphs]
    ares poscil kamp, acps [, ifn, iphs]
    ares poscil kamp, kcps [, ifn, iphs]
    ires poscil kamp, kcps [, ifn, iphs]
    kres poscil kamp, kcps [, ifn, iphs]
    ```

### Initialization

_ifn_ -- (optional) function table number. This defaults to -1 which indicates a sinewave.

_iphs_ (optional, default=0) -- initial phase (normalized table index 0-1).  If a negative value is given initialisation of the phase is skipped.

### Performance

_ares_ -- output signal

_kamp_, _aamp_ -- the amplitude of the output signal.

_kcps_, _acps_ -- the frequency of the output signal in cycles per second.

_poscil_ (precise oscillator) is the same as [oscili](../opcodes/oscili.md), but always employs floating-point table indexing, instead of integer math, like _oscil_ and _oscili_ (which can use either alternatively, depending on the table size). It is only a bit slower than _oscili_ when reading power-two size tables.

The opcode [poscil3](../opcodes/poscil3.md) is the same as  _poscil_, but uses cubic interpolation.

## Examples

=== "Modern"
    Here is an example of the poscil opcode. It uses the file [poscil-modern.csd](../examples/poscil-modern.csd).
    ``` csound-orc title="Example of the poscil opcode." linenums="1"
    --8<-- "examples/poscil-modern.csd"
    ```

=== "Classic"
    Here is an example of the poscil opcode. It uses the file [poscil.csd](../examples/poscil.csd).
    ``` csound-orc title="Example of the poscil opcode." linenums="1"
    --8<-- "examples/poscil.csd"
    ```

## See also

[Basic Oscillators](../siggen/basic.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1998<br>

November 2002. Added a note about the changes to Csound version 4.22, thanks to Rasmus Ekman.

New in Csound version 3.52

Function table optional in Csound version 6.00

Skip of initialisation new in version 6.06
