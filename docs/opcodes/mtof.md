<!--
id:mtof
category:Pitch Converters:Functions
-->
# mtof
Convert a midi note number value to frequency, taking global value of A4 into account.

Plugin opcode in emugens.

## Syntax
=== "Modern"
    ``` csound-orc
    ifreq = mtof(imidi)
    kfreq = mtof(kmidi)
    ifreqs[] = mtof(imidis[])
    kfreqs[] = mtof(kmidis[])
    ```

=== "Classic"
    ``` csound-orc
    ifreq mtof imidi
    kfreq mtof kmidi
    ifreqs[] mtof imidis[]
    kfreqs[] mtof kmidis[]
    ```

### Performance

_kmidi_ / _imidi_ -- Midi note number (also as array)

_kfreq_ / _ifreq_ -- Frequency corresponding to midi note value. An array is returned if the input is an array

## Examples

Here is an example of the mtof opcode. It uses the file [mtof-ftom.csd](../examples/mtof-ftom.csd).

``` csound-csd title="Example of the mtof opcode." linenums="1"
--8<-- "examples/mtof-ftom.csd"
```

## See also

[Pitch Converters: Functions](../pitch/funcs.md)

[Midi Converters](../midi/convert.md)

## Credits

By: Eduardo Moguillansky 2017

New plugin in version 6.11

Array version new in 6.13
