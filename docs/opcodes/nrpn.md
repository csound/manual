<!--
id:nrpn
category:Real-time MIDI:Output
-->
# nrpn
Sends a NPRN (Non-Registered Parameter Number) message to the MIDI OUT port each time one of the input arguments changes.

## Syntax
=== "Modern"
    ``` csound-orc
    nrpn(kchan, kparmnum, kparmvalue)
    ```

=== "Classic"
    ``` csound-orc
    nrpn kchan, kparmnum, kparmvalue
    ```

### Performance

_kchan_ -- MIDI channel (1-16)

_kparmnum_ -- number of NRPN parameter

_kparmvalue_ -- value of NRPN parameter

This opcode sends new message when the MIDI translated value of one of the input arguments changes. It operates at k-rate. Useful with the MIDI instruments that recognize NRPNs (for example with the newest sound-cards with internal MIDI synthesizer such as SB AWE32, AWE64, GUS etc. in which each patch parameter can be changed during the performance via NRPN)

## Examples

Here is an example of the nrpn opcode. It uses the file [nrpn.csd](../examples/nrpn.csd).

``` csound-csd title="Example of the nrpn opcode." linenums="1"
--8<-- "examples/nrpn.csd"
```

## See also

[MIDI Message Output](../midi/output.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1998<br>

New in Csound version 3.492

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
