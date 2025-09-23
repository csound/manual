<!--
id:ntom
category:Pitch Converters:Functions
-->
# ntom
Convert note name to midi note number.

Plugin opcode in emugens.

It allows note name to include microtones or a deviation in cents.

## Syntax
=== "Modern"
    ``` csound-orc
    kmidi = ntom(Snote)
    imidi = ntom(Snote)
    ```

=== "Classic"
    ``` csound-orc
    kmidi ntom Snote
    imidi ntom Snote
    ```

### Performance

_Snote_ -- Note name

_kmidi_ -- Midi note number

Example of note names:

```
midi    note name
-------------------
60      4C
60.4    4C+40
60.5    4C+
60.9    4Db-10
61      4C#
61.5    4D-
```

> :memo: **Note**
>
> 4C is the central C in the piano

## Examples

Here is an example of the ntom opcode. It uses the file [mton-ntom.csd](../examples/mton-ntom.csd).

``` csound-csd title="Example of the ftom opcode." linenums="1"
--8<-- "examples/mton-ntom.csd"
```

## See also

[Pitch Converters: Functions](../pitch/funcs.md)

[Midi Converters](../midi/convert.md)

## Credits

By: Eduardo Moguillansky 2017
