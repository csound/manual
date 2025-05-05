<!--
id:pvsbufread
category:Spectral Processing:Streaming
-->
# pvsbufread
This opcode reads a circular buffer of f-signals (streaming PV signals).

This opcode reads from a circular buffer of length ilen (secs), taking a handle for the buffer and a time pointer, which holds the current read position (also in seconds). It is used in conjunction with a _pvsbuffer_ opocde. Reading is circular, wrapping around at the end of the buffer.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsbufread(ktime, khandle [, ilo, ihi, iclear])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsbufread ktime, khandle [, ilo, ihi, iclear]
    ```

### Initialisation

_ilo, ihi_ -- set the lowest and highest freqs to be read from the buffer (defaults to 0, Nyquist).

_iclear_ -- set to 1 to clear output fsig before every write (default 1), 0 tells the opcode not to clear the output fsig. This is relevant when writing to subsets of an fsig frame using _ilo_, _ihi_.

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
> It is important that the handle value passed to _pvsbufread_ is valid and was created by [pvsbuffer](../opcodes/pvsbuffer.md). Csound will crash with invalid handles.

## Examples

Here is an example of the pvsbufread opcode. It does 'brassage' by switching between two buffers.

``` csound-orc title="Example of the pvsbufread opcode"
fsig1       pvsanal     asig1, 1024, 256, 1024, 1
fsig2       pvsanal     asig2, 1024, 256, 1024, 1


ibuf1, kt1  pvsbuffer   fsig1, 10   ; 10-sec buf with fsig1
ibuf2, kt2  pvsbuffer   fsig2, 7    ; 7-sec buf with fsig2

khan        init        ibuf1       ; initialise handle to buf1

if  ktrig  > 0 then                 ; switch buffers according to trigger
khan = ibuf2
else
khan = ibuf1
endif

fsb         pvsbufread  kt1, khan   ; read buffer
```

Here is an example of the pvsbufread opcode. It uses the file [pvsbufread.csd](../examples/pvsbufread.csd).

``` csound-csd title="Example of the pvsbufread opcode." linenums="1"
--8<-- "examples/pvsbufread.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
July 2007<br>
