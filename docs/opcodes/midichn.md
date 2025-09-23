<!--
id:midichn
category:Real-time MIDI:MIDI/Score Interoperability
-->
# midichn
Returns the MIDI channel number (1 - 16) from which the note was activated.

In the case of score notes, it returns 0.

## Syntax
=== "Modern"
    ``` csound-orc
    ichn = midichn()
    ```

=== "Classic"
    ``` csound-orc
    ichn midichn
    ```

### Initialization

_ichn_ -- channel number. If the current note was activated from score, it is set to zero.

## Examples

Here is a simple example of the midichn opcode. It uses the file [midichn.csd](../examples/midichn.csd).

``` csound-csd title="Example of the midichn opcode." linenums="1"
--8<-- "examples/midichn.csd"
```

Here is an advanced example of the midichn opcode. It uses the file [midichn_advanced.csd](../examples/midichn_advanced.csd).

Do not forget that you must include the [-F flag](../invoke/cs-options-alphabetically.md#-f-file-midifilefile) when using an external MIDI file like &#8220;midichn_advanced.mid&#8221;.

``` csound-csd title="An advanced example of the midichn opcode." linenums="1"
--8<-- "examples/midichn_advanced.csd"
```

Its output should include lines like:

```
note 1 (time = 0.00) was activated from channel 1
note 2 (time = 2.00) was activated from channel 4
note 3 (time = 3.00) was activated from channel 2
note 4 (time = 5.00) was activated from channel 3
```

## See also

[MIDI input and Initialization](../midi/input.md)

[MIDI/Score Interoperability](../midi/interop.md)

## Credits

Author: Istvan Varga<br>
May 2002<br>

New in version 4.20
