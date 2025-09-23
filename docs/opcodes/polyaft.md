<!--
id:polyaft
category:Real-time MIDI:Input
-->
# polyaft
Returns the polyphonic after-touch pressure of the selected note number, optionally mapped to an user-specified range.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = polyaft(inote [, ilow] [, ihigh])
    kres = polyaft(inote [, ilow] [, ihigh])
    ```

=== "Classic"
    ``` csound-orc
    ires polyaft inote [, ilow] [, ihigh]
    kres polyaft inote [, ilow] [, ihigh]
    ```

### Initialization

_inote_ -- note number. Normally set to the value returned by [notnum](../opcodes/notnum.md)

_ilow_ (optional, default: 0) -- lowest output value

_ihigh_ (optional, default: 127) -- highest output value

### Performance

_kres_ -- polyphonic pressure (aftertouch).

## Examples

Here is an example of the polyaft opcode. It uses the file [polyaft.csd](../examples/polyaft.csd).

Do not forget that you must include the [-F flag](../invoke/cs-options-alphabetically.md#-f-file-midifilefile) when using an external MIDI file like &#8220;polyaft.mid&#8221;.

``` csound-csd title="Example of the polyaft opcode." linenums="1"
--8<-- "examples/polyaft.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Added thanks to an email from Istvan Varga

New in version 4.12
