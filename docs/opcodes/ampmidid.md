<!--
id:ampmidid
category:Real-time MIDI:Converters
-->
# ampmidid
Musically map MIDI velocity to peak amplitude within a specified dynamic range in decibels.

Plugin opcode in ampmidid.

## Syntax
=== "Modern"
    ``` csound-orc
    iamplitude = ampmidid(ivelocity, idecibels)
    kamplitude = ampmidid(kvelocity, idecibels)
    ```

=== "Classic"
    ``` csound-orc
    iamplitude ampmidid ivelocity, idecibels
    kamplitude ampmidid kvelocity, idecibels
    ```

### Initialization

_iamplitude_ -- Amplitude.

_ivelocity_ -- MIDI velocity number, ranging from 0 through 127.

_idecibels_ -- Desired dynamic range in decibels.

### Performance

_kamplitude_ -- Amplitude.

_kvelocity_ -- MIDI velocity number, ranging from 0 through 127.

Musically map MIDI velocity to peak amplitude within a specified dynamic range in decibels: $a = (mv + b) ^ 2$, where $a$ = amplitude, $v$ = MIDI velocity, $r = 10 ^ {R / 20}$, $b = 127 / (126 \sqrt{r}) - 1 / 126$, $m = (1 - b) / 127$, and $R$ = specified dynamic range in decibels. See Roger Dannenberg, "The Interpretation of MIDI Velocity", in Georg Essl and Ichiro Fujinaga (Eds.), Proceedings of the 2006 International Computer Music Conference, November 6-11, 2006 (San Francisco: The International Computer Music Association), pp. 193-196.

## Examples

=== "Modern"
    Here is an example of the ampmidid opcode. It uses the file [ampmidid-modern.csd](../examples/ampmidid-modern.csd).
    ``` csound-csd title="Example of the ampmidid opcode." linenums="1"
    --8<-- "examples/ampmidid-modern.csd"
    ```

=== "Classic"
    Here is an example of the ampmidid opcode. It uses the file [ampmidid.csd](../examples/ampmidid.csd).
    ``` csound-csd title="Example of the ampmidid opcode." linenums="1"
    --8<-- "examples/ampmidid.csd"
    ```

## See also

[Midi Converters](../midi/convert.md)

## Credits

Author: Michael Gogins<br>
2006<br>
