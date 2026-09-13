<!--
id:pvsbin
category:Spectral Processing:Streaming
-->
# pvsbin
Read the amplitude and frequency of a PVS bin at control or audio rate.

## Syntax
=== "Modern"
    ``` csound-orc
    kamp, kfr = pvsbin(fsig, kbin)
    aamp, afr = pvsbin(fsig, kbin)
    ```

=== "Classic"
    ``` csound-orc
    kamp, kfr pvsbin fsig, kbin
    aamp, afr pvsbin fsig, kbin
    ```

### Performance

_kamp_, _aamp_ -- bin amplitude at control or audio rate

_kfr_, _afr_ -- bin frequency at control or audio rate

_fsig_ -- an input pv stream

_kbin_ -- bin number, counted from zero. Fractional values are truncated before selecting the amplitude/frequency pair. The value must be nonnegative and less than the number of bins (`N/2 + 1` for an FFT size of `N`). Invalid values cause a performance error when the bin is selected.

For frame-based PVS streams, the opcode selects the bin only when a new frame arrives. A change to _kbin_ between frame updates takes effect at the next frame. Both output forms hold the selected values between frames; audio output repeats those values over the active samples in each block.

For sliding PVS streams, audio output reads each active sample's spectrum. Control output reads the first active sample's spectrum. Audio samples outside the note's active range are zero.

## Examples

Here is an example of the pvsbin opcode. It uses the file [pvsbin.csd](../examples/pvsbin.csd). This example uses realtime input, but you can also use it for soundfile input.

``` csound-csd title="Example of the pvsbin opcode" linenums="1"
--8<-- "examples/pvsbin.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
August 2006<br>
