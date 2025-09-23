<!--
id:syncgrain
category:Signal Generators:Granular Synthesis
-->
# syncgrain
Synchronous granular synthesis.

The source sound for the grains is obtained by reading a function table containing the samples of the source waveform. For sampled-sound sources, [GEN01](../scoregens/gen01.md) is used. _syncgrain_ will accept deferred allocation tables.

The grain generator has full control of frequency (grains/sec), overall amplitude, grain pitch (a sampling increment) and grain size (in secs), both as fixed or time-varying (signal) parameters. An extra parameter is the grain pointer speed (or rate), which controls which position the generator will start reading samples in the table for each successive grain. It is measured in fractions of grain size, so a value of 1 (the default) will make each successive grain read from where the previous grain should finish. A value of 0.5 will make the next grain start at the midway position from the previous grain start and finish, etc.. A value of 0 will make the generator read always from a fixed position of the table (wherever the pointer was last at). A negative value will decrement pointer positions. This control gives extra flexibility for creating timescale modifications in the resynthesis.

_syncgrain_ will generate any number of parallel grain streams (which will depend on grain density/frequency), up to the _iolaps_ value (default 100). The number of streams (overlapped grains) is determined by grainsize*grain_freq. More grain overlaps will demand more calculations and the synthesis might not run in realtime (depending on processor power).

_syncgrain_ can simulate FOF-like formant synthesis, provided that a suitable shape is used as grain envelope and a sinewave as the grain wave. For this use, grain sizes of around 0.04 secs can be used. The formant centre frequency is determined by the grain pitch. Since this is a sampling increment, in order to use a frequency in Hz, that value has to be scaled by tablesize/sr. Grain frequency will determine the fundamental.

_syncgrain_ uses floating-point indexing, so its precision is not affected by large-size tables. This opcode is based on the SndObj library SyncGrain class.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = syncgrain(kamp, kfreq, kpitch, kgrsize, kprate, ifun1, ifun2, iolaps)
    ```

=== "Classic"
    ``` csound-orc
    asig syncgrain kamp, kfreq, kpitch, kgrsize, kprate, ifun1, ifun2, iolaps
    ```

### Initialization

_ifun1_ -- source signal function table. Deferred-allocation tables (see [GEN01](../scoregens/gen01.md)) are accepted, but the opcode expects a mono source.

_ifun2_ -- grain envelope function table.

_iolaps_ -- maximum number of overlaps, max(_kfreq_)*max(_kgrsize_). Estimating a large value should not affect performance, but exceeding this value will probably have disastrous consequences.

### Performance

_kamp_ -- amplitude scaling

_kfreq_ -- frequency of grain generation, or density, in grains/sec.

_kpitch_ -- grain pitch scaling (1=normal pitch, &lt; 1 lower, > 1 higher; negative, backwards)

_kgrsize_ -- grain size in secs.

_kprate_ -- readout pointer rate, in grains. The value of 1 will advance the reading pointer 1 grain ahead in the source table. Larger values will time-compress and smaller values will time-expand the source signal. Negative values will cause the pointer to run backwards and zero will freeze it.

## Examples

Here is an example of the syncgrain opcode. It uses the file [syncgrain.csd](../examples/syncgrain.csd).

``` csound-orc title="Example of the syncgrain opcode." linenums="1"
--8<-- "examples/syncgrain.csd"
```

## See Also

[Granular Synthesis](../siggen/granular.md)

## Credits

Author: Victor Lazzarini<br>
January 2005<br>

New plugin in version 5

January 2005.
