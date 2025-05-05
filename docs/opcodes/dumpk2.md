<!--
id:dumpk2
category:Signal I/O:File I/O
-->
# dumpk2
Periodically writes two orchestra control-signal values to a named external file in a specific format.

## Syntax
=== "Modern"
    ``` csound-orc
    dumpk2(ksig1, ksig2, ifilname, iformat, iprd)
    ```

=== "Classic"
    ``` csound-orc
    dumpk2 ksig1, ksig2, ifilname, iformat, iprd
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

_ksig1, ksig2_ -- control-rate signals.

This opcode allows two generated control signal values to be saved in a named external file. The file contains no self-defining header information. But it contains a regularly sampled time series, suitable for later input or analysis. There may be any number of _dumpk2_ opcodes in an instrument or orchestra but each must write to a different file.

## Examples

Here is an example of the dumpk2 opcode. It uses the file [dumpk2.csd](../examples/dumpk2.csd). Note that the example must be run from a directory for which the
user has write access.

``` csound-csd title="Example of the dumpk2 opcode." linenums="1"
--8<-- "examples/dumpk2.csd"
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
