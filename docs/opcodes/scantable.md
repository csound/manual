<!--
id:scantable
category:Signal Generators:Scanned Synthesis
-->
# scantable
A simpler scanned synthesis implementation.

This is an implementation of a circular string scanned using external tables. This opcode will allow direct modification and reading of values with the table opcodes.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = scantable(kamp, kpch, ipos, imass, istiff, idamp, ivel)
    ```

=== "Classic"
    ``` csound-orc
    aout scantable kamp, kpch, ipos, imass, istiff, idamp, ivel
    ```

### Initialization

_ipos_ -- table containing position array.

_imass_ -- table containing the mass of the string.

_istiff_ -- table containing the stiffness of the string.

_idamp_ -- table containing the damping factors of the string.

_ivel_ -- table containing the velocities.

### Performance

_kamp_ -- amplitude (gain) of the string.

_kpch_ -- the string's scanned frequency.

## Examples

Here is an example of the scantable opcode. It uses the file [scantable.csd](../examples/scantable.csd).

``` csound-csd title="Example of the scantable opcode." linenums="1"
--8<-- "examples/scantable.csd"
```

## See also

[Scanned Synthesis](../siggen/scantop.md)

More information on the Scanned Synthesis opcodes: [Working with Scanned Synthesis](http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html), written by Steven Yi, and some [tutorials](http://www.csounds.com/scanned/) by Richard Boulanger.

## Credits

Author: Matt Gilliard<br>
April 2002<br>

New in version 4.20
