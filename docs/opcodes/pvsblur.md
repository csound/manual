<!--
id:pvsblur
category:Spectral Processing:Streaming
-->
# pvsblur
Average the amp/freq time functions of each analysis channel for a specified time (truncated to number of frames).

As a side-effect the input pvoc stream will be delayed by that amount.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsblur(fsigin, kblurtime, imaxdel)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsblur fsigin, kblurtime, imaxdel
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream.

_kblurtime_ -- time in secs during which windows will be averaged .

_imaxdel_ -- maximum delay time, used for allocating memory used in the averaging operation.

This opcode will blur a pvstream by smoothing the amplitude and frequency time functions (a type of low-pass filtering); the amount of blur will depend on the length of the averaging period, larger blurtimes will result in a more pronounced effect.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the use of the _pvsblur_ opcode. It uses the file [pvsblur.csd](../examples/pvsblur.csd).

``` csound-csd title="Example of the _pvsblur_ opcode." linenums="1"
--8<-- "examples/pvsblur.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2004 <br>

New plugin in version 5

November 2004.
