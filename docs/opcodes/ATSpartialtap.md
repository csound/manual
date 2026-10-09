<!--
id:ATSpartialtap
category:Spectral Processing:ATS
-->
# atspartialtap
Returns a frequency, amplitude pair from an [atsbufread](../opcodes/ATSbufread.md) opcode.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *ATSpartialtap*.

## Syntax
=== "Modern"
    ``` csound-orc
    kfrq, kamp = atspartialtap(ipartialnum)
    ```

=== "Classic"
    ``` csound-orc
    kfrq, kamp ATSpartialtap ipartialnum
    ```

### Initialization

_ipartialnum_ - selects a partial from the current [atsbufread](ATSbufread.md) buffer, starting at 1. It must not exceed that reader's _ipartials_. This is a position within the selected buffer, not the original file's partial number.

An _atsbufread_ must initialize first in the same instrument, UDO or subinstrument instance. See [reader scope and order](ATSbufread.md#reader-scope-and-order).

### Performance

_kfrq_ - returns the frequency value for the requested partial.

_kamp_ - returns the amplitude value for the requested partial.

During performance, _atspartialtap_ uses the last _atsbufread_ that ran in its instance. If that reader has fewer partials than _ipartialnum_, the opcode reports a performance error. A reader in another instance cannot supply the data.

_atspartialtap_ takes a partial number and returns a frequency, amplitude pair. The frequency and amplitude data comes from an [atsbufread](../opcodes/ATSbufread.md) opcode. This is more restricted version of [atsread](../opcodes/ATSread.md), since each [atsread](../opcodes/ATSread.md) opcode has its own independent time pointer, and _atspartialtap_ is restricted to the data given by an [atsbufread](../opcodes/ATSbufread.md). Its simplicity is its attractive feature.

## Examples

=== "Modern"
    Here is an example of the atspartialtap opcode. It uses the file [atspartialtap-modern.csd](../examples/atspartialtap-modern.csd).

    ``` csound-csd title="Example of the atspartialtap opcode." linenums="1"
    --8<-- "examples/atspartialtap-modern.csd"
    ```

=== "Classic"
    Here is an example of the ATSpartialtap opcode. It uses the file [ATSpartialtap.csd](../examples/ATSpartialtap.csd).

    ``` csound-csd title="Example of the ATSpartialtap opcode." linenums="1"
    --8<-- "examples/ATSpartialtap.csd"
    ```

This example here uses an _atspartialtap_, and an [atsbufread](../opcodes/ATSbufread.md) to read partials 5, 20 and 30 from 'beats.ats'. These amplitudes and frequencies could be used to re-synthesize those partials, or something all together different.

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
