<!--
id:sndloop
category:Signal Generators:Sample Playback
-->
# sndloop
A sound looper with pitch control.

This opcode records input audio and plays it back in a loop with user-defined duration and crossfade time. It also allows the pitch of the loop to be controlled, including reversed playback.

## Syntax
=== "Modern"
    ``` csound-orc
    asig, krec = sndloop(ain, kpitch, ktrig, idur, ifad)
    ```

=== "Classic"
    ``` csound-orc
    asig, krec sndloop ain, kpitch, ktrig, idur, ifad
    ```

### Initialization

_idur _ -- loop duration in seconds

_ifad _ -- crossfade duration in seconds

### Performance

_asig_ -- output sig

_krec_ -- 'rec on' signal, 1 when recording, 0 otherwise

_kpitch_ -- pitch control (transposition ratio); negative values play the loop back in reverse

_ktrig_ -- trigger signal: when 0, processing is bypassed. When switched on (ktrig >= 1), the opcode starts recording until the loop memory is full. It then plays the looped sound until it is switched off again (ktrig = 0). Another recording can start again with ktrig >= 1.

## Examples

Here is an example of the sndloop opcode. It uses the file [sndloop.csd](../examples/sndloop.csd).

``` csound-csd title="Example of the sndloop opcode." linenums="1"
--8<-- "examples/sndloop.csd"
```

The example above shows the basic operation of sndloop. Pitch can be controlled at the k-rate, recording is started as soon as the trigger value is >= 1. Recording can be restarted by making the trigger 0 and then 1 again.

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: Victor Lazzarini<br>
April 2005 <br>

New in Version 5.00
