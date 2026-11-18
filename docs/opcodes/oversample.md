<!--
id:oversample
category:Signal I/O:Software Bus
-->
# oversample
Sets the local sampling rate value in a user-defined opcode block.

## Syntax
=== "Modern"
    ``` csound-orc
    oversample(ifactor [,icvt_in, icvt_out])
    ```

=== "Classic"
    ``` csound-orc
    oversample ifactor [,icvt_in, icvt_out]
    ```

### Initialization

_ifactor_ -- sets the oversampling factor. It needs to be a positive integer &gt; 1. A factor of 1 is a non-op, zero or negative factors are illegal. The local sampling rate is set as ifactor * sr. The value of the sr variable is then changed locally. Local kr is also changed accordingly, local ksmps remains unchanged.

_icvt_in_ -- converter used for input: if Secret Rabbit Code is used, then 0 - best quality sync (default); 1 - medium quality sync; 2 - fast sync; 3 - zero-order hold; and  4 - linear. 5 to 9 are the same five converters for audio, with k-rate arguments held instead of converted.

_icvt_out_ -- converter used for output, defaults to the input converter, but can be different. 5 to 9 are the same five converters for audio, with k-rate outputs held instead of converted.

> :memo: **Note**
>
> Higher-quality sync converters add latency to the signal (0, 1, 2, increasing with quality). Through the input and output together it is 287, 93 and 39 samples, and 2 and 1 samples for converters 3 and 4.
>
> Converters 0 to 4 also convert k-rate arguments and outputs, and arrays of them, as signals of one sample per k-period. For these the latency counts k-periods, not samples: a change in a k-rate argument reaches the caller that many k-periods late, the sync converters ring around it, and with every converter but 3 the value starts from 0 at the start of each note.
>
> Converters 5 to 9 hold k-rate values instead, as a UDO with [setksmps](../opcodes/setksmps.md) does. An argument is copied in at each local k-period, and an output returns its value from the last of them, so a value that lasts for one earlier local k-period does not reach the caller. A control that should be converted as a signal in these modes can be passed at a-rate.
>
> Calling this opcode in the same UDO as setksmps is not allowed. The opcode can only be used in UDOs. Global variables or bus channels should not be used.
>

## See also

[User Defined Opcodes (UDO)](../orch/user-defined-opcodes.md)

## Credits

Author: Victor Lazzarini

New in version 7.0
