<!--
id:vaddv
category:Vectorial:Vectorial operations
-->
# vaddv
Performs addition between two vectorial control signals.

## Syntax
=== "Modern"
    ``` csound-orc
    vaddv(ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose])
    ```

=== "Classic"
    ``` csound-orc
    vaddv ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose]
    ```

### Initialization

_ifn1_  - number of the table hosting the first vector to be processed

_ifn2_  - number of the table hosting the second vector to be processed

### Performance

_kelements_ - number of elements of the two vectors

_kdstoffset_ - index offset for the destination (_ifn1_) table (Default=0)

_ksrcoffset_ - index offset for the source (_ifn2_) table (Default=0)

_kverbose_ - Selects whether or not warnings are printed (Default=0)

_vaddv_ adds two vectorial control signals, that is, each element of the first vector is processed (only) with the corresponding element of the other vector. Each vectorial signal is hosted by a table (_ifn1_ and _ifn2_). The number of elements contained in both vectors must be the same.

The result is a new vectorial control signal that overrides old values of ifn1. If you want to keep the old ifn1 vector, use [vcopy_i](../opcodes/vcopy_i.md)opcode to copy it in another table. You can use _kdstoffset_ and _ksrcoffset_ to specify vectors in any location of the tables.

Negative values for _kdstoffset_ and _ksrcoffset_ are acceptable. If _kdstoffset_ is negative, the out of range section of the vector will be discarded. If _ksrcoffset_ is negative, the out of range elements will be assumed to be 0 (i.e. the destination elements will not be changed). If elements for the destination vector are beyond the size of the table (including guard point), these elements are discarded (i.e. elements do not wrap around the tables). If elements for the source vector are beyond the table length, these elements are taken as 0 (i.e. the destination vector will not be changed for these elements).

> :warning: **Warning**
>
> Using the same table as source and destination table in versions earlier than 5.04, might produce unexpected behavior, so use with care.

This opcode works at k-rate (this means that every k-pass the
vectors are added). There is an i-rate version of this opcode called [vaddv_i](../opcodes/vaddv_i.md).

> :memo: **Note**
>
> Please note that the _elements_ argument has changed in version 5.03 from i-rate to k-rate. This will change the opcode's behavior in the unusual cases where the i-rate variable _ielements_ is changed inside the instrument, for example in:
>
> ``` csound-orc
      instr 1
  ielements  =        10
             vadd     1, 1, ielements
  ielements  =        20
             vadd     2, 1, ielements
             turnoff
      endin
> ```

All these operators ([vaddv](../opcodes/vaddv.md), [vsubv](../opcodes/vsubv.md), [vmultv](../opcodes/vmultv.md), [vdivv](../opcodes/vdivv.md), [vpowv](../opcodes/vpowv.md), [vexpv](../opcodes/vexpv.md), [vcopy](../opcodes/vcopy.md) and [vmap](../opcodes/vmap.md)) are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md) etc.

## Examples

Here is an example of the vaddv opcode. It uses the file [vaddv.csd](../examples/vaddv.csd).

``` csound-csd title="Example of the vaddv opcode." linenums="1"
--8<-- "examples/vaddv.csd"
```

## See also

[Operations Between two  Vectorial Signals](../vectorial/vectorial.md)

## Credits

Written by Gabriel Maldonado. Optional arguments added by Andres Cabrera and Istvan Varga.

New in Csound 5 (Previously available only on CsoundAV)
