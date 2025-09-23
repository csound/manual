<!--
id:readf
category:Signal I/O:File I/O
-->
# readf
Read a line of text from an external file once each k-cycle.

Plugin opcode in cs_date.

## Syntax
=== "Modern"
    ``` csound-orc
    Sres, kline = readf(ifilname)
    ```

=== "Classic"
    ``` csound-orc
    Sres, kline readf ifilname
    ```

### Initialization

_ifilname_ -- an integer N denoting a file named "input.N" or a character string (in double quotes, spaces permitted) denoting the external file name. For a string, it may either be a full path name with directory specified or a simple filename.  In the later case, the file is sought first in the current directory, then in SSDIR, and finally in SFDIR.

### Performance

_Sres_ -- output of the line read from _ifilname_.

_kline_ -- line number, or -1 when end of file has been reached.

This opcode allows a line of text to be read from a named external file.  There may be any number of _readf_ opcodes in an instrument or orchestra but they read separately from the same or different files.

## Examples

Here is an example of the readf opcode. It uses the file [readf.csd](../examples/readf.csd).

``` csound-csd title="Example of the readf opcode." linenums="1"
--8<-- "examples/readf.csd"
```

## See also

[File Input and Output](../sigio/fileio.md)

## Credits

John ffitch and Joachim Heintz

2012; new in 5.17.12
