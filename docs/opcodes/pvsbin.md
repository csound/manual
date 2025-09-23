<!--
id:pvsbin
category:Spectral Processing:Streaming
-->
# pvsbin
Obtain the amp and freq values off a PVS signal bin as k-rate variables.

## Syntax
=== "Modern"
    ``` csound-orc
    kamp, kfr = pvsbin(fsig, kbin)
    ```

=== "Classic"
    ``` csound-orc
    kamp, kfr pvsbin fsig, kbin
    ```

### Performance

_kamp_ -- bin amplitude

_kfr_ -- bin frequency

_fsig_ -- an input pv stream

_kbin_ -- bin number

## Examples

Here is an example of the pvsbin opcode. It uses the file [pvsbin.csd](../examples/pvsbin.csd). This example uses realtime input, but you can also use it for soundfile input.

``` csound-csd title="Example of the pvsbin opcode" linenums="1"
--8<-- "examples/pvsbin.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
August 2006<br>
