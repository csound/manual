<!--
id:readfi
category:Signal I/O:File I/O
-->
# readfi
Read a line of text from an external file once on initialisation.

Plugin opcode in cs_date.

## Syntax
=== "Modern"
    ``` csound-orc
    Sres, iline = readfi(ifilname)
    ```

=== "Classic"
    ``` csound-orc
    Sres, iline readfi ifilname
    ```

### Initialization

_ifilname_ -- an integer N denoting a file named "input.N" or a character string (in double quotes, spaces permitted) denoting the external file name. For a string, it may either be a full path name with directory specified or a simple filename.  In the later case, the file is sought first in the current directory, then in SSDIR, and finally in SFDIR.

_iline_ -- line number, or -1 when end of file has been reached.

_Sres_ -- output of the line read from _ifilname_.

This opcode allows a line of text to be read from a named external file.  There may be any number of _readfi_ opcodes in an instrument or orchestra but they read separately from the same or different files.

## Examples

Here is an example of the readfi opcode. It uses the file [readfi.csd](../examples/readfi.csd).

``` csound-csd title="Example of the readfi opcode." linenums="1"
--8<-- "examples/readfi.csd"
```

## See also

[File Input and Output](../sigio/fileio.md)

## Credits

John ffitch and Joachim Heintz

2012; new in 5.17.12
