<!--
id:vpow_i
category:Vectorial:Scalar operations
-->
# vpow_i
Raises each element of a vector to a scalar power.

## Syntax
=== "Modern"
    ``` csound-orc
    vpow_i(ifn, ival, ielements [, idstoffset])
    ```

=== "Classic"
    ``` csound-orc
    vpow_i ifn, ival, ielements [, idstoffset]
    ```

### Initialization

_ifn_  - number of the table hosting the vectorial signal to be processed

_ielements_ - number of elements of the vector

_ival_ - scalar value to which the elements of ifn will be raised

_idstoffset_ - index offset for the destination table

### Performance

_vpow_i_ elevates each element of the vector contained in the table _ifn_ to the power of _ival_, starting from table index _idstoffset_. This enables you to process a specific section of a table by specifying the offset and the number of elements to be processed. Offset is counted starting from 0, so if no offset is specified (or set to 0), the table will be modified from the beginning.

This opcode runs only on initialization, there is a k-rate version of this opcode called [vpow](../opcodes/vpow.md).

Negative values for _idstoffset_ are valid. Elements from the vector that are outside the table, will be discarded, and they will not wrap around the table.

In all these opcodes, the resulting vectors are stored in _ifn_, overriding the intial vectors. If you want to keep initial vector, use [vcopy](../opcodes/vcopy.md) or [vcopy_i](../opcodes/vcopy_i.md) to copy it in another table. All these operators are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md), etc.  They can also be useful in conjunction with the spectral opcodes [pvsftw](../opcodes/pvsftw.md) and [pvsftr](../opcodes/pvsftr.md).

## Examples

Here is an example of the vpow_i opcode. It uses the file [vpow_i.csd](../examples/vpow_i.csd).

``` csound-csd title="Examples of the vpow_i opcode." linenums="1"
--8<-- "examples/vpow_i.csd"
```

Here is another example of the vpow_i opcode. It uses the file [vpow_i-2.csd](../examples/vpow_i-2.csd).

``` csound-csd linenums="1"
--8<-- "examples/vpow_i-2.csd"
```

## See also

[Operations Vectorial/Scalar Signal](../vectorial/scalar.md)

## Credits

Written by Gabriel Maldonado. Optional arguments added by Andres Cabrera and Istvan Varga.

New in Csound 5 (Previously available only on CsoundAV)
