<!--
id:mton
category:Pitch Converters:Functions
-->
# mton
Convert midi note number to string note name, with an accuracy of 1 cent.

## Syntax
=== "Modern"
    ``` csound-orc
    Snote = mton(kmidi)
    Snote = mton(imidi)
    ```

=== "Classic"
    ``` csound-orc
    Snote mton kmidi
    Snote mton imidi
    ```

### Performance

_kmidi_ / _imidi_ -- Midi note number

_Snote_ -- Note name

Example of note names:

```
midi    note number
-------------------
60      4C
60.4    4C+40
60.5    4C+
60.9    4Db-10
61      4C#
61.5    4D-
```

## Examples

Here is an example of the mton opcode. It uses the file [mton-ntom.csd](../examples/mton-ntom.csd).

``` csound-csd title="Example of the ftom opcode." linenums="1"
--8<-- "examples/mton-ntom.csd"
```

## See also

[Pitch Converters: Functions](../pitch/funcs.md)

[Midi Converters](../midi/convert.md)

## Credits

By: Eduardo Moguillansky 2017
