<!--
id:flooper
category:Signal Generators:Sample Playback
-->
# flooper
Function-table-based crossfading looper.

This opcode reads audio from a function table and plays it back in a loop with user-defined start time, duration and crossfade time. It also allows the pitch of the loop to be controlled, including reversed playback. It accepts non-power-of-two tables, such as deferred-allocation GEN01 tables, with one or two channels.

## Syntax
=== "Modern"
    ``` csound-orc
    asig1[, asig2] = flooper(kamp, kpitch, istart, idur, ifad, ifn)
    ```

=== "Classic"
    ``` csound-orc
    asig1[, asig2] flooper kamp, kpitch, istart, idur, ifad, ifn
    ```

### Initialization

_istart_ -- loop start pos in seconds

_idur_ -- loop duration in seconds

_ifad_ -- crossfade duration in seconds

_ifn_ -- function table number, generally created using GEN01

### Performance

_asig[,asig2]_ -- output sig (mono or stereo)

_kamp_ -- amplitude control

_kpitch_ -- pitch control (transposition ratio); negative values play the loop back in reverse

## Examples

``` csound-orc
aout flooper 16000, 1, 1, 4, 0.05, 1  ; loop starts at 1 sec, for 4 secs, 0.05 crossfade
     out     aout
```

The example above shows the basic operation of _flooper_. Pitch can be controlled at the k-rate, as well as amplitude. The example assumes table 1 to contain at least 5.05 seconds of audio (4 secs loop duration, starting 1 sec into the table, using 0.05 secs after the loop end for the crossfade).

Here is another example of the flooper opcode. It uses the file [flooper.csd](../examples/flooper.csd) and [fox.wav](../examples/fox.wav).

``` csound-csd linenums="1"
--8<-- "examples/flooper.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: Victor Lazzarini<br>
April 2005 <br>

New plugin in version 5

April 2005.
