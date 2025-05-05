<!--
id:deltapx
category:Signal Modifiers:Delay
-->
# deltapx
Read from or write to a delay line with interpolation.

_deltapx_ is similar to [deltapi](../opcodes/deltapi.md) or [deltap3](../opcodes/deltap3.md). However, it allows higher quality interpolation. This opcode can read from and write to a _delayr/delayw_ delay line with interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = deltapx(adel, iwsize)
    ```

=== "Classic"
    ``` csound-orc
    aout deltapx adel, iwsize
    ```

### Initialization

_iwsize_ -- interpolation window size in samples. Allowed values are integer multiplies of 4 in the range 4 to 1024. _iwsize_ = 4 uses cubic interpolation. Increasing _iwsize_ improves sound quality at the expense of CPU usage, and minimum delay time.

### Performance

_aout_ -- Output signal.

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

Here is an example of the deltapx opcode. It uses the file [deltapx.csd](../examples/deltapx.csd).

``` csound-csd title="Example of the deltapx opcode." linenums="1"
--8<-- "examples/deltapx.csd"
```

## See also

[Delay](../sigmod/delayops.md)

## Credits

Author: Istvan Varga<br>
August 2001<br>

New in version 4.13
