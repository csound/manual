<!--
id:outrg
category:Signal I/O:Signal Output
-->
# outrg
Outputs audio to a range of adjacent audio channels on the audio output device.

## Syntax
=== "Modern"
    ``` csound-orc
    outrg(kstart, aout1 [,aout2, aout3, ..., aoutN])
    ```

=== "Classic"
    ``` csound-orc
    outrg kstart, aout1 [,aout2, aout3, ..., aoutN]
    ```

### Performance

_kstart_ - the number of the first channel of the output device to be accessed (channel numbers starts with 1, which is the first channel)

_aout1, aout2, ... aoutN_ - the arguments containing the audio to be output to the corresponding output channels.

_outrg_ allows to output a range of adjacent channels to the output device. _kstart_ indicates the first channel to be accessed (channel 1 is the first channel). The user must be sure that the number obtained by summing kstart plus the number of accessed channels -1 is &lt;= [nchnls](../opcodes/nchnls.md).

## Examples

Here is an example of the outrg opcode. It uses the file [outrg.csd](../examples/outrg.csd).

``` csound-csd title="Example of the outrg opcode." linenums="1"
--8<-- "examples/outrg.csd"
```

Its output should include lines like these:

```
speaker 1 position 0.000200
speaker 1 position 0.000400
speaker 1 position 0.000600
.....
speaker 1 position 1.000000
speaker 2 position 0.000000
speaker 2 position 0.000200
....
speaker 2 position 0.999800
speaker 3 position 0.000000
speaker 3 position 0.000200
....
speaker 3 position 0.999600
speaker 4 position 0.000000
.....
```

## See also

[Signal Output](../sigio/output.md)

## Credits

Author: Gabriel Maldonado

New in version 5.06
