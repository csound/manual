<!--
id:pvsmix
category:Spectral Processing:Streaming
-->
# pvsmix
Combine the strongest bins from two spectral signals.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsmix(fsigin1, fsigin2)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsmix fsigin1, fsigin2
    ```

### Performance

_fsig_ -- output pv stream

_fsigin1_ -- input pv stream in amplitude-frequency or amplitude-phase format.

_fsigin2_ -- input pv stream with the same FFT size, hop size, window settings,
and data format as _fsigin1_. Both inputs must use the same analysis mode
(frame-based or sliding).

For each bin, _pvsmix_ copies the larger magnitude and its frequency or phase
to the output. If the magnitudes are equal, it uses the first input's bin.

For frame-based input, a new frame from either input updates the output using
the latest frame from each input. For sliding input, it mixes each active
sample separately.

Reinitialize _pvsmix_ if you change the sources' analysis settings.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the pvsmix opcode. It uses the file [pvsmix.csd](../examples/pvsmix.csd).

``` csound-csd title="Example of the pvsmix opcode." linenums="1"
--8<-- "examples/pvsmix.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2004 <br>

New plugin in version 5

November 2004.
