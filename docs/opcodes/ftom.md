<!--
id:ftom
category:Pitch Converters:Functions
-->
# ftom
Convert frequency to midi note number, taking global value of A4 into account.

Plugin opcode in emugens.

## Syntax
=== "Modern"
    ``` csound-orc
    imidi = ftom(ifreq [,irnd])
    kmidi = ftom(kfreq [,irnd])
    imidis[] = ftom(ifreqs[] [,irnd])
    kmidis[] = ftom(kfreqs[] [,irnd])
    ```

=== "Classic"
    ``` csound-orc
    imidi ftom ifreq [,irnd]
    kmidi ftom kfreq [,irnd]
    imidis[] ftom ifreqs[] [,irnd]
    kmidis[] ftom kfreqs[] [,irnd]
    ```

### Performance

_kfreq_ / _ifreq_ -- Frequency

_irnd_ -- Optional, if non-zero the result is rounded to the nearest integer (default zero).

_kmidi_ / _imidi_ -- Corresponding midi note number

> :memo: **Note**
>
> Set the global [A4](../opcodes/A4.md) value at the header to modify the tuning

## Examples

Here is an example of the ftom opcode. It uses the file [mtof-ftom.csd](../examples/mtof-ftom.csd).

``` csound-csd title="Example of the ftom opcode." linenums="1"
--8<-- "examples/mtof-ftom.csd"
```

## See also

[Pitch Converters: Functions](../pitch/funcs.md)

[Midi Converters](../midi/convert.md)

## Credits

By: Eduardo Moguillansky 2017

New in version 6.09

Rounding option new in 6.12

Array version new in 6.13
