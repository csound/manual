<!--
id:pvsgain
category:Spectral Processing:Streaming
-->
# pvsgain
Scale the amplitude of a pv stream.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsgain(fsigin, kgain)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsgain fsigin, kgain
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream in amplitude-frequency or amplitude-phase format

_kgain_ -- amplitude multiplier. This argument is required. A value of 1
leaves the magnitudes unchanged; 0 sets them to zero. Frequencies or phases
remain unchanged.

For frame-based input, gain changes take effect on the next new input frame.
The output holds its values between frames. For sliding input, the current
gain applies to each active sample in the control block.

You can restart the source with the same analysis settings while _pvsgain_
keeps running. If you change the FFT size, hop size, window, or data format,
reinitialize _pvsgain_ too.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the use of the _pvsgain_ opcode. It uses the file [pvsgain.csd](../examples/pvsgain.csd).

``` csound-csd title="Example of the _pvsgain_ opcode." linenums="1"
--8<-- "examples/pvsgain.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
2011 <br>

New plugin in version 5

2011
