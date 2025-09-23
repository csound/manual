<!--
id:vcopy_i
category:Vectorial:Vectorial operations
-->
# vcopy_i
Copies a vector from one table to another.

## Syntax
=== "Modern"
    ``` csound-orc
    vcopy_i(ifn1, ifn2, ielements [,idstoffset, isrcoffset])
    ```

=== "Classic"
    ``` csound-orc
    vcopy_i ifn1, ifn2, ielements [,idstoffset, isrcoffset]
    ```

### Initialization

_ifn1_  - number of the table where the vectorial signal will be copied

_ifn2_  - number of the table hosting the vectorial signal to be copied

_ielements_ - number of elements of the vector

_idstoffset_ - index offset for destination table

_isrcoffset_ - index offset for source table

### Performance

_vcopy_i_ copies _ielements_ elements from _ifn2_ (starting from position _isrcoffset_) to _ifn1_ (starting from position _idstoffset_). Useful to keep old vector values, by storing them in another table. This opcode is exactly the same as [vcopy](../opcodes/vcopy.md) but performs all the copying on the intialization pass only.

Negative values for _idstoffset_ and _isrcoffset_ are acceptable. If _idstoffset_ is negative, the out of range section of the vector will be discarded. If _isrcoffset_ is negative, the out of range elements will be assumed to be 0 (i.e. the destination elements will be set to 0). If elements for the destination vector are beyond the size of the table (including guard point), these elements are discarded (i.e. elements do not wrap around the tables). If elements for the source vector are beyond the table length, these elements are taken as 0 (i.e. the destination vector elements will be 0).

> :warning: **Warning**
>
> Using the same table as source and destination table in versions earlier than 5.04, might produce unexpected behavior, so use with care.

All these operators ([vaddv](../opcodes/vaddv.md), [vsubv](../opcodes/vsubv.md), [vmultv](../opcodes/vmultv.md), [vdivv](../opcodes/vdivv.md), [vpowv](../opcodes/vpowv.md), [vexp](../opcodes/vexp.md), [vcopy](../opcodes/vcopy.md) and [vmap](../opcodes/vmap.md)) are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md) etc.

## Examples

See [vcopy](../opcodes/vcopy.md) for an example.

## See also

[Operations Between two  Vectorial Signals](../vectorial/vectorial.md)

## Credits

Written by Gabriel Maldonado. Optional arguments added by Andres Cabrera and Istvan Varga.

New in Csound 5 (Previously available only on CsoundAV)
