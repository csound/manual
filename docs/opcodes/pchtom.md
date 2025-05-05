<!--
id:pchtom
category:Pitch Converters:Functions
-->
# pchtom
Convert pch to midi note number.

Plugin opcode in emugens.

_pch_ representation has the form Octave.pitchclass, pitchclass being a number between 00 and 12.

```
pch        midi    note name
----------------------------
8.09       69      4A
8.00       60      4C
```

## Syntax
=== "Modern"
    ``` csound-orc
    imidi = pchtom(ipch)
    kmidi = pchtom(kpch)
    ```

=== "Classic"
    ``` csound-orc
    imidi pchtom ipch
    kmidi pchtom kpch
    ```

### Performance

_kpch_ / _ipch_ -- pitch represented as Octave.pitchclass

_kmidi_ / _imidi_ -- midi note number

> :memo: **Note**
>
> Use [pchmidinn](../opcodes/pchmidinn.md) to perform the opposite operation of this opcode.

## Examples

Here is an example of the pchtom opcode. It uses the file [pchtom.csd](../examples/pchtom.csd).

``` csound-csd title="Example of the pchtom opcode." linenums="1"
--8<-- "examples/pchtom.csd"
```

## See also

[Pitch Converters: Functions](../pitch/funcs.md)

[Midi Converters](../midi/convert.md)

## Credits

By: Eduardo Moguillansky 2017
