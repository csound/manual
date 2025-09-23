<!--
id:vmap
category:Vectorial:Vectorial operations
-->
# vmap
Maps elements from a vector onto another according to indexes.

## Syntax
=== "Modern"
    ``` csound-orc
    vmap(ifn1, ifn2, ielements [,idstoffset, isrcoffset])
    ```

=== "Classic"
    ``` csound-orc
    vmap ifn1, ifn2, ielements [,idstoffset, isrcoffset]
    ```

### Initialization

_ifn1_ - number of the table where the vectorial signal will be copied, and which contains the mapping vector

_ifn2_ - number of the table hosting the vectorial signal to be copied

_ielements_ - number of elements to process

_idstoffset_ - index offset for destination table (_ifn1_)

_isrcoffset_ - index offset for source table (_ifn2_)

### Performance

_vmap_ maps elements of _ifn2_ according to the values of table _ifn1_. Elements of _ifn1_ are treated as indexes of table _ifn2_, so element values of _ifn1_ must not exceed the length of _ifn2_ table otherwise a Csound will report an error. Elements of _ifn1_ are treated as integers, so any fractional part will be truncated. There is no interpolation performed on this operation.

In practice, what happens is that the elements of _ifn1_ are used as indexes to _ifn2_, and then are replaced by the corresponding elements from _ifn2_. _ifn1_ must be different from _ifn2_, otherwise the results are unpredictable. Csound will produce an init error if they are not.

All these operators ([vaddv](../opcodes/vaddv.md), [vsubv](../opcodes/vsubv.md), [vmultv](../opcodes/vmultv.md), [vdivv](../opcodes/vdivv.md), [vpowv](../opcodes/vpowv.md), [vexpv](../opcodes/vexpv.md), [vcopy](../opcodes/vcopy.md) and [vmap](../opcodes/vmap.md)) are designed to be used together with other opcodes that operate with vectorial signals such as, [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md), etc.

## Examples

Here is an example of the vmap opcode. It uses the file [vmap.csd](../examples/vmap.csd).

``` csound-csd title="Example of the vmap opcode." linenums="1"
--8<-- "examples/vmap.csd"
```

## See also

[Operations Between two  Vectorial Signals](../vectorial/vectorial.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
