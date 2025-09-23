<!--
id:readk4
category:Signal I/O:File I/O
-->
# readk4
Periodically reads four orchestra control-signal values from an external file.

## Syntax
=== "Modern"
    ``` csound-orc
    kr1, kr2, kr3, kr4 = readk4(ifilname, iformat, iprd)
    ```

=== "Classic"
    ``` csound-orc
    kr1, kr2, kr3, kr4 readk4 ifilname, iformat, iprd
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

_iprd_ -- the rate (period) in seconds, rounded to the nearest orchestra control period, at which the signals are read from the input file.  A value of 0 implies one control period (the enforced minimum), which will read new values at the orchestra control rate. Longer periods will cause the same values to repeat for more than one control period.

### Performance

_kr1, kr2, kr3, kr4_ -- output of the signals read from _ifilname_.

This opcode allows four generated control signal values to be read from a named external file. The file should contain no header information but it should contain a regularly sampled time series of control values. For binary formats, the individual samples of each signal are interleaved. For ASCII text formats, the values are assumed to be separated by at least one whitespace character.  The four "channels" in a sample frame may be on the same line or separated by newline characters, it does not matter. There may be any number of _readk4_ opcodes in an instrument or orchestra and they may read from the same or different files.

## Examples

Here is an example of the readk4 opcode. It uses the file [readk4.csd](../examples/readk4.csd).

``` csound-csd title="Example of the readk4 opcode." linenums="1"
--8<-- "examples/readk4.csd"
```

The output should include lines like these:

```
WRITING:
kcf = 1122.469723, kq = 11.762839, kdb = -14.313445, kpan = 0.538142
kcf = 1122.469723, kq = 11.762839, kdb = -14.313445, kpan = 0.538142
kcf = 1148.638412, kq = 12.040490, kdb = -14.061868, kpan = 0.552205
kcf = 165.796855, kq = 18.523179, kdb = -15.816977, kpan = 0.901528
kcf = 147.729960, kq = 13.071911, kdb = -11.924531, kpan = 0.982518
kcf = 497.430113, kq = 13.605512, kdb = -21.586611, kpan = 0.179229

READING:
WARNING: Seeding from current time 3308160476

kcf = 1122.469700, kq = 11.762800, kdb = -14.313400, kpan = 0.538100
kcf = 1122.469700, kq = 11.762800, kdb = -14.313400, kpan = 0.538100
kcf = 1148.638400, kq = 12.040500, kdb = -14.061900, kpan = 0.552200
kcf = 165.796900, kq = 18.523200, kdb = -15.817000, kpan = 0.901500
kcf = 147.730000, kq = 13.071900, kdb = -11.924500, kpan = 0.982500
kcf = 497.430100, kq = 13.605500, kdb = -21.586600, kpan = 0.179200
```

## See also

[File Input and Output](../sigio/fileio.md)

## Credits

By: John ffitch and Barry L. Vercoe

1999 or earlier
