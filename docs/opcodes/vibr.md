<!--
id:vibr
category:Signal Generators:Basic Oscillators
-->
# vibr
Easier-to-use user-controllable vibrato.

## Syntax
=== "Modern"
    ``` csound-orc
    kout = vibr(kAverageAmp, kAverageFreq, ifn)
    ```

=== "Classic"
    ``` csound-orc
    kout vibr kAverageAmp, kAverageFreq, ifn
    ```

### Initialization

_ifn_ -- Number of vibrato table. It normally contains a sine or a triangle wave.

### Performance

_kAverageAmp_ -- Average amplitude value of vibrato

_kAverageFreq_ -- Average frequency value of vibrato (in cps)

_vibr_ is an easier-to-use version of [vibrato](../opcodes/vibrato.md). It has the same generation-engine of _vibrato_, but the parameters corresponding to missing input arguments are hard-coded to default values.

## Examples

Here is an example of the vibr opcode. It uses the file [vibr.csd](../examples/vibr.csd).

``` csound-orc title="Example of the vibr opcode." linenums="1"
--8<-- "examples/vibr.csd"
```

## See also

[Basic Oscillators](../siggen/basic.md)

## Credits

Author: Gabriel Maldonado

New in Version 4.15
