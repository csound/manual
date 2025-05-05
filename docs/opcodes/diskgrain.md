<!--
id:diskgrain
category:Signal Generators:Granular Synthesis
-->
# diskgrain
Synchronous granular synthesis, using a soundfile as source.

The source sound for the grains is obtained by reading a soundfile containing the samples of the source waveform.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = diskgrain(Sfname, kamp, kfreq, kpitch, kgrsize, kprate, \
                     ifun, iolaps [,imaxgrsize , ioffset])
    ```

=== "Classic"
    ``` csound-orc
    asig diskgrain Sfname, kamp, kfreq, kpitch, kgrsize, kprate, \
                   ifun, iolaps [,imaxgrsize , ioffset]
    ```

### Initialization

_Sfilename_ -- source soundfile.

_ifun_ -- grain envelope function table.

_iolaps_ -- maximum number of overlaps, max(kfreq)*max(kgrsize). Estimating a large value should not affect performance, but exceeding this value will probably have disastrous consequences.

_imaxgrsize_ -- max grain size in secs (default 1.0).

_ioffset_ -- start offset in secs from beginning of file (default: 0).

### Performance

_kamp_ -- amplitude scaling

_kfreq_ -- frequency of grain generation, or density, in grains/sec.

_kpitch_ -- grain pitch scaling (1=normal pitch, &lt; 1 lower, > 1 higher; negative, backwards)

_kgrsize_ -- grain size in secs.

_kprate_ -- readout pointer rate, in grains. The value of 1 will advance the reading pointer 1 grain ahead in the source table. Larger values will time-compress and smaller values will time-expand the source signal.  Negative values will cause the pointer to run backwards and zero will freeze it.

The grain generator has full control of frequency (grains/sec), overall amplitude, grain pitch (a sampling increment) and grain size (in secs), both as fixed or time-varying (signal) parameters.  An extra parameter is the grain pointer speed (or rate), which controls which position the generator will start reading samples in the file for each successive grain. It is measured in fractions of grain size, so a value of 1 (the default) will make each successive grain read from where the previous grain should finish. A value of 0.5 will make the next grain start at the midway position from the previous grain start and finish, etc.. A value of 0 will make the generator read always from a fixed position (wherever the pointer was last at). A negative value will decrement pointer positions. This control gives extra flexibility for creating timescale modifications in the resynthesis.

_Diskgrain_ will generate any number of parallel grain streams (which will depend on grain density/frequency), up to the olaps value (default 100). The number of streams (overlapped grains) is determined by grainsize*grain_freq. More grain overlaps will demand more calculations and the synthesis might not run in realtime (depending on processor power).

_Diskgrain_ can simulate FOF-like formant synthesis, provided that a suitable shape is used as grain envelope and a sinewave as the grain wave. For this use, grain sizes of around 0.04 secs can be used. The formant centre frequency is determined by the grain pitch.  Since this is a sampling increment, in order to use a frequency in Hz, that value has to be scaled by tablesize/sr. Grain frequency will determine the fundamental.

This opcode is a variation on the [syncgrain](../opcodes/syncgrain.md) opcode.

> :memo: **Note**
> 
> diskgrain does not do any resampling, so if the sample rate of the source filename is not the same as csound's sr value there will be pitch shifts

## Examples

Here is an example of the diskgrain opcode. It uses the file [diskgrain.csd](../examples/diskgrain.csd).

``` csound-orc title="Example of the diskgrain opcode." linenums="1"
--8<-- "examples/diskgrain.csd"
```

## See Also

[Granular Synthesis](../siggen/granular.md)

## Credits

Author: Victor Lazzarini<br>
May 2007<br>

New in Csound 5.06
