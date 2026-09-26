<!--
id:pvstrace
category:Spectral Processing:Streaming
-->
# pvstrace
Process a PV stream by retaining only the N bins with the highest amplitude, zeroing the others.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvstrace(fsigin, kn)
    fsig, kBins[] = pvstrace(fsigin, kn [, isort, imin, imax])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvstrace fsigin, kn
    fsig, kBins[] pvstrace fsigin, kn [, isort, imin, imax]
    ```

### Initialization

_isort_ -- if nonzero, list the selected bins in decreasing amplitude order. Otherwise, list them in increasing bin-number order. Default: 0.

_imin, imax_ -- search range in bin numbers, including _imin_ and excluding _imax_. Bin numbers start at 0. An _imax_ of 0 includes all bins from _imin_ through Nyquist. Both default to 0, which searches the whole frame.

Csound discards fractional parts and limits values beyond the frame to its end. Negative limits cause an initialization error. If the resulting range is empty or reversed, the output is silent and the bin array contains zeros. For example, limits of 2 and 6 search bins 2, 3, 4, and 5.

### Performance

_fsig_ -- output PV stream. Selected bins retain their input amplitude and frequency or phase; all other bins are zero.

_kBins[]_ -- array of _fftsize_/2 + 1 values. The first values list the selected bin numbers; the remaining values are zero. _isort_ controls their order.

_fsigin_ -- input PV stream in amplitude/frequency or amplitude/phase format. Sliding analyses are not supported.

_kn_ -- number of bins to retain from the search range. Csound discards the fractional part, treats values below 1 as 1, and limits the count to the number of bins in the range.

When amplitudes tie, lower bin numbers take priority. Sorting the bin list does not change which bins the output retains.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the use of the _pvstrace_ opcode. It uses the file [pvstrace.csd](../examples/pvstrace.csd).

``` csound-csd title="Example of the _pvstrace_ opcode." linenums="1"
--8<-- "examples/pvstrace.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
2017 <br>

New plugin in version 6.09
