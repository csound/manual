<!--
id:copya2ftab
category:Array Opcodes
-->
# copya2ftab
The _copya2ftab_ opcode takes a k-array and copies the contents to an f-table.

## Syntax
=== "Modern"
    ``` csound-orc
    copya2ftab(kArray[], ktab [, koffset])
    copya2ftab(iArray[], itab [, ioffset])
    ```

=== "Classic"
    ``` csound-orc
    copya2ftab kArray[], ktab [, koffset]
    copya2ftab iArray[], itab [, ioffset]
    ```

### Performance

_kArray[]_ --  one-dimensional array for source.

_ktab_ --  f-table for destination.

_koffset_ --  offset into the f-table (defaults to 0).

## Examples

=== "Modern"
    Here is an example of the copya2ftab opcode. It uses the file [copya2ftab-modern.csd](../examples/copya2ftab-modern.csd).
    ``` csound-csd title="Example of the copya2ftab opcode." linenums="1"
    --8<-- "examples/copya2ftab-modern.csd"
    ```

=== "Classic"
    Here is an example of the copya2ftab opcode. It uses the file [copya2ftab.csd](../examples/copya2ftab.csd).
    ``` csound-csd title="Example of the copya2ftab opcode." linenums="1"
    --8<-- "examples/copya2ftab.csd"
    ```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
October 2011<br>

New in Csound version 5.15

Renamed in Csound version 6.00

Offset added in version 6.14
