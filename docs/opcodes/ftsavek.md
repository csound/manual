<!--
id:ftsavek
category:Table Control:Read/Write Operations
-->
# ftsavek
Save a set of previously-allocated tables to a file.

## Syntax
=== "Modern"
    ``` csound-orc
    ftsavek("filename", ktrig, iflag, ifn1 [, ifn2] [...])
    ```

=== "Classic"
    ``` csound-orc
    ftsavek "filename", ktrig, iflag, ifn1 [, ifn2] [...]
    ```

### Initialization

_"filename"_ -- A quoted string containing the name of the file to save.

_iflag_ -- Type of the file to save. (0 = binary file, Non-zero = text file)

_ifn1, ifn2, ..._ -- Numbers of tables to save.

### Performance

_ktrig_ -- The trigger signal. Save the file each time it is non-zero.

_ftsavek_ saves a list of tables to a file. The file's format can be binary or text. Unlike [ftsave](../opcodes/ftsave.md), the saving operation can be repeated numerous times within the same note by using a trigger signal.

> :warning: **Warning**
>
> The file's format is not compatible with a WAV-file and is not endian-safe.

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Gabriel Maldonado

New in version 4.21
