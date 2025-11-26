<!--
id:flooper2
category:Signal Generators:Sample Playback
-->
# flooper2
Function-table-based crossfading looper.

This opcode implements a crossfading looper with variable loop parameters and three looping modes, optionally using a table for its crossfade shape. It accepts non-power-of-two tables for its source sounds, such as deferred-allocation GEN01 tables, with one or two channels.

## Syntax
=== "Modern"
    ``` csound-orc
    asig1[,asig2] = flooper2(kamp, kpitch, kloopstart, kloopend, kcrossfade, ifn \
                             [, istart, imode, ifenv, iskip])
    ```

=== "Classic"
    ``` csound-orc
    asig1[,asig2] flooper2 kamp, kpitch, kloopstart, kloopend, kcrossfade, ifn \
                           [, istart, imode, ifenv, iskip]
    ```

### Initialization

_ifn_ -- sound source function table number, generally created using GEN01

_istart_ -- playback start pos in seconds

_imode_ -- loop modes: 0 forward, 1 backward, 2 back-and-forth [def: 0]

_ifenv_ -- if non-zero, crossfade envelope shape table number. The default, 0, sets the crossfade to linear.

_iskip_ -- if 1, the opcode initialisation is skipped, for tied notes, performance continues from the position in the loop where the previous note stopped. The default, 0, does not skip initialisation

### Performance

_asig1[, asig2]_ -- output sig (mono or stereo).

_kamp_ -- amplitude control

_kpitch_ -- pitch control (transposition ratio); negative values are not allowed.

_kloopstart_ -- loop start point (secs). Note that although k-rate, loop parameters such as this are only updated once per loop cycle.

_kloopend_ -- loop end point (secs), updated once per loop cycle.

_kcrossfade_ -- crossfade length (secs), updated once per loop cycle and limited to loop length.

Mode 1 for _imode_ will only loop backwards from the end point to the start point.

## Examples

``` csound-orc
aout flooper2 16000, 1, 1, 5, 0.05, 1  ; loop starts at 1 sec, for 4 secs, 0.05 crossfade
     out      aout
```

The example above shows the basic operation of _flooper2_. Pitch can be controlled at the k-rate, as well as amplitude and loop parameters. The example assumes table 1 to contain at least 5.05 seconds of audio (4 secs loop duration, starting 1 sec into the table, using 0.05 secs after the loop end for the crossfade). Looping is in mode 0 (normal forward loop).

Here is another example of the flooper2 opcode. It uses the file [flooper2.csd](../examples/flooper2.csd) and [fox.wav](../examples/fox.wav).

``` csound-csd linenums="1"
--8<-- "examples/flooper2.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: Victor Lazzarini<br>
July 2006 <br>

New plugin in version 5

July 2006.
