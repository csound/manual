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

Initialization

_isort_ -- if nonzero, sort the reported bins in kBins by decreasing amplitude, optional (default 0, off).

_imin, imax_ -- if nonzero, search between a min and max value (default 0, no min or max).

### Performance

_fsig_ -- output pv stream

_kBins[]_ -- an array of size fftsize/2 + 1 values, whose first N values report the kn bin numbers retained by pvstrace. Other locations are set to 0. It can be sorted or unsorted.

_fsigin_ -- input pv stream

_kn_ -- number of bins to be retained

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
