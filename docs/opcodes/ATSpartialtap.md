<!--
id:ATSpartialtap
category:Spectral Processing:ATS
-->
# ATSpartialtap
Returns a frequency, amplitude pair from an [ATSbufread](../opcodes/ATSbufread.md) opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    kfrq, kamp = ATSpartialtap(ipartialnum)
    ```

=== "Classic"
    ``` csound-orc
    kfrq, kamp ATSpartialtap ipartialnum
    ```

### Initialization

_ipartialnum_ - indicates the partial that the _ATSpartialtap_ opcode should read from an [ATSbufread](../opcodes/ATSbufread.md).

### Performance

_kfrq_ - returns the frequency value for the requested partial.

_kamp_ - returns the amplitude value for the requested partial.

_ATSpartialtap_ takes a partial number and returns a frequency, amplitude pair. The frequency and amplitude data comes from an [ATSbufread](../opcodes/ATSbufread.md) opcode. This is more restricted version of [ATSread](../opcodes/ATSread.md), since each [ATSread](../opcodes/ATSread.md) opcode has its own independent time pointer, and _ATSpartialtap_ is restricted to the data given by an [ATSbufread](../opcodes/ATSbufread.md). Its simplicity is its attractive feature.

## Examples

=== "Modern"
    Here is an example of the ATSpartialtap opcode. It uses the file [ATSpartialtap-modern.csd](../examples/ATSpartialtap-modern.csd).
    ``` csound-csd title="Example of the ATSpartialtap opcode." linenums="1"
    --8<-- "examples/ATSpartialtap-modern.csd"
    ```

=== "Classic"
    Here is an example of the ATSpartialtap opcode. It uses the file [ATSpartialtap.csd](../examples/ATSpartialtap.csd).
    ``` csound-csd title="Example of the ATSpartialtap opcode." linenums="1"
    --8<-- "examples/ATSpartialtap.csd"
    ```

This example here uses an _ATSpartialtap_, and an [ATSbufread](../opcodes/ATSbufread.md) to read partials 5, 20 and 30 from 'beats.ats'. These amplitudes and frequencies could be used to re-synthesize those partials, or something all together different.

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
