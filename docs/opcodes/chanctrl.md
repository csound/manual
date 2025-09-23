<!--
id:chanctrl
category:Real-time MIDI:Input
-->
# chanctrl
Get the current value of a MIDI channel controller and optionally map it onto specified range.

## Syntax
=== "Modern"
    ``` csound-orc
    ival = chanctrl(ichnl, ictlno [, ilow] [, ihigh])
    kval = chanctrl(ichnl, ictlno [, ilow] [, ihigh])
    ```

=== "Classic"
    ``` csound-orc
    ival chanctrl ichnl, ictlno [, ilow] [, ihigh]
    kval chanctrl ichnl, ictlno [, ilow] [, ihigh]
    ```

### Initialization

_ichnl_ -- the MIDI channel (1-16).

_ictlno_ -- the MIDI controller number (0-127).

_ilow_, _ihigh_ -- low and high ranges for mapping

## Examples

=== "Modern"
    Here is an example of the chanctrl opcode. It uses the file [chanctrl-modern.csd](../examples/chanctrl-modern.csd).
    ``` csound-csd title="Example of the chanctrl opcode." linenums="1"
    --8<-- "examples/chanctrl-modern.csd"
    ```

=== "Classic"
    Here is an example of the chanctrl opcode. It uses the file [chanctrl.csd](../examples/chanctrl.csd).
    ``` csound-csd title="Example of the chanctrl opcode." linenums="1"
    --8<-- "examples/chanctrl.csd"
    ```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Mike Berry<br>
Mills College<br>
May, 1997<br>

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
