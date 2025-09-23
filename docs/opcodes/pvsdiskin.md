<!--
id:pvsdiskin
category:Spectral Processing:Streaming
-->
# pvsdiskin
Create an fsig stream by reading a selected channel from a PVOC-EX analysis file, with frame interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsdiskin(SFname, ktscal, kgain [, ioffset, ichan])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsdiskin SFname, ktscal, kgain [, ioffset, ichan]
    ```

### Initialization

_Sfname_ -- Name of the analysis file. This must have the .pvx file extension.

A multi-channel PVOC-EX file can be generated using the extended [pvanal utility](../utility/pvanal.md).

_ichan_ -- (optional) The channel to read (counting from 1). Default is 1.

_ioff_ -- start offset from beginning of file (secs) (default: 0) .

### Performance

_ktscal_ -- time scale, ie. the read pointer speed (1 is normal speed, negative is backwards, 0 &lt; ktscal &lt; 1 is slower and ktscal &gt; 1 is faster)

_kgain_ -- gain scaling.

## Examples

Here is an example of the pvsdiskin opcode. It uses the file [pvsdiskin.csd](../examples/pvsdiskin.csd).

``` csound-csd title="Example of the pvsdiskin opcode." linenums="1"
--8<-- "examples/pvsdiskin.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
May 2007 <br>

New in Csound 5.06
