<!--
id:scanmap
category:Signal Generators:Scanned Synthesis
-->
# scanmap
Allows the position and velocity of a node in a scanned process to be read.

Plugin opcode in scansyn.

## Syntax
=== "Modern"
    ``` csound-orc
    kpos, kvel = scanmap(iscan, kamp, kvamp [, iwhich])
    ```

=== "Classic"
    ``` csound-orc
    kpos, kvel scanmap iscan, kamp, kvamp [, iwhich]
    ```

### Initialization

_iscan_ -- which scan process to read

_iwhich_ (optional) -- which node to sense. The default is 0.

### Performance

_kamp_ -- amount to amplify the _kpos_ value.

_kvamp_ -- amount to amplify the _kvel_ value.

The internal state of a node is read. This includes its position and velocity. They are amplified by the _kamp_ and _kvamp_ values.

## Examples

Here is an example of the scanmap opcode. It uses the file [scanmap.csd](../examples/scanmap.csd).

``` csound-csd title="Example of the scanmap opcode." linenums="1"
--8<-- "examples/scanmap.csd"
```

Here is another example of the scanmap opcode. It uses the file [scanmap_matrxT.csd](../examples/scanmap_matrxT.csd).

``` csound-csd title="Second example of the scanma opcode." linenums="1"
--8<-- "examples/scanmap_matrxT.csd"
```

## See also

[Scanned Synthesis](../siggen/scantop.md)

More information on the Scanned Synthesis opcodes: [Working with Scanned Synthesis](http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html), written by Steven Yi, and some [tutorials](http://www.csounds.com/scanned/) by Richard Boulanger.

## Credits

Author: John ffitch

New in version 6.17
