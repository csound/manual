<!--
id:sinsyn
category:Spectral Processing:Streaming
-->
# sinsyn
Streaming partial track additive synthesis with cubic phase interpolation.

The *sinsyn* opcode takes an input containg a TRACKS pv streaming signal (as generated, for instance by the [partials](partials.md) opcode). It resynthesises the signal using linear amplitude and cubic phase interpolation to drive a bank of interpolating oscillators with amplitude scaling control. *sinsyn* attempts to preserve the phase of the partials in the original signal and in so doing it does not allow for pitch or timescale modifications of the signal.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = sinsyn(fin, kscal, kmaxtracks, ifn)
    ```

=== "Classic"
    ``` csound-orc
    asig sinsyn fin, kscal, kmaxtracks, ifn
    ```

### Performance

_asig_ -- output audio rate signal

_fin_ -- input pv stream in TRACKS format

_kscal_ -- amplitude scaling

_kmaxtracks_ -- max number of tracks in sinsynthesis. Limiting this will cause a non-linear filtering effect, by discarding newer and higher-frequency tracks (tracks are ordered by start time and ascending frequency, respectively)

_ifn_ -- function table containing one cycle of a sinusoid (sine or cosine).

## Examples

Here is an example of the sinsyn opcode. It uses the file [sinsyn.csd](../examples/sinsyn.csd).

``` csound-csd title="Example of the sinsyn opcode." linenums="1"
--8<-- "examples/sinsyn.csd"
```

The example above shows partial tracking of an ifd-analysis signal and cubic-phase additive resynthesis.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
June 2005 <br>

New plugin in version 5

November 2004.
