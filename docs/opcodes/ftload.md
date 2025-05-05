<!--
id:ftload
category:Table Control:Read/Write Operations
-->
# ftload
Load a set of previously-allocated tables from a file.

## Syntax
=== "Modern"
    ``` csound-orc
    ftload(Sfilename, iflag, ifn1 [, ifn2] [...])
    ```

=== "Classic"
    ``` csound-orc
    ftload Sfilename, iflag, ifn1 [, ifn2] [...]
    ```

### Initialization

_Sfilename;_ -- A string value denoting name of the file to load.

_iflag_ -- Type of the file to load/save. (0 = binary file, Non-zero = text file)

_ifn1, ifn2, ..._ -- Numbers of tables to load.

### Performance

_ftload_ loads a list of tables from a file. (The tables have to be already allocated though.) The file's format can be binary or text.

> :warning: **Warning**
>
> The file's format is not compatible with a WAV-file and is not endian-safe.

## Examples

See the example for [ftsave](../opcodes/ftsave.md).

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Gabriel Maldonado

New in version 4.21
