<!--
id:pvsfread
category:Spectral Processing:Streaming
-->
# pvsfread
Read a selected channel from a PVOC-EX analysis file.

Create an fsig stream by reading a selected channel from a PVOC-EX analysis file loaded into memory, with frame interpolation. Only format 0 files (amplitude+frequency) are currently supported. The operation of this opcode mirrors that of pvoc, but outputs an fsig instead of a resynthesized signal.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsfread(ktimpt, ifn [, ichan])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsfread ktimpt, ifn [, ichan]
    ```

### Initialization

_ifn_ -- Name of the analysis file. This must have the .pvx file extension.

A multi-channel PVOC-EX file can be generated using the extended [pvanal utility](../utility/pvanal.md).

_ichan_ -- (optional) The channel to read (counting from 0). Default is 0.

### Performance

_ktimpt_ -- Time pointer into analysis file, in seconds. See the description of the same parameter of [pvoc](../opcodes/pvoc.md) for usage.

Note that analysis files can be very large, especially if multi-channel. Reading such files into memory will very likely incur breaks in the audio during real-time performance. As the file is read only once, and is then available to all other interested opcodes, it can be expedient to arrange for a dedicated instrument to preload all such analysis files at startup.

## Examples

Here is an example of the pvsfread opcode. It uses the file [pvsfread.csd](../examples/pvsfread.csd).

``` csound-csd title="Example of the pvsfread opcode." linenums="1"
--8<-- "examples/pvsfread.csd"
```

Here is another example of the pvsfread opcode. It uses the file [pvsfread-2.csd](../examples/pvsfread-2.csd).

``` csound-csd title="Another example of the pvsfread opcode." linenums="1"
--8<-- "examples/pvsfread-2.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

New in version 4.13
