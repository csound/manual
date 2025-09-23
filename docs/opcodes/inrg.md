<!--
id:inrg
category:Signal I/O:Signal Input
-->
# inrg
Reads audio from a range of adjacent audio channels from the audio input device.

## Syntax
=== "Modern"
    ``` csound-orc
    inrg(kstart, ain1 [,ain2, ain3, ..., ainN])
    ```

=== "Classic"
    ``` csound-orc
    inrg kstart, ain1 [,ain2, ain3, ..., ainN]
    ```

### Performance

_kstart_ - the number of the first channel of the input device to be accessed (channel numbers starts with 1, which is the first channel)

_ain1, ain2, ... ainN_ - the output arguments filled with the incoming audio coming from corresponding channels.

_inrg_ allows input from a range of adjacent channels from the input device. _kstart_ indicates the first channel to be accessed (channel 1 is the first channel). The user must be sure that the number obtained by summing _kstart_ plus the number of accessed channels -1 is &lt;= [nchnls_i](../opcodes/nchnls_i.md).

> :memo: **Note**
>
> Note that this opcode is exceptional in that it produces its &#8220;output&#8221; on the parameters to the right.

## See also

[Signal Input](../sigio/input.md)

## Credits

Author: Gabriel Maldonado

New in version 5.06
