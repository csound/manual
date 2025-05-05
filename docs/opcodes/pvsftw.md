<!--
id:pvsftw
category:Spectral Processing:Streaming
-->
# pvsftw
Writes amplitude and/or frequency data to function tables.

## Syntax
=== "Modern"
    ``` csound-orc
    kflag = pvsftw(fsrc, ifna [, ifnf])
    ```

=== "Classic"
    ``` csound-orc
    kflag pvsftw fsrc, ifna [, ifnf]
    ```

### Initialization

_ifna_ -- A table, at least inbins in size, that stores amplitude data. Ignored if ifna  = 0

_ifnf_ -- A table, at least inbins in size, that stores frequency data. Ignored if ifnf = 0

### Performance

_kflag_ -- A flag that has the value of 1 when new data is available, 0 otherwise.

_fsrc_ -- a PVOC-EX formatted source.

Enables the contents of _fsrc_ to be exchanged with function tables, for custom processing. Except when the frame overlap equals _ksmps_ (which will generally not be the case), the frame data is not updated each control period. The data in _ifna_, _ifnf_ should only be processed when _kflag_ is set to 1. To process only frequency data, set _ifna_ to zero.

As the functions tables are required only to store data from _fsrc_, there is no advantage in defining then in the score. They should generally be created in the instrument using [ftgen](../opcodes/ftgen.md).

By exporting amplitude data, say, from one fsig and importing it into another, basic cross-synthesis (as in [pvscross](../opcodes/pvscross.md)) can be performed, with the option to modify the data beforehand using the table manipulation opodes.

Note that the format data in the source fsig is not written to the tables. This therefore offers a means of transferring amplitude and frequency data between non-identical fsigs. Used this way, these opcodes become potentially pathological, and can be relied upon to produce unexpected  results. In such cases, resynthesis using [pvsadsyn](../opcodes/pvsadsyn.md) would almost certainly be required.

To perform a straight copy from one fsig to another one of identical format, the conventional assignment syntax can be used:

```
fsig1 = fsig2
```

It is not necessary to use function tables in this case.

## Examples

Here is an example of the pvsftw opcode. It uses the file [pvsftw.csd](../examples/pvsftw.csd).

``` csound-csd title="Example of the pvsftw opcode." linenums="1"
--8<-- "examples/pvsftw.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

New in version 4.13
