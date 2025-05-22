<!--
id:ATSbufread
category:Spectral Processing:ATS
-->
# ATSbufread
Reads data from and ATS data file and stores it in an internal data table of frequency, amplitude pairs.

## Syntax
=== "Modern"
    ``` csound-orc
    ATSbufread(ktimepnt, kfmod, iatsfile, ipartials [, ipartialoffset, \
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

_ktimepnt_ – The time pointer in seconds used to index the ATS file. Used for _ATSbufread_ exactly the same as for [pvoc](../opcodes/pvoc.md).

_kfmod_ – an input for performing pitch transposition or frequency modulation on all of the synthesized partials, if no fm or pitch change is desired then use a 1 for this value.

_ATSbufread_ is based on pvbufread by Richard Karpen. [ATScross](../opcodes/ATScross.md), [ATSinterpread](../opcodes/ATSinterpread.md) and [ATSpartialtap](../opcodes/ATSpartialtap.md) are all dependent on _ATSbufread_ just as [pvcross](../opcodes/pvcross.md) and [pvinterp](../opcodes/pvinterp.md) are on [pvbufread](../opcodes/pvbufread.md). _ATSbufread_ reads data from and ATS data file and stores it in an internal data table of frequency, amplitude pairs. The data stored by an _ATSbufread_ can only be accessed by other unit generators, and therefore, due to the architecture of Csound, an _ATSbufread_  must come before (but not necessarily directly) any dependent unit generator. Besides the fact that _ATSbufread_ does not output any data directly, it works almost exactly as [ATSadd](../opcodes/ATSadd.md). The ugen uses a time pointer (_ktimepnt_) to index the data in time, _ipartials_, _ipartialoffset_ and _ipartialincr_ to select which partials to store in the table and _kfmod_ to scale partials in frequency.

## Examples

=== "Modern"
    Here is an example of the ATSbufread opcode. It uses the file [ATSbufread-modern.csd](../examples/ATSbufread-modern.csd).
    ``` csound-csd title="Example of the ATSbufread opcode." linenums="1"
    --8<-- "examples/ATSbufread-modern.csd"
    ```

=== "Classic"
    Here is an example of the ATSbufread opcode. It uses the file [ATSbufread.csd](../examples/ATSbufread.csd).
    ``` csound-csd title="Example of the ATSbufread opcode." linenums="1"
    --8<-- "examples/ATSbufread.csd"
    ```

See also the examples for [ATScross](../opcodes/ATScross.md), [ATSinterpread](../opcodes/ATSinterpread.md) and [ATSpartialtap](../opcodes/ATSpartialtap.md)

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
