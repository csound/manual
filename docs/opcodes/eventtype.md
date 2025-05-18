<!--
id:eventtype
category:MIDI files:MIDI input and Initialization
-->
# eventtype
Returns the event type for an instrument.


## Syntax
=== "Modern"
    ``` csound-orc
   type:i = eventtype()
    ```

=== "Classic"
    ``` csound-orc
    itype eventtype
    ```

_type_ -- the type of event triggering this instrument, 0 - for realtime or score events, 1 - for MIDI events.


## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Victor Lazzarini<br>
March 2025<br>
New in Csound 7<br>
