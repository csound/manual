<!--
id:deltapxw
category:Signal Modifiers:Delay
-->
# deltapxw
Mixes the input signal to a delay line.

_deltapxw_ mixes the input signal to a delay line. This opcode can be mixed with reading units ([deltap](../opcodes/deltap.md), [deltapn](../opcodes/deltapn.md), [deltapi](../opcodes/deltapi.md), [deltap3](../opcodes/deltap3.md), and [deltapx](../opcodes/deltapx.md)) in any order; the actual delay time is the difference of the read and write time. This opcode can read from and write to a [delayr](../opcodes/delayr.md)/[delayw](../opcodes/delayw.md) delay line with interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    deltapxw(ain, adel, iwsize)
    ```

=== "Classic"
    ``` csound-orc
    deltapxw ain, adel, iwsize
    ```

### Initialization

_iwsize_ -- interpolation window size in samples. Allowed values are integer multiplies of 4 in the range 4 to 1024. _iwsize_ = 4 uses cubic interpolation.  Increasing _iwsize_ improves sound quality at the expense of CPU usage, and minimum delay time.

### Performance

_ain_ -- Input signal.

_adel_ -- Delay time in seconds.

``` csound-orc linenums="1"
a1  delayr   idlr
    deltapxw a2, adl1, iws1
a3  deltapx  adl2, iws2
    deltapxw a4, adl3, iws3
    delayw   a5
```

Minimum and maximum delay times:

```
idlr >= 1/kr                                Delay line length
 
adl1 >= (iws1/2)/sr                         Write before read
adl1 <= idlr - (1 + iws1/2)/sr              (allows shorter delays)
 
adl2 >= 1/kr + (iws2/2)/sr                  Read time
adl2 <= idlr - (1 + iws2/2)/sr
adl2 >= adl1 + (iws1 + iws2) / (2*sr)
adl2 >= 1/kr + adl3 + (iws2 + iws3) / (2*sr)
 
adl3 >= (iws3/2)/sr                         Write after read
adl3 <= idlr - (1 + iws3/2)/sr              (allows feedback)
```

> :memo: **Note**
>
> Window sizes for opcodes other than _deltapx_ are: _deltap_, _deltapn_: 1, _deltapi_: 2 (linear), _deltap3_: 4 (cubic)

## Examples

Here is an example of the deltapxw opcode. It uses the file [deltapxw.csd](../examples/deltapxw.csd).

``` csound-csd title="Example of the deltapxw opcode." linenums="1"
--8<-- "examples/deltapxw.csd"
```

## See also

[Delay](../sigmod/delayops.md)

## Credits

Author: Istvan Varga<br>
August 2001<br>

New in version 4.13
