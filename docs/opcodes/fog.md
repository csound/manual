<!--
id:fog
category:Signal Generators:Granular Synthesis
-->
# fog
Audio output is a succession of grains derived from data in a stored function table.

The local envelope of these grains and their timing is based on the model of _fof_ synthesis and permits detailed control of the granular synthesis.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = fog(xamp, xdens, xtrans, aspd, koct, kband, kris, kdur, kdec, \
               iolaps, ifna, ifnb, itotdur [, iphs] [, itmode] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares fog xamp, xdens, xtrans, aspd, koct, kband, kris, kdur, kdec, \
             iolaps, ifna, ifnb, itotdur [, iphs] [, itmode] [, iskip]
    ```

### Initialization

_iolaps_ -- number of pre-located spaces needed to hold overlapping grain data. Overlaps are density dependent, and the space required depends on the maximum value of _xdens_ * _kdur_. Can be over-estimated at no computation cost. Uses less than 50 bytes of memory per _iolap_.

_ifna_, _ifnb_ -- table numbers of two stored functions. The first is the data used for granulation, usually from a soundfile ([GEN01](../scoregens/gen01.md)). The second is a rise shape, used forwards and backwards to shape the grain rise and decay; this is normally a sigmoid ([GEN19](../scoregens/gen19.md)) but may be linear ([GEN05](../scoregens/gen05.md)).

_itotdur_ -- total time during which this _fog_ will be active. Normally set to p3. No new grain is created if it cannot complete its _kdur_ within the remaining _itotdur_.

_iphs_ (optional) -- initial phase of the fundamental, expressed as a fraction of a cycle (0 to 1). The default value is 0.

_itmode_ (optional) -- transposition mode. If zero, each grain keeps the _xtrans_ value it was launched with. If non-zero, each is influenced by _xtrans_ continuously. The default value is 0.

_iskip_ (optional, default=0) -- If non-zero, skip initialization (allows legato use).

### Performance

_xamp_ -- amplitude factor. Amplitude is also dependent on the number of overlapping grains, the interaction of the rise shape (_ifnb_) and the exponential decay (_kband_), and the scaling of the grain waveform (_ifna_). The actual amplitude may therefore exceed _xamp_.

_xdens_ -- density. The frequency of grains per second.

_xtrans_ -- transposition factor. The rate at which data from the stored function table _ifna_ is read within each grain. This has the effect of transposing the original material. A value of 1 produces the original pitch. Higher values transpose upwards, lower values downwards. Negative values result in the function table being read backwards.

_aspd_ -- Starting index pointer. _aspd_ is the normalized index (0 to 1) to table _ifna_ that determines the movement of a pointer used as the starting point for reading data within each grain. (_xtrans_ determines the rate at which data is read starting from this pointer.)

_koct_ -- octaviation index. The operation of this parameter is identical to that in [fof](../opcodes/fof.md).

_kband_, _kris_, _kdur_, _kdec_ -- grain envelope shape. These parameters determine the exponential decay (_kband_), and the rise (_kris_), overall duration (_kdur_,) and decay (_kdec_ ) times of the grain envelope. Their operation is identical to that of the local envelope parameters in _fof_.

## Examples

Here is an example of the fog opcode. It uses the file [fog.csd](../examples/fog.csd).

``` csound-orc title="Example of the fog opcode." linenums="1"
--8<-- "examples/fog.csd"
```

## See Also

[Granular Synthesis](../siggen/granular.md)

## Credits

Author: Michael Clark<br>
Huddersfield<br>
May 1997<br>

New in version 3.46

The Csound fog generator is by Michael Clarke, extending his earlier work based on IRCAM's FOF algorithm.

Added notes by Rasmus Ekman on September 2002.
