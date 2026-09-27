<!--
id:copyf2array
category:Array Opcodes
-->
# copyf2array
Copies a function table into a one-dimensional numeric array.

## Syntax
=== "Modern"
    ``` csound-orc
    copyf2array(kArray[], kftbl)
    copyf2array(iArray[], iftbl)
    ```

=== "Classic"
    ``` csound-orc
    copyf2array kArray[], kftbl
    copyf2array iArray[], iftbl
    ```

### Performance

`kArray[]` or `iArray[]` is the destination array. `kftbl` or `iftbl` is the source function table number. The array comes first, even though it receives the data.

The i-rate form copies once at initialization. The k-rate form copies at initialization and on every control cycle. The source table must exist and its number must be set before initialization reaches the opcode.

If the array has no storage yet, the opcode allocates it at initialization to match the table length. For an existing array, it copies the smaller of the array length and table length. It leaves any remaining array elements unchanged. The copy excludes the table's guard point.

## Replacing copy2ttab

[copy2ttab](copy2ttab.md) is the deprecated performance-only name. Replace `copy2ttab(kArray, kftbl)` with `copyf2array(kArray, kftbl)`.

The replacement also copies at initialization. Account for that earlier copy if other initialization code reads or changes the array. Use the table number, not a table variable, as the second argument.

## Examples

=== "Modern"
    Here is an example of the copyf2array opcode. It uses the file [copyf2array-modern.csd](../examples/copyf2array-modern.csd).
    ``` csound-csd title="Example of the copyf2array opcode." linenums="1"
    --8<-- "examples/copyf2array-modern.csd"
    ```

=== "Classic"
    Here is an example of the copyf2array opcode. It uses the file [copyf2array.csd](../examples/copyf2array.csd).
    ``` csound-csd title="Example of the copyf2array opcode." linenums="1"
    --8<-- "examples/copyf2array.csd"
    ```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
October 2011<br>

New in Csound version 5.15

Renamed in Csound version 6.00
