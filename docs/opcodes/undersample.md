<!--
id:undersample
category:Signal I/O:Software Bus
-->
# undersample
Sets a lower local sampling rate based on an undersampling factor.

## Syntax
=== "Modern"
    ``` csound-orc
    undersample(ifactor [,icvt_in, icvt_out])
    ```

=== "Classic"
    ``` csound-orc
    undersample ifactor [,icvt_in, icvt_out]
    ```

### Initialization

_ifactor_ -- sets the undersampling factor. It needs to be a positive integer &gt; 1. A factor of 1 is a non-op, zero or negative factors are illegal. The local sampling rate is set as (1/ifactor) * sr. The value of the sr variable is then changed locally. Local ksmps is also changed accordingly.

_icvt_in_ -- converter used for input: if Secret Rabbit Code is used, then 0 - best quality sync (default); 1 - medium quality sync; 2 - fast sync; 3 - zero-order hold; and  4 - linear. 5 to 9 are the same five converters.

_icvt_out_ -- converter used for output, defaults to the input converter, but can be different. 5 to 9 are the same five converters.

> :memo: **Note**
>
> Higher-quality sync converters add latency to the signal (0, 1, 2, increasing with quality). At a factor of 2, through the input and output together, it is 574, 186 and 78 samples, and 4 and 3 samples for converters 3 and 4.
>
> k-rate arguments and outputs, and arrays of them, pass through unconverted with every converter, as the control rate does not change. So 5 to 9, which hold them under [oversample](../opcodes/oversample.md), are the same as 0 to 4 here.
>
> Calling this opcode in the same UDO as setksmps is not allowed. The opcode can only be used in UDOs. Global variables or bus channels should not be used.

## See also

[User Defined Opcodes (UDO)](../orch/user-defined-opcodes.md)

## Credits

Author: Victor Lazzarini

New in version 7.0
