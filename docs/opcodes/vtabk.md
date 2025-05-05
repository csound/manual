<!--
id:vtabk
category:Vectorial:Tables
-->
# vtabk
Read vectors (from tables -or arrays of vectors) at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    vtabk(kndx, ifn, kout1 [, kout2, kout3, .... , koutN ])
    ```

=== "Classic"
    ``` csound-orc
    vtabk kndx, ifn, kout1 [, kout2, kout3, .... , koutN ]
    ```

### Initialization

_ifn_ - table number

### Performance

_kndx_ - Index into f-table, either a positive number range matching the table length

_kout1...koutN_ - output vector elements

This opcode is useful in all cases in which one needs to access sets of values associated to unique indexes (for example, multi-channel samples, STFT bin frames, spectral formants, p-field based scores etc.) . The number of elements of each vector (length of the vector) is determined by the number of optional arguments on the right (_kout1_, _kout2_, _kout3_, ....  _koutN_).

Notice that no wrap nor limit mode is implemented.  So, if an index attempt to access to a zone not allocated by the table, Csound will probably crash. However this drawback can be easily avoided by using wrap or limit opcodes applied to indexes before using _vtabk_, in order to correct eventual out-of-range values.

The _vtab_ family is similar to _vtable_, but is much faster because interpolation is not available, table number cannot be changed after initialization, and only raw indexing is supported.

> :memo: **Note**
>
> Notice that _vtabk_'s output arguments are placed at the right of the opcode name, differently from usual (this style is already used in other opcodes using undefined lists of output arguments such as [fin](../opcodes/fin.md) or [trigseq](../opcodes/trigseq.md)).

## Examples

For an example of the vtabk opcode usage, see [vtablek](../opcodes/vtablek.md).

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
