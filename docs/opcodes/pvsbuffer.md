<!--
id:pvsbuffer
category:Spectral Processing:Streaming
-->
# pvsbuffer
This opcode creates and writes to a circular buffer for f-signals (streaming PV signals).

This opcode sets up and writes to a circular buffer of length ilen (secs), giving a handle for the buffer and a time pointer, which holds the current write position (also in seconds). It can be used with one or more [pvsbufread](../opcodes/pvsbufread.md) opcodes. Writing is circular, wrapping around at the end of the buffer.

## Syntax
=== "Modern"
    ``` csound-orc
    ihandle, ktime  = pvsbuffer(fsig, ilen)
    ```

=== "Classic"
    ``` csound-orc
    ihandle, ktime  pvsbuffer fsig, ilen
    ```

Initialisation

_ihandle_ -- handle identifying this particular buffer, which should be passed to a reader opcode.

_ilen_ -- buffer length in seconds.

### Performance

_fsig_ -- an input pv stream

_ktime_ -- the current time of writing in the buffer

_pvsbuffer_ stores _fsig_ in a buffer which can be read by [pvsbufread](../opcodes/pvsbufread.md) using the handle _ihandle_. Different buffers will have different handles so they can be read independently by different [pvsbufread](../opcodes/pvsbufread.md) opcodes. _pvsbuffer_ gives in its output the current time (_ktime_) inside the ring buffer which has just been written.

## Examples

Here is an example of the use of the _pvsbuffer_ opcode. It uses the file [pvsbuffer.csd](../examples/pvsbuffer.csd).

``` csound-csd title="Example of the _pvsbuffer_ opcode." linenums="1"
--8<-- "examples/pvsbuffer.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
July 2007<br>
