<!--
id:pvsftr
category:Spectral Processing:Streaming
-->
# pvsftr
Reads amplitude and/or frequency data from function tables.

## Syntax
=== "Modern"
    ``` csound-orc
    pvsftr(fsrc, ifna [, ifnf])
    ```

=== "Classic"
    ``` csound-orc
    pvsftr fsrc, ifna [, ifnf]
    ```

### Initialization

_ifna_ -- A table, at least inbins in size, that stores amplitude data. Ignored if ifna  = 0

_ifnf_ (optional) -- A table, at least inbins in size, that stores frequency data. Ignored if ifnf = 0

### Performance

_fsrc_ -- a PVOC-EX formatted source.

Enables the contents of _fsrc_ to be exchanged with function tables for custom processing. Except when the frame overlap equals _ksmps_ (which will generally not be the case), the frame data is not updated each control period. The data in _ifna_, _ifnf_ should only be processed when _kflag_ is set to 1. To process only frequency data, set _ifna_ to zero.

As the function tables are required only to store data from _fsrc_, there is no advantage in defining then in the score, and they should generally be created in the instrument, using [ftgen](../opcodes/ftgen.md).

By exporting amplitude data, say, from one fsig and importing it into another, basic cross-synthesis (as in [pvscross](../opcodes/pvscross.md)) can be performed, with the option to modify the data beforehand using the table manipulation opodes.

Note that the format data in the source fsig is not written to the tables. This therefore offers a means of transferring amplitude and frequency data between non-identical fsigs. Used this way, these opcodes become potentially pathological, and can be relied upon to produce unexpected  results. In such cases, resynthesis using [pvsadsyn](../opcodes/pvsadsyn.md) would almost certainly be required.

To perform a straight copy from one fsig to another one of identical format, the conventional assignment syntax can be used:

```
fsig1 = fsig2
```

It is not necessary to use function tables in this case.

## Examples

Here is an example of the pvsftr opcode. It uses the file [pvsftr.csd](../examples/pvsftr.csd).

``` csound-csd title="Example of the pvsftr opcode." linenums="1"
--8<-- "examples/pvsftr.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

New in version 4.13
