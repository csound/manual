<!--
id:mrtmsg
category:Real-time MIDI:System Realtime
-->
# mrtmsg
Send system real-time messages to the MIDI OUT port.

## Syntax
=== "Modern"
    ``` csound-orc
    mrtmsg(imsgtype)
    ```

=== "Classic"
    ``` csound-orc
    mrtmsg imsgtype
    ```

### Initialization

_imsgtype_ -- type of real-time message:

* 1 sends a START message (0xFA);
* 2 sends a CONTINUE message (0xFB);
* 0 sends a STOP message (0xFC);
* -1 sends a SYSTEM RESET message (0xFF);
* -2 sends an ACTIVE SENSING message (0xFE)

### Performance

Sends a real-time message once, in init stage of current instrument. _imsgtype_ parameter is a flag to indicate the message type.

## See Also

[mclock](../opcodes/mclock.md)

[System Realtime Messages](../midi/realtime.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47
