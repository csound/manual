<!--
id:select
category:Miscellaneous
-->
# select
Select sample value from three based on audio-rate comparisons of two signals.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = select(a1, a2, aless, aequal, amore)
    ```

=== "Classic"
    ``` csound-orc
    aout select a1, a2, aless, aequal, amore
    ```

### Performance

_a1, a2_ -- audio signals that are compared.

_aless_ -- audio signal selected if a1[n]&lt;a2[n]

_aequal_ -- audio signal selected if a1[n]=a2[n]

_asig_ -- audio signal selected if a1[n]&gt;a2[n]

The comparison is made sample by sample.

## Examples

Here is an example of the select opcode. It uses the file [select.csd](../examples/select.csd).

``` csound-csd title="Example of the select opcode." linenums="1"
--8<-- "examples/select.csd"
```

## See also

[Miscellaneous opcodes](../miscopcodes.md)

## Credits

By: John ffitch 2016

New in vesion 6.09
