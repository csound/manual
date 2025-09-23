<!--
id:pvstanal
category:Spectral Processing:Streaming
-->
# pvstanal
Phase vocoder analysis processing with onset detection/processing.

_pvstanal_ implements phase vocoder analysis by reading function tables containing sampled-sound sources, with [GEN01](../scoregens/gen01.md), and _pvstanal_ will accept deferred allocation tables.

This opcode allows for time and frequency-independent scaling. Time is advanced internally, but controlled by a tempo scaling parameter; when an onset is detected, timescaling is momentarily stopped to avoid smearing of attacks. The quality of the effect is generally improved with phase locking switched on.

_pvstanal_ will also scale pitch, independently of frequency, using a transposition factor (k-rate).

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvstanal(ktimescal, kamp, kpitch, ktab, [kdetect, kwrap, ioffset, \
                    ifftsize, ihop, idbthresh])
      )
    ```

=== "Classic"
    ``` csound-orc
    fsig pvstanal ktimescal, kamp, kpitch, ktab, [kdetect, kwrap, ioffset, \
                  ifftsize, ihop, idbthresh]
    
    ```

### Initialization

_ifftsize_ -- FFT size (power-of-two), defaults to 2048.

_ihop_ -- hopsize, defaults to 512

_ioffset_ -- startup read offset into table, in secs.

_idbthresh_ -- threshold for onset detection, based on dB power spectrum ratio between two successive windows. A detected ratio above it will cancel timescaling momentarily, to avoid smearing (defaults to 1).
By default anything more than a 1 dB inter-frame power difference will be detected as an onset.

### Performance

_ktimescal_ -- timescaling ratio, &lt; 1 stretch, > 1 contract.

_kamp_ -- amplitude scaling

_kpitch_ -- grain pitch scaling (1=normal pitch, &lt; 1 lower, > 1 higher; negative, backwards)

_kdetect_ -- 0 or 1, to switch onset detection/processing. The onset detector checks for power difference between analysis windows. If more than what has been specified in the dbthresh parameter, an onset is declared. It suspends timescaling momentarily so the onsets are not modified. The default is 1, so onset detection/processing is on.

_ktab_ -- source signal function table. Deferred-allocation tables (see [GEN01](../scoregens/gen01.md)) are accepted, but the opcode expects a mono source. Tables can be switched at k-rate.

_kwrap_ -- 0 or 1, to switch on/off table wrap-around read (default to 1)

## Examples

Here is an example of the pvstanal opcode. It uses the file [pvstanal.csd](../examples/pvstanal.csd).

``` csound-csd title="Example of the pvstanal opcode." linenums="1"
--8<-- "examples/pvstanal.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
February 2010<br>

New plugin in version 5.13

February 2005.
