<!--
id:tab2pvs
category:Spectral Processing:Streaming
-->
# tab2pvs
Copies amplitude and frequency data from k-rate arrays into an f-signal. Also known as [pvsfromarray](pvsfromarray.md).

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = tab2pvs(karr[] [, ihopsize, iwinsize, iwintype])
    fsig = tab2pvs(kmags[], kfreqs[] [, ihopsize, iwinsize, iwintype])
    ```

=== "Classic"
    ``` csound-orc
    fsig tab2pvs karr[] [, ihopsize, iwinsize, iwintype]
    fsig tab2pvs kmags[], kfreqs[] [, ihopsize, iwinsize, iwintype]
    ```

### Initialization

_karr[]_ -- One-dimensional array of alternating amplitude and frequency values, starting with DC and ending with Nyquist. Its length must be even and at least 4. An array of length _L_ gives FFT size _N = L - 2_.

_kmags[], kfreqs[]_ -- Separate one-dimensional arrays of amplitudes and frequencies, with one value per bin. Both must have the same length _L_, with at least two bins. The FFT size is _N = 2 * (L - 1)_.

_ihopsize_ -- Hop size in samples. Zero selects the default, the integer part of _N/4_. The hop must be at least _ksmps_, but need not be a multiple of it. If the default is too small, supply an explicit hop. Fractional sample counts are truncated.

_iwinsize_ -- Analysis window size stored in the f-signal. Zero selects the default, _N_. The size must be positive; fractional sample counts are truncated.

_iwintype_ -- Analysis window type stored in the f-signal, default 1 (von Hann). This opcode copies data; it does not apply an analysis window.

### Performance

_fsig_ -- Output in amplitude+frequency format (0), using ordinary frames, not sliding frames.

The first performance cycle copies the current array data. Each later frame is copied on the first control cycle at or after its hop boundary. Between updates, the output keeps the previous frame. Changes to array values take effect at the next copy.

Keep the array dimensions and lengths unchanged during performance. To change the FFT size, reinitialize the arrays, this opcode and any opcodes that use its output.

## Examples

``` csound-orc
kFrame[] init 1026
; Put a partial at bin 10; leave the other amplitudes at zero.
kFrame[20] = .5
kFrame[21] = 440
fSpectrum tab2pvs kFrame, 256
aOut pvsynth fSpectrum
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

[Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author: Victor Lazzarini<br>
October 2011 <br>

New plugin in version 5

October 2011.
