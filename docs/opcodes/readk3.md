<!--
id:readk3
category:Signal I/O:File I/O
-->
# readk3
Periodically reads three orchestra control-signal values from an external file.

## Syntax
=== "Modern"
    ``` csound-orc
    kr1, kr2, kr3 = readk3(ifilname, iformat, iprd)
    ```

=== "Classic"
    ``` csound-orc
    kr1, kr2, kr3 readk3 ifilname, iformat, iprd
    ```

### Initialization

_ifilname_ -- an integer N denoting a file named "readk.N" or a character string (in double quotes, spaces permitted) denoting the external file name. For a string, it may either be a full path name with directory specified or a simple filename.  In the later case, the file is sought first in the current directory, then in [SSDIR](../invoke/environment-variables.md), and finally in [SFDIR](../invoke/environment-variables.md).

_iformat_ -- specifies the input data format:

*  1 = 8-bit signed integers (char)
*  4 = 16-bit short integers
*  5 = 32-bit long integers
*  6 = 32-bit floats
*  7 = ASCII long integers (plain text)
*  8 = ASCII floats (plain text)

Note that A-law and U-law formats are not available, and that all formats except the last two are binary. The input file should be a "raw", headerless data file.

_iprd_ -- the rate (period) in seconds, rounded to the nearest orchestra control period, at which the signals are read from the input file.  A value of 0 implies one control period (the enforced minimum), which will read new values at the orchestra control rate.  Longer periods will cause the same values to repeat for more than one control period.

### Performance

_kr1, kr2, kr3_ -- output of the signals read from _ifilname_.

This opcode allows three generated control signal values to be read from a named external file. The file should contain no header information but it should contain a regularly sampled time series of control values. For binary formats, the individual samples of each signal are interleaved. For ASCII text formats, the values are assumed to be separated by at least one whitespace character.  The three "channels" in a sample frame may be on the same line or separated by newline characters, it does not matter. There may be any number of _readk3_ opcodes in an instrument or orchestra and they may read from the same or different files.

## Examples

Here is an example of the readk3 opcode. It uses the file [readk3.csd](../examples/readk3.csd).

``` csound-csd title="Example of the readk3 opcode." linenums="1"
--8<-- "examples/readk3.csd"
```

The output should include lines like these:

```
WRITING:
kfreq = 473.352855, kdb = -15.197657, kpan = 0.366764
kfreq = 473.352855, kdb = -15.197657, kpan = 0.366764
kfreq = 441.426368, kdb = -19.026206, kpan = 0.207327
kfreq = 452.965140, kdb = -21.447486, kpan = 0.553270
kfreq = 585.106328, kdb = -11.903852, kpan = 0.815665
kfreq = 482.056760, kdb = -4.046744, kpan = 0.876537

READING:
kfreq = 473.352900, kdb = -15.197700, kpan = 0.366800
kfreq = 473.352900, kdb = -15.197700, kpan = 0.366800
kfreq = 441.426400, kdb = -19.026200, kpan = 0.207300
kfreq = 452.965100, kdb = -21.447500, kpan = 0.553300
kfreq = 585.106300, kdb = -11.903900, kpan = 0.815700
kfreq = 482.056800, kdb = -4.046700, kpan = 0.876500
```

## See also

[File Input and Output](../sigio/fileio.md)

## Credits

By: John ffitch and Barry L. Vercoe

1999 or earlier
