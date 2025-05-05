<!--
id:syncloop
category:Signal Generators:Granular Synthesis
-->
# syncloop
Synchronous granular synthesis.

_syncloop_ is a variation on _syncgrain_, which implements synchronous granular synthesis. _syncloop_ adds loop start and end points and an optional start position. Loop start and end control grain start positions, so the actual grains can go beyond the loop points (if the loop points are not at the extremes of the table), enabling seamless crossfading. For more information on the granular synthesis process, check the [syncgrain](../opcodes/syncgrain.md) manual page.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = syncloop(kamp, kfreq, kpitch, kgrsize, kprate, klstart, \
                    klend, ifun1, ifun2, iolaps[,istart, iskip])
    ```

=== "Classic"
    ``` csound-orc
    asig syncloop kamp, kfreq, kpitch, kgrsize, kprate, klstart, \
                  klend, ifun1, ifun2, iolaps[,istart, iskip]
    ```

### Initialization

_ifun1_ -- source signal function table. Deferred-allocation tables (see [GEN01](../scoregens/gen01.md)) are accepted, but the opcode expects a mono source.

_ifun2_ -- grain envelope function table.

_iolaps_ -- maximum number of overlaps, max(_kfreq_)*max(_kgrsize_). Estimating a large value should not affect performance, but execeeding this value will probably have disastrous consequences.

_istart_ -- starting point of synthesis in secs (defaults to 0).

_iskip_ -- if 1, the opcode initialisation is skipped, for tied notes, performance continues from the position in the loop where the previous note stopped. The default, 0, does not skip initialisation

### Performance

_kamp_ -- amplitude scaling

_kfreq_ -- frequency of grain generation, or density, in grains/sec.

_kpitch_ -- grain pitch scaling (1=normal pitch, &lt; 1 lower, > 1 higher; negative, backwards)

_kgrsize_ -- grain size in secs.

_kprate_ -- readout pointer rate, in grains. The value of 1 will advance the reading pointer 1 grain ahead in the source table. Larger values will time-compress and smaller values will time-expand the source signal. Negative values will cause the pointer to run backwards and zero will freeze it.

_klstart_ -- loop start in secs.

_klend_ -- loop end in secs.

## Examples

Here is an example of the syncloop opcode. It uses the file [syncloop.csd](../examples/syncloop.csd).

``` csound-orc title="Example of the syncloop opcode." linenums="1"
--8<-- "examples/syncloop.csd"
```

## See Also

[Granular Synthesis](../siggen/granular.md)

## Credits

Author: Victor Lazzarini<br>
January 2005<br>

New plugin in version 5

January 2005.
