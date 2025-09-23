<!--
id:dumpk
category:Signal I/O:File I/O
-->
# dumpk
Periodically writes an orchestra control-signal value to a named external file in a specific format.

## Syntax
=== "Modern"
    ``` csound-orc
    dumpk(ksig, ifilname, iformat, iprd)
    ```

=== "Classic"
    ``` csound-orc
    dumpk ksig, ifilname, iformat, iprd
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

_ksig_ -- a control-rate signal

This opcode allows a generated control signal value to be saved in a named external file. The file contains no self-defining header information. But it contains a regularly sampled time series, suitable for later input or analysis. There may be any number of _dumpk_ opcodes in an instrument or orchestra but each must write to a different file.

## Examples

Here is an example of the dumpk opcode. It uses the file [dumpk.csd](../examples/dumpk.csd). Note that the example must be run from a directory for which the
user has write access.

``` csound-csd title="Example of the dumpk opcode." linenums="1"
--8<-- "examples/dumpk.csd"
```

Here is another example of the dumpk opcode. It uses the file [dumpk-2.csd](../examples/dumpk-2.csd).

``` csound-csd title="Example 2 of the dumpk opcode." linenums="1"
--8<-- "examples/dumpk-2.csd"
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
