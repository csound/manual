<!--
id:vtable1k
category:Vectorial:Tables
-->
# vtable1k
Read a vector (several scalars simultaneously) from a table at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    vtable1k(kfn, kout1 [, kout2, kout3, .... , koutN ])
    ```

=== "Classic"
    ``` csound-orc
    vtable1k kfn, kout1 [, kout2, kout3, .... , koutN ]
    ```

### Performance

_kfn_ - table number

_kout1...koutN_ - output vector elements

_vtable1k_ is a reduced version of [vtablek](../opcodes/vtablek.md), it only allows to access the first vector (it is equivalent to vtablek with kndx = zero, but a bit faster). It is useful to easily and quickly convert a set of values stored in a table into a set of k-rate variables to be used in normal opocodes, instead of using individual [table](../opcodes/table.md) opcodes for each value.

> :memo: **Note**
>
> _vtable1k_ is an unusual opcode as it produces its output on the right side arguments of the opcode.

## Examples

Here is an example of the vtable1k opcode. It uses the files [vtable1k.csd](../examples/vtable1k.csd).

``` csound-csd title="Example of the vtable1k opcode." linenums="1"
--8<-- "examples/vtable1k.csd"
```

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5.06
