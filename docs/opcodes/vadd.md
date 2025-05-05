<!--
id:vadd
category:Vectorial:Scalar operations
-->
# vadd
Adds a scalar value to a vector in a table.

## Syntax
=== "Modern"
    ``` csound-orc
    vadd(ifn, kval, kelements [, kdstoffset] [, kverbose])
    ```

=== "Classic"
    ``` csound-orc
    vadd ifn, kval, kelements [, kdstoffset] [, kverbose]
    ```

### Initialization

_ifn_  - number of the table hosting the vectorial signal to be processed

### Performance

_kval_ - scalar value to be added

_kelements_ - number of elements of the vector

_kdstoffset_ - index offset for the destination table (Optional, default=0)

_kverbose_ - Selects whether or not warnings are printed (Optional, default=0)

_vadd_ adds the value of _kval_ to each element of the vector contained in the table _ifn_, starting from table index _kdstoffset_. This enables you to process a specific section of a table by specifying the offset and the number of elements to be processed. Offset is counted starting from 0, so if no offset is specified (or set to 0), the table will be modified from the beginning.

Note that this opcode runs at k-rate so the value of _kval_ is added every control period. Use with care or you will end up with very large numbers (or use [vadd_i](../opcodes/vadd_i.md)).

These opcodes ([vadd](../opcodes/vadd.md), [vmult](../opcodes/vmult.md), [vpow](../opcodes/vpow.md) and [vexp](../opcodes/vexp.md)) perform numeric operations between a vectorial control signal (hosted by the table _ifn_), and a scalar signal (_kval_). Result is a new vector that overrides old values of _ifn_. All these opcodes work at k-rate.

Negative values for _kdstoffset_ are valid. Elements from the vector that are outside the table, will be discarded, and they will not wrap around the table.

If the optional _kverbose_ argument is different to 0, the opcode will print warning messages every k-pass if table lengths are exceeded.

In all these opcodes, the resulting vectors are stored in _ifn_, overriding the intial vectors. If you want to keep initial vector, use [vcopy](../opcodes/vcopy.md) or [vcopy_i](../opcodes/vcopy_i.md) to copy it in another table. All these operators are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md), etc.  They can also be useful in conjunction with the spectral opcodes [pvsftw](../opcodes/pvsftw.md) and [pvsftr](../opcodes/pvsftr.md).

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

## Examples

Here is an example of the vadd opcode. It uses the file [vadd.csd](../examples/vadd.csd).

``` csound-csd title="Example of the vadd opcode." linenums="1"
--8<-- "examples/vadd.csd"
```

## See also

[Operations Vectorial/Scalar Signal](../vectorial/scalar.md)

## Credits

Written by Gabriel Maldonado. Optional arguments added by Andres Cabrera and Istvan Varga.

New in Csound 5 (Previously available only on CsoundAV)
