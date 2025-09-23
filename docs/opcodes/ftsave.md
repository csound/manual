<!--
id:ftsave
category:Table Control:Read/Write Operations
-->
# ftsave
Save a set of previously-allocated tables to a file.

## Syntax
=== "Modern"
    ``` csound-orc
    ftsave("filename", iflag, ifn1 [, ifn2] [...])
    ```

=== "Classic"
    ``` csound-orc
    ftsave "filename", iflag, ifn1 [, ifn2] [...]
    ```

### Initialization

_"filename"_ -- A quoted string containing the name of the file to save.

_iflag_ -- Type of the file to save. (0 = binary file, Non-zero = text file)

_ifn1, ifn2, ..._ -- Numbers of tables to save.

### Performance

_ftsave_ saves a list of tables to a file. The file's format can be binary or text.

> :warning: **Warning**
>
> The file's format is not compatible with a WAV-file and is not endian-safe.

## Examples

Here is an example of the ftsave opcode. It uses the file [ftsave.csd](../examples/ftsave.csd).

``` csound-csd title="Example of the ftsave opcode." linenums="1"
--8<-- "examples/ftsave.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Gabriel Maldonado

Example written by Kevin Conder.

New in version 4.21
