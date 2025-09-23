<!--
id:partials
category:Spectral Processing:Streaming
-->
# partials
Partial track spectral analysis.

The partials opcode takes two input PV streaming signals containg AMP_FREQ and AMP_PHASE signals (as generated for instance by pvsifd or in the first case, by pvsanal) and performs partial track analysis, as described in Lazzarini et al, "Time-stretching using the Instantaneous Frequency Distribution and Partial Tracking", Proc.of ICMC05, Barcelona. It generates a TRACKS PV streaming signal, containing amplitude, frequency, phase and track ID for each output track. This type of signal will contain a variable number of output tracks, up to the total number of analysis bins contained in the inputs (fftsize/2 + 1 bins). The second input (AMP_PHASE) is optional, as it can take the same signal as the first input. In this case, however, all phase information will be NULL and resynthesis using phase information cannot be performed.

## Syntax
=== "Modern"
    ``` csound-orc
    ftrks = partials(ffr, fphs, kthresh, kminpts, kmaxgap, imaxtracks)
    ```

=== "Classic"
    ``` csound-orc
    ftrks partials ffr, fphs, kthresh, kminpts, kmaxgap, imaxtracks
    ```

### Performance

_ftrks_ -- output pv stream in TRACKS format

_ffr_ -- input pv stream in AMP_FREQ format

_fphs_ -- input pv stream in AMP_PHASE format

_kthresh_ -- analysis threshold factor, defined between -1 and 1. If non-negative, the analysis threshold is taken to be relative to the maximum magnitude in each analysis frame (kthresh * max_magnitude). If negative, the absolute threshold value is relative to 0dbfs (kthresh * 0dbfs). Tracks below this threshold will be discarded.

_kminpoints_ -- minimum number of time points for a detected peak to make a track (1 is the minimum). Since this opcode works with streaming signals, larger numbers will increase the delay between input and output, as we have to wait for the required minimum number of points.

_kmaxgap_ -- maximum gap between time-points for track continuation (> 0). Tracks that have no continuation after kmaxgap will be discarded.

_imaxtracks_ -- maximum number of analysis tracks (number of bins >= imaxtracks)

## Examples

Here is an example of the partials opcodes. It uses the file [partials.csd](../examples/partials.csd).

``` csound-csd title="Example of the partials opcodes." linenums="1"
--8<-- "examples/partials.csd"
```

The example above shows partial tracking of an ifd-analysis signal and cubic-phase additive resynthesis with pitch shifting.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
June 2005 <br>

New plugin in version 5

November 2004.
