<!--
id:vport
category:Vectorial:Delay Paths
-->
# vport
Generate a sort of 'vectorial' portamento.

## Syntax
=== "Modern"
    ``` csound-orc
    vport(ifn, khtime, ielements [, ifnInit])
    ```

=== "Classic"
    ``` csound-orc
    vport ifn, khtime, ielements [, ifnInit]
    ```

### Initialization

_ifn_ - number of the table containing the output vector

_ielements_ - number of elements of the two vectors

_ifnInit_ (optional) - number of the table containing a vector whose elements contain initial portamento values.

### Performance

_vport_ is similar to [port](../opcodes/port.md), but operates with vectorial signals, instead of with scalar signals. Each vector element is treated as an independent control signal. Input and output vectors are placed in the same table and output vector overrides input vector. If you want to keep input vector, use [vcopy](../opcodes/vcopy.md) opcode to copy it in another table.

## See also

[Vectorial Control-rate Delay Paths](../vectorial/delay.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
