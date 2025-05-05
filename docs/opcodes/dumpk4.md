<!--
id:dumpk4
category:Signal I/O:File I/O
-->
# dumpk4
Periodically writes four orchestra control-signal values to a named external file in a specific format.

## Syntax
=== "Modern"
    ``` csound-orc
    dumpk4(ksig1, ksig2, ksig3, ksig4, ifilname, iformat, iprd)
    ```

=== "Classic"
    ``` csound-orc
    dumpk4 ksig1, ksig2, ksig3, ksig4, ifilname, iformat, iprd
    ```

### Initialization

_ifilname_ -- character string (in double quotes, spaces permitted) denoting the external file name. May either be a full path name with target directory specified or a simple filename to be created within the current directory

_iformat_ -- specifies the output data format:

*  1 = 8-bit signed char (high order 8 bits of a 16-bit integer)
*  4 = 16-bit short integers
*  5 = 32-bit long integers
*  6 = 32-bit floats
*  7 = ASCII long integers
*  8 = ASCII floats (2 decimal places)

Note that A-law and U-law output are not available, and that all formats except the last two are binary. The output file contains no header information.

_iprd_ -- the period of _ksig_ output in seconds, rounded to the nearest orchestra control period. A value of 0 implies one control period (the enforced minimum), which will create an output file sampled at the orchestra control rate.

### Performance

_ksig1, ksig2, ksig3, ksig4_ -- control-rate signals

This opcode allows four generated control signal values to be saved in a named external file. The file contains no self-defining header information. But it contains a regularly sampled time series, suitable for later input or analysis. There may be any number of _dumpk4_ opcodes in an instrument or orchestra but each must write to a different file.

## Examples

Here is an example of the dumpk4 opcode. It uses the file [dumpk4.csd](../examples/dumpk4.csd). Note that the example must be run from a directory for which the
user has write access.

``` csound-csd title="Example of the dumpk4 opcode." linenums="1"
--8<-- "examples/dumpk4.csd"
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
