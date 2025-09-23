<!--
id:readk2
category:Signal I/O:File I/O
-->
# readk2
Periodically reads two orchestra control-signal values from an external file.

## Syntax
=== "Modern"
    ``` csound-orc
    kr1, kr2 = readk2(ifilname, iformat, iprd)
    ```

=== "Classic"
    ``` csound-orc
    kr1, kr2 readk2 ifilname, iformat, iprd
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

_kr1, kr2_ -- output of the signals read from _ifilname_.

This opcode allows two generated control signal values to be read from a named external file. The file should contain no header information but it should contain a regularly sampled time series of control values. For binary formats, the individual samples of each signal are interleaved. For ASCII text formats, the values are assumed to be separated by at least one whitespace character.  The two "channels" in a sample frame may be on the same line or separated by newline characters, it does not matter. There may be any number of _readk2_ opcodes in an instrument or orchestra and they may read from the same or different files.

## Examples

Here is an example of the readk2 opcode. It uses the file [readk2.csd](../examples/readk2.csd).

``` csound-csd title="Example of the readk2 opcode." linenums="1"
--8<-- "examples/readk2.csd"
```

The output should include lines like these:

```
kfreq = 429.202551, kdb = -20.495694
kfreq = 429.202551, kdb = -20.495694
kfreq = 407.275258, kdb = -23.123776
kfreq = 475.264472, kdb = -9.300846
kfreq = 569.979181, kdb = -7.315527
kfreq = 440.103457, kdb = -0.058331

kfreq = 429.202600, kdb = -20.495700
kfreq = 429.202600, kdb = -20.495700
kfreq = 407.275300, kdb = -23.123800
kfreq = 475.264500, kdb = -9.300800
kfreq = 569.979200, kdb = -7.315500
kfreq = 440.103500, kdb = -0.058300
```

## See also

[File Input and Output](../sigio/fileio.md)

## Credits

By: John ffitch and Barry L. Vercoe

1999 or earlier
