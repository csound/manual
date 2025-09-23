<!--
id:partikkelget
category:Signal Generators:Granular Synthesis
-->
# partikkelget
Get mask index for a specific mask parameter of a running _partikkel_ instance.

_partikkelget_ is an opcode for outputting [partikkel](../opcodes/partikkel.md) mask index for a specific parameter. Used together with _partikkelset_, it can be used to synchronize partikkel masking between several running instances of the _ partikkel_ opcode. It can also be used to control other processes based on the internal mask index, for example to create more complex masking patterns than is available with the regular grain masking system.

## Syntax
=== "Modern"
    ``` csound-orc
    kindex = partikkelget(kparameterindex, iopcode_id)
    ```

=== "Classic"
    ``` csound-orc
    kindex partikkelget kparameterindex, iopcode_id
    ```

### Initialization

_iopcode_id_ -- the opcode id, linking an instance of [partikkel](../opcodes/partikkel.md) to an instance of _partikkelsync_.

### Performance

_kmaskindex_ -- mask index output. Outputs the current mask index for the parameter specified with _kparameterindex_ in the partikkel instance identified with _iopcode_id_.

_kparameterindex_ -- mask parameter. Selection of the masking parameter for which to output the current mask index. The different parameters are identified as:

* 0: gain mask
* 1: pitch sweep start mask
* 2: pitch sweep end mask
* 3: fm modulation index mask
* 4: channel mask
* 5: waveform mix mask

## Examples

Here is an example of the partikkelget and partikkelset opcodes. It uses the file [partikkelgetset.csd](../examples/partikkelgetset.csd).

``` csound-csd title="Example of manipulating the internal mask index of partikkel, based on the value of other mask indices in the same partikkel instance." linenums="1"
--8<-- "examples/partikkelgetset.csd"
```

## See Also

[partikkel](../opcodes/partikkel.md)

## Credits

Author: Thom Johansen<br>
Author: Øyvind Brandtsegg<br>
May 2017<br>

New in version 6.09
