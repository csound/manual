<!--
id:vpowv_i
category:Vectorial:Vectorial operations
-->
# vpowv_i
Performs power-of operations between two vectorial control signals at init time.

## Syntax
=== "Modern"
    ``` csound-orc
    vpowv_i(ifn1, ifn2, ielements [, idstoffset] [, isrcoffset])
    ```

=== "Classic"
    ``` csound-orc
    vpowv_i ifn1, ifn2, ielements [, idstoffset] [, isrcoffset]
    ```

### Initialization

_ifn1_  - number of the table hosting the first vector to be processed

_ifn2_  - number of the table hosting the second vector to be processed

_ielements_ - number of elements of the two vectors

_idstoffset_ - index offset for the destination (ifn1) table

_isrcoffset_ - index offset for the source (ifn2) table

### Performance

_vpowv_i_ raises each element of ifn1 to the corresponding element of ifn2. Each vectorial signal is hosted by a table (ifn1 and ifn2). The number of elements contained in both vectors must be the same.

The result is a new vectorial control signal that overrides old values of ifn1. If you want to keep the old ifn1 vector, use [vcopy_i](../opcodes/vcopy_i.md) opcode to copy it in another table. You can use _idstoffset_ and _isrcoffset_ to specify vectors in any location of the tables.

Negative values for _idstoffset_ and _isrcoffset_ are acceptable. If _idstoffset_ is negative, the out of range section of the vector will be discarded. If _isrcoffset_ is negative, the out of range elements will be assumed to be 1 (i.e. the destination elements will not be changed). If elements for the destination vector are beyond the size of the table (including guard point), these elements are discarded (i.e. elements do not wrap around the tables). If elements for the source vector are beyond the table length, these elements are taken as 1 (i.e. the destination vector will not be changed for these elements).

> :warning: **Warning**
>
> Using the same table as source and destination table in versions earlier than 5.04, might produce unexpected behavior, so use with care.

This opcode works at init time. There is an k-rate version of this opcode called [vpowv](../opcodes/vpowv.md).

All these operators ([vaddv_i](../opcodes/vaddv_i.md), [vsubv_i](../opcodes/vsubv_i.md), [vmultv_i](../opcodes/vmultv_i.md), [vdivv_i](../opcodes/vdivv_i.md), [vpowv_i](../opcodes/vpowv_i.md), [vexpv_i](../opcodes/vexpv_i.md), [vcopy](../opcodes/vcopy.md) and [vmap](../opcodes/vmap.md)) are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md) etc.

## See also

[Operations Between two  Vectorial Signals](../vectorial/vectorial.md)

## Credits

Written by Gabriel Maldonado. Optional arguments added by Andres Cabrera and Istvan Varga.

New in Csound 5 (Previously available only on CsoundAV)
