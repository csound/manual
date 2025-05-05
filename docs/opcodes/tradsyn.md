<!--
id:tradsyn
category:Spectral Processing:Streaming
-->
# tradsyn
Streaming partial track additive synthesis.

The _tradsyn_ opcode takes an input containg a TRACKS pv streaming signal (as generated, for instance by _partials_),as described in Lazzarini et al, "Time-stretching using the Instantaneous Frequency Distribution and Partial Tracking", Proc.of ICMC05, Barcelona. It resynthesises the signal using linear amplitude and frequency interpolation to drive a bank of interpolating oscillators with amplitude and pitch scaling controls.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = tradsyn(fin, kscal, kpitch, kmaxtracks, ifn)
    ```

=== "Classic"
    ``` csound-orc
    asig tradsyn fin, kscal, kpitch, kmaxtracks, ifn
    ```

### Performance

_asig_ -- output audio rate signal

_fin_ -- input pv stream in TRACKS format

_kscal_ -- amplitude scaling

_kpitch_ -- pitch scaling

_kmaxtracks_ -- max number of tracks in resynthesis. Limiting this will cause a non-linear filtering effect, by discarding newer and higher-frequency tracks (tracks are ordered by start time and ascending frequency, respectively)

_ifn_ -- function table containing one cycle of a sinusoid (sine or cosine).

## Examples

Here is an example of the tradsyn opcode. It uses the file [tradsyn.csd](../examples/tradsyn.csd).

``` csound-csd title="Example of the tradsyn opcode." linenums="1"
--8<-- "examples/tradsyn.csd"
```

The example above shows partial tracking of an ifd-analysis signal and linear additive resynthesis with pitch shifting.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
June 2005 <br>

New plugin in version 5

November 2004.
