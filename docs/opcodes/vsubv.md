<!--
id:vsubv
category:Vectorial:Vectorial operations
-->
# vsubv
Performs subtraction between two vectorial control signals.

## Syntax
=== "Modern"
    ``` csound-orc
    vsubv(ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose])
    ```

=== "Classic"
    ``` csound-orc
    vsubv ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose]
    ```

### Initialization

_ifn1_ - number of the table hosting the first vector to be processed

_ifn2_ - number of the table hosting the second vector to be processed

### Performance

_kelements_ - number of elements of the two vectors

_kdstoffset_ - index offset for the destination (_ifn1_) table (Default=0)

_ksrcoffset_ - index offset for the source (_ifn2_) table (Default=0)

_kverbose_ - Selects whether or not warnings are printed (Default=0)

_vsubv_ subtracts two vectorial control signals, that is, each element of _ifn2_ is substracted from the corresponding element of _ifn1_. Each vectorial signal is hosted by a table (_ifn1_ and _ifn2_). The number of elements contained in both vectors must be the same.

The result is a new vectorial control signal that overrides old values of _ifn1_. If you want to keep the old _ifn1_ vector, use [vcopy_i](../opcodes/vcopy_i.md) opcode to copy it in another table. You can use _kdstoffset_ and _ksrcoffset_ to specify vectors in any location of the tables.

Negative values for _kdstoffset_ and _ksrcoffset_ are acceptable. If _kdstoffset_ is negative, the out of range section of the vector will be discarded. If _ksrcoffset_ is negative, the out of range elements will be assumed to be 0 (i.e. the destination elements will not be changed). If elements for the destination vector are beyond the size of the table (including guard point), these elements are discarded (i.e. elements do not wrap around the tables). If elements for the source vector are beyond the table length, these elements are taken as 0 (i.e. the destination vector will not be changed for these elements).

If the optional _kverbose_ argument is different to 0, the opcode will print warning messages every k-pass if table lengths are exceeded.

> :warning: **Warning**
>
> Using the same table as source and destination table in versions earlier than 5.04, might produce unexpected behavior, so use with care.

This opcode works at k-rate (this means that every k-pass the
vectors are subtracted). There is an i-rate version of this opcode called [vsubv_i](../opcodes/vsubv_i.md).

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

All these operators ([vaddv](../opcodes/vaddv.md), [vsubv](../opcodes/vsubv.md), [vmultv](../opcodes/vmultv.md), [vdivv](../opcodes/vdivv.md), [vpowv](../opcodes/vpowv.md), [vexpv](../opcodes/vexpv.md), [vcopy](../opcodes/vcopy.md) and [vmap](../opcodes/vmap.md)) are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md), etc.

## Examples

Here is an example of the vsubv opcode. It uses the file [vsubv.csd](../examples/vsubv.csd).

``` csound-csd title="Example of the vsubv opcode." linenums="1"
--8<-- "examples/vsubv.csd"
```

## See also

[Operations Between two  Vectorial Signals](../vectorial/vectorial.md)

## Credits

Written by Gabriel Maldonado. Optional arguments added by Andres Cabrera and Istvan Varga.

New in Csound 5 (Previously available only on CsoundAV)
