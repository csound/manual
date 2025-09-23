<!--
id:directory
category:Miscellaneous
-->
# directory
Reads a directory and outputs to a string array a list of file names.

Users can set the file type by passing a file extension as a string.

## Syntax
=== "Modern"
    ``` csound-orc
    SFiles[] = directory(SDirectory [, SExtention])
    ```

=== "Classic"
    ``` csound-orc
    SFiles[] directory SDirectory [, SExtention]
    ```

### Initialization

_SDirectory_ -- a string that identifies the directory to browse for files

_SExtention_ -- Optional. Sets the desired file type. If left out, all files names will be retrieved.

### Performance

_SFiles[]_ -- a string array that holds the names of all files of a given type found in the directory.

> :memo: **Note**
>
> This works at i-time only and will not pick up changes made to the directory after performance has started.

## Examples

This example shows how directory can be used to browse for .wav files in a fixed location. _printf_i_ is then used to print the file names. It uses the file [directory.csd](../examples/directory.csd).

``` csound-csd title="Example of the directory opcode." linenums="1"
--8<-- "examples/directory.csd"
```

## See also

[Miscellaneous opcodes](../miscopcodes.md)

## Credits

Author: Rory Walsh<br>
2016<br>
