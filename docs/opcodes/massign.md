<!--
id:massign
category:Real-time MIDI:Input
-->
# massign
Assigns a MIDI channel number to a Csound instrument.

## Syntax
=== "Modern"
    ``` csound-orc
    massign(ichnl, insnum[, ireset])
    massign(ichnl, "insname"[, ireset])
    ```

=== "Classic"
    ``` csound-orc
    massign ichnl, insnum[, ireset]
    massign ichnl, "insname"[, ireset]
    ```

### Initialization

_ichnl_ -- MIDI channel number (1-16).

_insnum_ -- Csound orchestra instrument number. If zero or negative, the channel is muted (i.e. it does not trigger a csound instrument, though information will still be received by opcodes like [midiin](../opcodes/midiin.md)).

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

_ireset_ -- If non-zero resets the controllers; default is to reset.

### Performance

Assigns a MIDI channel number to a Csound instrument. Also useful to make sure a certain instrument (if its number is from 1 to 16) will not be triggered by midi noteon messages (if using something [midiin](../opcodes/midiin.md) to interpret midi information). In this case set _insnum_ to 0 or a negative number.

If _ichan_ is set to 0, the value of _insnum_ is used for all channels. This way you can route all MIDI channels to a single Csound instrument. You can also disable triggering of instruments from MIDI note events from all channels with the following line:

``` csound-orc
massign 0,0
```

This can be useful if you are doing all MIDI evaluation within Csound with an always on instrument(e.g. using [midiin](../opcodes/midiin.md) and [turnon](../opcodes/turnon.md)) to avoid doubling the instrument when a note is played.

## Examples

Here is an example of the massign opcode. It uses the file [massign.csd](../examples/massign.csd).

``` csound-csd title="Example of the massign opcode." linenums="1"
--8<-- "examples/massign.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

[Orchestra Header Statements](../orch/header.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT, Cambridge, Mass.<br>

New in Csound version 3.47

_ireset_ parameter new in Csound5

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel range.
