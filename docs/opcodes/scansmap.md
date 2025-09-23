<!--
id:scansmap
category:Signal Generators:Scanned Synthesis
-->
# scansmap
Allows the position and velocity of a node in a scanned process to be written.

Plugin opcode in scansyn.

## Syntax
=== "Modern"
    ``` csound-orc
    scansmap(kpos, kvel, iscan, kamp, kvamp [, iwhich])
    ```

=== "Classic"
    ``` csound-orc
    scansmap kpos, kvel, iscan, kamp, kvamp [, iwhich]
    ```

### Initialization

_iscan_ -- which scan process to write

_iwhich_ (optional) -- which node to sense. The default is 0.

### Performance

_kpos_ -- the node's position.

_kvel_ -- the node's velocity.

_kamp_ -- amount to amplify the _kpos_ value.

_kvamp_ -- amount to amplify the _kvel_ value.

The internal state of a node to write. This includes its position and velocity. They are amplified by the _kamp_ and _kvamp_ values.

## Examples

Here is an example of the scansmap opcode. It uses the file [scansmap.csd](../examples/scansmap.csd).

``` csound-csd title="Example of the scansmap opcode." linenums="1"
--8<-- "examples/scansmap.csd"
```

## See also

[Scanned Synthesis](../siggen/scantop.md)

More information on the Scanned Synthesis opcodes: [Working with Scanned Synthesis](http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html), written by Steven Yi, and some [tutorials](http://www.csounds.com/scanned/) by Richard Boulanger.

## Credits

Author: John ffitch

New in version 6.17
