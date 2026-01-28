<!--
id:ATSbufread
category:Spectral Processing:ATS
-->
# atsbufread
Reads data from and ATS data file and stores it in an internal data table of frequency, amplitude pairs.

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

_atsbufread_ is based on pvbufread by Richard Karpen. [atscross](../opcodes/ATScross.md), [atsinterpread](../opcodes/ATSinterpread.md) and [atspartialtap](../opcodes/ATSpartialtap.md) are all dependent on _atsbufread_ just as [pvcross](../opcodes/pvcross.md) and [pvinterp](../opcodes/pvinterp.md) are on [pvbufread](../opcodes/pvbufread.md). _atsbufread_ reads data from and ATS data file and stores it in an internal data table of frequency, amplitude pairs. The data stored by an _atsbufread_ can only be accessed by other unit generators, and therefore, due to the architecture of Csound, an _atsbufread_  must come before (but not necessarily directly) any dependent unit generator. Besides the fact that _atsbufread_ does not output any data directly, it works almost exactly as [atsadd](../opcodes/ATSadd.md). The ugen uses a time pointer (_ktimepnt_) to index the data in time, _ipartials_, _ipartialoffset_ and _ipartialincr_ to select which partials to store in the table and _kfmod_ to scale partials in frequency.

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
