<!--
id:pvsbufread2
category:Spectral Processing:Streaming
-->
# pvsbufread2
This opcode reads a circular buffer of f-signals (streaming PV signals), with binwise additional delays.

This opcode reads from a circular buffer of length ilen (secs), taking a handle for the buffer and a time pointer, which holds the current read position (also in seconds). It is used in conjunction with a _pvsbuffer_ opocde. Reading is circular, wrapping around at the end of the buffer. Extra delay times are taken from a function table, with each point on it defining a delay time in seconds affecting the corresponding bin.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsbufread2(ktime, khandle, ift1, ift2)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsbufread2 ktime, khandle, ift1, ift2
    ```

### Initialization

_ift1_ -- function table with at least fftisze/2+1 points where delays (in secs) for bin amplitudes are set (function table positions are equivalent to bin numbers)

_ift2_ -- function table with at least fftisze/2+1 points where delays (in secs) for bin frequencies are set (function table positions are equivalent to bin numbers)

### Performance

_fsig_ -- output pv stream

_ktime_ -- time position of reading pointer (in secs).

_khandle_ -- handle identifying the buffer to be read. When using k-rate handles, it is important to initialise the k-rate variable to a given existing handle. When changing buffers, fsig buffers need to be compatible (same fsig format).

With this opcode and [pvsbuffer](../opcodes/pvsbuffer.md), it is possible to, among other things:

* time-stretch/compress a fsig stream, by reading it at different rates
* delay a fsig or portions of it.
* 'brassage' of two or more fsigs by switching buffers, since the reading handles are k-rate. Note that, when using k-rate handles, it is important to initialise the k-rate variable to a given handle (so that the fsig initialisation can take place) and it is only possible to switch handles between compatible fsig buffers (with the same fftsize and overlap).

> :memo: **Note**
>
> It is important that the handle value passed to _pvsbufread2_ is valid and was created by [pvsbuffer](../opcodes/pvsbuffer.md). Csound will crash with invalid handles.

## Examples

Here is an example of the pvsbufread2 opcode. It uses the file [pvsbufread2.csd](../examples/pvsbufread2.csd).

``` csound-csd title="Example of the pvsbufread2 opcode." linenums="1"
--8<-- "examples/pvsbufread2.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
July 2011<br>
