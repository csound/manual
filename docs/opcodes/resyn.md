<!--
id:resyn
category:Spectral Processing:Streaming
-->
# resyn
Streaming partial track additive synthesis with cubic phase interpolation.

The *resyn* opcode  uses pitch control and support for timescale-modified input. It takes an input containing a TRACKS pv streaming signal (as generated, for instance by partials). It resynthesises the signal using linear amplitude and cubic phase interpolation to drive a bank of interpolating oscillators with amplitude and pitch scaling controls. *resyn* is a modified version of [sinsyn](sinsyn.md), allowing for the resynthesis of data with pitch and timescale changes.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = resyn(fin, kscal, kpitch, kmaxtracks, ifn)
    ```

=== "Classic"
    ``` csound-orc
    asig resyn fin, kscal, kpitch, kmaxtracks, ifn
    ```

### Performance

_asig_ -- output audio rate signal

_fin_ -- input pv stream in TRACKS format

_kscal_ -- amplitude scaling

_kpitch_ -- pitch scaling

_kmaxtracks_ -- max number of tracks in resynthesis. Limiting this will cause a non-linear filtering effect, by discarding newer and higher-frequency tracks (tracks are ordered by start time and ascending frequency, respectively)

_ifn_ -- function table containing one cycle of a sinusoid (sine or cosine)

## Examples

Here is an example of the resyn opcode. It uses the file [resyn.csd](../examples/resyn.csd).

``` csound-csd title="Example of the resyn opcode." linenums="1"
--8<-- "examples/resyn.csd"
```

The example above shows partial tracking of an ifd-analysis signal and cubic-phase additive resynthesis with pitch shifting.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
June 2005 <br>

New plugin in version 5

November 2004.
