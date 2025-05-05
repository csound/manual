<!--
id:vexp_i
category:Vectorial:Scalar operations
-->
# vexp_i
Performs power-of operations between a vector and a scalar.

## Syntax
=== "Modern"
    ``` csound-orc
    vexp_i(ifn, ival, ielements [, idstoffset])
    ```

=== "Classic"
    ``` csound-orc
    vexp_i ifn, ival, ielements [, idstoffset]
    ```

### Initialization

_ifn_ - number of the table hosting the vectorial signal to be processed

_ival_ - scalar operand to be processed

_ielements_ - number of elements of the vector

_ival_ - scalar value to be added

_idstoffset_ - index offset for the destination table

### Performance

_vexp_i_ rises _ival_ to each element contained in a vector from table _ifn_, starting from table index _idstoffset_. This enables you to process a specific section of a table by specifying the offset and the number of elements to be processed. Offset is counted starting from 0, so if no offset is specified (or set to 0), the table will be modified from the beginning.

Negative values for _idstoffset_ are valid. Elements from the vector that are outside the table, will be discarded, and they will not wrap around the table.

This opcode runs only on initialization, there is a k-rate version of this opcode called [vexp](../opcodes/vexp.md).

In all these opcodes, the resulting vectors are stored in _ifn_, overriding the initial vectors. If you want to keep initial vector, use [vcopy](../opcodes/vcopy.md) or [vcopy_i](../opcodes/vcopy_i.md) to copy it in another table. All these operators are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md), etc.  They can also be useful in conjunction with the spectral opcodes [pvsftw](../opcodes/pvsftw.md) and [pvsftr](../opcodes/pvsftr.md).

## Examples

Here is an example of the vexp_i opcode. It uses the file [vexp_i.csd](../examples/vexp_i.csd).

``` csound-csd title="Example of the vexp_i opcode." linenums="1"
--8<-- "examples/vexp_i.csd"
```

## See also

[Operations Vectorial/Scalar Signal](../vectorial/scalar.md)

## Credits

Written by Gabriel Maldonado. Optional arguments added by Andres Cabrera and Istvan Varga.

New in Csound 5 (Previously available only on CsoundAV)
