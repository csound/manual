<!--
id:vcopy
category:Vectorial:Vectorial operations
-->
# vcopy
Copies between two vectorial control signals.

## Syntax
=== "Modern"
    ``` csound-orc
    vcopy(ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [, kverbose])
    ```

=== "Classic"
    ``` csound-orc
    vcopy ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [, kverbose]
    ```

### Initialization

_ifn1_ - number of the table where the vectorial signal will be copied (destination)

_ifn2_ - number of the table hosting the vectorial signal to be copied (source)

### Performance

_kelements_ - number of elements of the vector

_kdstoffset_ - index offset for the destination (_ifn1_) table (Default=0)

_ksrcoffset_ - index offset for the source (_ifn2_) table (Default=0)

_kverbose_ - Selects whether or not warnings are printed (Default=0)

_vcopy_ copies _kelements_ elements from _ifn2_ (starting from position _ksrcoffset_) to _ifn1_ (starting from position _kdstoffset_). Useful to keep old vector values, by storing them in another table.

Negative values for _kdstoffset_ and _ksrcoffset_ are acceptable. If _kdstoffset_ is negative, the out of range section of the vector will be discarded. If _kdstoffset_ is negative, the out of range elements will be assumed to be 1 (i.e. the destination elements will not be changed). If elements for the destination vector are beyond the size of the table (including guard point), these elements are discarded (i.e. elements do not wrap around the tables). If elements for the source vector are beyond the table length, these elements are taken as 1 (i.e. the destination vector will not be changed for these elements).

If the optional _kverbose_ argument is different to 0, the opcode will print warning messages every k-pass if table lengths are exceeded.

> :warning: **Warning**
>
> Using the same table as source and destination table in versions earlier than 5.04, might produce unexpected behavior, so use with care.

This opcode works at k-rate (this means that every k-pass the vectors are copied). There is an i-rate version of this opcode called [vcopy_i](../opcodes/vcopy_i.md).

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

All these operators ([vaddv](../opcodes/vaddv.md), [vsubv](../opcodes/vsubv.md), [vmultv](../opcodes/vmultv.md), [vdivv](../opcodes/vdivv.md), [vpowv](../opcodes/vpowv.md), [vexp](../opcodes/vexp.md), [vcopy](../opcodes/vcopy.md) and [vmap](../opcodes/vmap.md)) are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md) etc.

## Examples

Here is an example of the vcopy opcode. It uses the file [vcopy.csd](../examples/vcopy.csd).

``` csound-csd title="Example of the vcopy opcode." linenums="1"
--8<-- "examples/vcopy.csd"
```

## See also

[Operations Between two  Vectorial Signals](../vectorial/vectorial.md)

## Credits

Written by Gabriel Maldonado. Optional arguments added by Andres Cabrera and Istvan Varga.

New in Csound 5 (Previously available only on CsoundAV)
