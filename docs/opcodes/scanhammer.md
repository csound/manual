<!--
id:scanhammer
category:Signal Generators:Scanned Synthesis
-->
# scanhammer
Copies from one table to another with a gain control.

This is is a variant of [tablecopy](../opcodes/tablecopy.md), copying from one table to another, starting at _ipos_, and with a gain control. The number of points copied is determined by the length of the source. Other points are not changed. This opcode can be used to &#8220;hit&#8221; a string in the scanned synthesis code.

## Syntax
=== "Modern"
    ``` csound-orc
    scanhammer(isrc, idst, ipos, imult)
    ```

=== "Classic"
    ``` csound-orc
    scanhammer isrc, idst, ipos, imult
    ```

### Initialization

_isrc_ -- source function table.

_idst_ -- destination function table.

_ipos_ -- starting position (in points).

_imult_ -- gain multiplier. A value of 0 will leave values unchanged.

## Examples

Here is an example of the scanhammer opcode. It uses the file [scanhammer.csd](../examples/scanhammer.csd).

``` csound-csd title="Example of the scanhammer opcode." linenums="1"
--8<-- "examples/scanhammer.csd"
```

## See also

[Scanned Synthesis](../siggen/scantop.md)

More information on the Scanned Synthesis opcodes: [Working with Scanned Synthesis](http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html), written by Steven Yi, and some [tutorials](http://www.csounds.com/scanned/) by Richard Boulanger.

## Credits

Author: Matt Gilliard<br>
April 2002<br>

New in version 4.20
