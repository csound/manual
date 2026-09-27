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

_ifna_ -- Table number for amplitude data. Use 0 to leave the signal's amplitudes unchanged.

_ifnf_ (optional) -- Table number for frequency data, or phase data when _fsrc_ uses amplitude/phase format. The default is 0, which leaves these values unchanged.

Each enabled table needs room for _N_/2 + 1 values, where _N_ is the signal's FFT size. These include the DC and Nyquist bins. The table's guard point can hold the last value.

### Performance

_fsrc_ -- A non-sliding spectral signal in amplitude/frequency or amplitude/phase format. `pvsftr` modifies this signal in place. Reinitialize `pvsftr` if the signal's FFT size or format changes.

`pvsftr` reads the enabled tables at initialization and whenever a new frame is available in _fsrc_. Editing a table does not cause another read of the same frame. To change only frequency data, set _ifna_ to zero.

When used with [pvsftw](pvsftw.md), edit the tables when that opcode's _kflag_ is 1, then call `pvsftr` to read the edited values back into the signal.

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
