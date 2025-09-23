<!--
id:tab2pvs
category:Spectral Processing:Streaming
-->
# tab2pvs
Copies spectral data from k-rate arrays (or t-variables.). Also known as _pvsfromarray_.

Copies a pvs frame from a t-variable or k-rate array. Currently only AMP+FREQ is produced. This opcode requires the t-type to be defined, which means it only works in the new bison/flex-based parser.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = tab2pvs(tvar|karr[] [, ihopsize, iwinsize, iwintype])
    fsig = tab2pvs(kmags[], kfreqs[] [, ihopsize, iwinsize, iwintype])
    ```

=== "Classic"
    ``` csound-orc
    fsig tab2pvs tvar|karr[] [, ihopsize, iwinsize, iwintype]
    fsig tab2pvs kmags[], kfreqs[] [, ihopsize, iwinsize, iwintype]
    ```

### Performance

_tvar_ -- k-rate array (or t-variable) containing the input. It is produced at every k-period, but may not contain a new frame, pvs frames are produced at their own frame rate that is independent of kr. The size of this vector will determine the fftsize, N = size - 2.

_kmags[], kfreqs[]_ -- k-rate arrays containing the input magnitude and frequency values. The output is produced at every k-period, but may not contain a new frame, pvs frames are produced at their own frame rate that is independent of kr. These vectors must be the same size and they will determine the fftsize, N = size - 2.

_fsig_ -- output fsig to be copied.

_iolap_ -- size of the analysis overlap, defaults to _isize_/4.

_iwinsize_ -- size of the analysis window, defaults to _isize_.

_iwintype_ -- type of analysis window, defaults to 1, Hanning.

## Examples

``` csound-orc
kkarr[] init    1026
...
fsig1   tab2pvs karr
```

aout pvsynth fsig1

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

[Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author: Victor Lazzarini<br>
October 2011 <br>

New plugin in version 5

October 2011.
