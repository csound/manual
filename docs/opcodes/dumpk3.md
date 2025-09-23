<!--
id:dumpk3
category:Signal I/O:File I/O
-->
# dumpk3
Periodically writes three orchestra control-signal values to a named external file in a specific format.

## Syntax
=== "Modern"
    ``` csound-orc
    dumpk3(ksig1, ksig2, ksig3, ifilname, iformat, iprd)
    ```

=== "Classic"
    ``` csound-orc
    dumpk3 ksig1, ksig2, ksig3, ifilname, iformat, iprd
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

_ksig1, ksig2, ksig3_ -- control-rate signals

This opcode allows three generated control signal values to be saved in a named external file. The file contains no self-defining header information. But it contains a regularly sampled time series, suitable for later input or analysis. There may be any number of _dumpk3_ opcodes in an instrument or orchestra but each must write to a different file.

## Examples

Here is an example of the dumpk3 opcode. It uses the file [dumpk3.csd](../examples/dumpk3.csd). Note that the example must be run from a directory for which the
user has write access.

``` csound-csd title="Example of the dumpk3 opcode." linenums="1"
--8<-- "examples/dumpk3.csd"
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
