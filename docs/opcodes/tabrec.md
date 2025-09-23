<!--
id:tabrec
category:Table Control:Read/Write Operations
-->
# tabrec
Records control-rate signals on trigger-temporization basis.

## Syntax
=== "Modern"
    ``` csound-orc
    tabrec(ktrig_start, ktrig_stop, knumtics, kfn, kin1 [,kin2,...,kinN])
    ```

=== "Classic"
    ``` csound-orc
    tabrec ktrig_start, ktrig_stop, knumtics, kfn, kin1 [,kin2,...,kinN]
    ```

### Performance

_ktrig_start_ -- start recording when non-zero.

_ktrig_stop_ -- stop recording when _knumtics_ trigger impulses are received by this input argument.

_knumtics_ -- stop recording or reset playing pointer to zero when the number of tics defined by this argument is reached.

_kfn_ -- table where k-rate signals are recorded.

_kin1,...,kinN_ -- input signals to record.

The _tabrec_ and [tabplay](../opcodes/tabplay.md) opcodes allow to record/playback control signals on trigger-temporization basis.

_tabrec_ opcode records a group of k-rate signals by storing them into _kfn_ table. Each time _ktrig_start_ is triggered, _tabrec_ resets the table pointer to zero and begins to record. Recording phase stops after _knumtics_ trigger impulses have been received by _ktrig_stop_ argument.

These opcodes can be used like a  sort of &ldquo;middle-term&rdquo; memory that &ldquo;remembers&rdquo; generated signals. Such memory can be used to supply generative music with a coherent iterative compositional structure.

## Examples

Here is an example of the tabrec opcode. It uses the file [tabrec.csd](../examples/tabrec.csd).

``` csound-csd title="Example of the tabrec opcode." linenums="1"
--8<-- "examples/tabrec.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Written by Gabriel Maldonado.

Example written by Iain McCurdy
