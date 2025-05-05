<!--
id:osciln
category:Signal Generators:Basic Oscillators
-->
# osciln
Accesses table values at a user-defined frequency.

This opcode can also be written as [oscilx](../opcodes/oscilx.md).

## Syntax
=== "Modern"
    ``` csound-orc
    ares = osciln(kamp, ifrq, ifn, itimes)
    ```

=== "Classic"
    ``` csound-orc
    ares osciln kamp, ifrq, ifn, itimes
    ```

### Initialization

_ifrq, itimes_ -- rate and number of times through the stored table.

_ifn_ -- function table number.

### Performance

_kamp_ -- amplitude factor

_osciln_ will sample several times through the stored table at a rate of _ifrq_ times per second, after which it will output zeros. Generates audio signals only, with output values scaled by _kamp._

## Examples

Here is an example of the osciln opcode. It uses the file [osciln.csd](../examples/osciln.csd).

``` csound-orc title="Example of the osciln opcode." linenums="1"
--8<-- "examples/osciln.csd"
```

## See Also

[Table Access](../siggen/tableacc.md)
