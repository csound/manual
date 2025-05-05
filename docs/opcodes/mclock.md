<!--
id:mclock
category:Real-time MIDI:System Realtime
-->
# mclock
Sends a MIDI CLOCK message.

## Syntax
=== "Modern"
    ``` csound-orc
    mclock(ifreq)
    ```

=== "Classic"
    ``` csound-orc
    mclock ifreq
    ```

### Initialization

_ifreq_ -- clock message frequency rate in Hz

### Performance

Sends a MIDI CLOCK message (0xF8) every 1/_ifreq_ seconds. So _ifreq_ is the frequency rate of CLOCK message in Hz.

## Examples

Here is an example of the mclock opcode. It uses the file [mclock.csd](../examples/mclock.csd).

``` csound-csd title="Example of the mclock opcode." linenums="1"
--8<-- "examples/mclock.csd"
```

## See Also

[mrtmsg](../opcodes/mrtmsg.md)

[System Realtime Messages](../midi/realtime.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47
