<!--
id:ATSbufread
category:Spectral Processing:ATS
-->
# atsbufread
Reads an ATS data file and stores frequency and amplitude pairs in an internal table.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *ATSbufread*.

## Syntax
=== "Modern"
    ``` csound-orc
    atsbufread(ktimepnt, kfmod, iatsfile, ipartials [, ipartialoffset, \
               ipartialincr])
    ```

=== "Classic"
    ``` csound-orc
    ATSbufread ktimepnt, kfmod, iatsfile, ipartials [, ipartialoffset, \
               ipartialincr]
    ```

### Initialization

_iatsfile_ – the ATS number (n in ats.n) or the name in quotes of the analysis file made using [ATSA](../utility/atsa.md).

_ipartials_ – number of partials that will be used in the resynthesis (the noise has a maximum of 25 bands)

_ipartialoffset_ (optional) – is the first partial used (defaults to 0).

_ipartialincr_ (optional) – sets an increment by which these synthesis opcodes counts up from _ipartialoffset_ for ibins components in the re-synthesis (defaults to 1).

### Performance

_ktimepnt_ – The time pointer in seconds used to index the ATS file. Used for _atsbufread_ exactly the same as for [pvoc](../opcodes/pvoc.md).

_kfmod_ – an input for performing pitch transposition or frequency modulation on all of the synthesized partials, if no fm or pitch change is desired then use a 1 for this value.

_atsbufread_ is based on [pvbufread](pvbufread.md) by Richard Karpen. It stores data for [atscross](ATScross.md), [atsinterpread](ATSinterpread.md) and [atspartialtap](ATSpartialtap.md), without producing an output signal itself. The time pointer _ktimepnt_ selects a position in the file. The arguments _ipartials_, _ipartialoffset_ and _ipartialincr_ select the partials to store, and _kfmod_ scales their frequencies.

### Reader scope and order

In Csound 7, each instrument instance has its own current _atsbufread_. Each UDO and subinstrument instance also has its own reader. A reader inside a UDO or subinstrument does not replace its parent's reader, and a consumer inside it cannot use the parent's reader. Separate notes cannot share a reader through this implicit connection, even when they use the same instrument number.

Put _atsbufread_ and its consumers in the same instance, with the reader before the consumers. If several readers run there, each consumer uses the last reader that ran in that instance. During performance, this follows execution order, so a consumer can use a different reader on a later control cycle.

_atspartialtap_ and _atsinterpread_ need a local reader when they initialize. _atscross_ can initialize before its reader, but the reader must have filled its buffer before _atscross_ runs during performance. Keeping the reader first handles both cases.

Older versions used one current reader across Csound. To update an orchestra that relied on a reader in another note, UDO or subinstrument, add an _atsbufread_ in the instance that consumes the data. These scope rules also apply to the uppercase aliases and to both filename and numeric file arguments.

## Examples

=== "Modern"
    Here is an example of the atsbufread opcode. It uses the file [atsbufread-modern.csd](../examples/atsbufread-modern.csd).

    ``` csound-csd title="Example of the atsbufread opcode." linenums="1"
    --8<-- "examples/atsbufread-modern.csd"
    ```

=== "Classic"
    Here is an example of the ATSbufread opcode. It uses the file [ATSbufread.csd](../examples/ATSbufread.csd).

    ``` csound-csd title="Example of the ATSbufread opcode." linenums="1"
    --8<-- "examples/ATSbufread.csd"
    ```

See also the examples for [atscross](../opcodes/ATScross.md), [atsinterpread](../opcodes/ATSinterpread.md) and [atspartialtap](../opcodes/ATSpartialtap.md)

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
