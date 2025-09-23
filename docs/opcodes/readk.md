<!--
id:readk
category:Signal I/O:File I/O
-->
# readk
Periodically reads an orchestra control-signal value from a named external file in a specific format.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = readk(ifilname, iformat, iprd)
    ```

=== "Classic"
    ``` csound-orc
    kres readk ifilname, iformat, iprd
    ```

### Initialization

_ifilname_ -- an integer N denoting a file named "readk.N" or a character string (in double quotes, spaces permitted) denoting the external file name. For a string, it may either be a full path name with directory specified or a simple filename.  In the later case, the file is sought first in the current directory, then in SSDIR, and finally in SFDIR.

_iformat_ -- specifies the input data format:

*  1 = 8-bit signed integers (char)
*  4 = 16-bit short integers
*  5 = 32-bit long integers
*  6 = 32-bit floats
*  7 = ASCII long integers (plain text)
*  8 = ASCII floats (plain text)

Note that A-law and U-law formats are not available, and that all formats except the last two are binary. The input file should be a "raw", headerless data file.

_iprd_ -- the rate (period) in seconds, rounded to the nearest orchestra control period, at which the signal is read from the input file.  A value of 0 implies one control period (the enforced minimum), which will read new values at the orchestra control rate.  Longer periods will cause the same values to repeat for more than one control period.

### Performance

_kres_ -- output of the signal read from _ifilname_.

This opcode allows a generated control signal value to be read from a named external file. The file should contain no header information but it should contain a regularly sampled time series of control values. For ASCII text formats, the values are assumed to be separated by at least one whitespace character. There may be any number of _readk_ opcodes in an instrument or orchestra and they may read from the same or different files.

## Examples

Here is an example of the readk opcode. It uses the file [readk.csd](../examples/readk.csd).

``` csound-csd title="Example of the readk opcode." linenums="1"
--8<-- "examples/readk.csd"
```

Here is another example of the readk opcode. It uses the file [readk-2.csd](../examples/readk-2.csd).

``` csound-csd title="Example 2 of the readk opcode." linenums="1"
--8<-- "examples/readk-2.csd"
```

Its output should include lines like this:

```
WARNING: Seeding from current time 683384022

i   1 time     1.00033:   463.64510
i   1 time     2.00000:   463.64510
i   1 time     3.00000:   483.14200
i   1 time     4.00000:   567.55973
i   1 time     5.00000:   576.37060
i   1 time     6.00000:   460.66550

i   2 time     6.00033:   463.64510
i   2 time     7.00000:   463.64510
i   2 time     8.00000:   483.14200
i   2 time     9.00000:   567.55970
i   2 time    10.00000:   576.37060
i   2 time    11.00000:   460.66550
```

## See also

[File Input and Output](../sigio/fileio.md)

## Credits

By: John ffitch and Barry L. Vercoe

1999 or earlier
