<!--
id:vtabi
category:Vectorial:Tables
-->
# vtabi
Read vectors (from tables -or arrays of vectors) at init time.

## Syntax
=== "Modern"
    ``` csound-orc
    vtabi(indx, ifn, iout1 [, iout2, iout3, .... , ioutN ])
    ```

=== "Classic"
    ``` csound-orc
    vtabi indx, ifn, iout1 [, iout2, iout3, .... , ioutN ]
    ```

### Initialization

_indx_ - Index into f-table, either a positive number range matching the table length

_ifn_ - table number

_iout1...ioutN_ - output vector elements

### Performance

This opcode is useful in all cases in which one needs to access sets of values associated to unique indexes (for example, multi-channel samples, STFT bin frames, spectral formants, p-field based scores etc.). The number of elements of each vector (length of the vector) is determined by the number of optional arguments on the right (_iout1_, _iout2_, _iout3_, ....  _ioutN_).

Notice that no wrap nor limit mode is implemented.  So, if an index attempt to access to a zone not allocated by the table, Csound will probably crash. However this drawback can be easily avoided by using wrap or limit opcodes applied to indexes before using _vtabi_, in order to correct eventual out-of-range values.

The _vtab_ family is similar to _vtable_, but is much faster because interpolation is not available, table number cannot be changed after initialization, and only raw indexing is supported.

> :memo: **Note**
>
> Notice that _vtabi_'s output arguments are placed at the right of the opcode name, differently from usual (this style is already used in other opcodes using undefined lists of output arguments such as [fin](../opcodes/fin.md) or [trigseq](../opcodes/trigseq.md)).

## Examples

For an example of the vtabi opcode usage, see [vtablei](../opcodes/vtablei.md).

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
