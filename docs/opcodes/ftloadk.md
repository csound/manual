<!--
id:ftloadk
category:Table Control:Read/Write Operations
-->
# ftloadk
Load a set of previously-allocated tables from a file.

## Syntax
=== "Modern"
    ``` csound-orc
    ftloadk(Sfilename, ktrig, iflag, ifn1 [, ifn2] [...])
    ```

=== "Classic"
    ``` csound-orc
    ftloadk Sfilename, ktrig, iflag, ifn1 [, ifn2] [...]
    ```

### Initialization

_Sfilename_ -- A string value denoting the name of the file to load.

_iflag_ -- Type of the file to load/save. (0 = binary file, Non-zero = text file)

_ifn1, ifn2, ..._ -- Numbers of tables to load.

### Performance

_ktrig_ -- The trigger signal. Load the file each time it is non-zero.

_ftloadk_ loads a list of tables from a file. (The tables have to be already allocated though.) The file's format can be binary or text. Unlike [ftload](../opcodes/ftload.md), the loading operation can be repeated numerous times within the same note by using a trigger signal.

> :warning: **Warning**
>
> The file's format is not compatible with a WAV-file and is not endian-safe.

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Gabriel Maldonado

New in version 4.21
