<!--
id:ATSinterpread
category:Spectral Processing:ATS
-->
# ATSinterpread
Allows a user to determine the frequency envelope of any [ATSbufread](../opcodes/ATSbufread.md).

## Syntax
=== "Modern"
    ``` csound-orc
    kamp = ATSinterpread(kfreq)
    ```

=== "Classic"
    ``` csound-orc
    kamp ATSinterpread kfreq
    ```

### Performance

_kfreq_ - a frequency value (given in Hertz) used by _ATSinterpread_ as in index into the table produced by an [ATSbufread](../opcodes/ATSbufread.md).

_ATSinterpread_ takes a frequency value (_kfreq_ in Hz). This frequency is used to index the data of an [ATSbufread](../opcodes/ATSbufread.md). The return value is an amplitude gained from the [ATSbufread](../opcodes/ATSbufread.md)  after interpolation. _ATSinterpread_ allows a user to determine the frequency envelope of any [ATSbufread](../opcodes/ATSbufread.md). This data could be useful for an number of reasons, one might be performing cross synthesis of data from an ATS file and non ATS data.

## Examples

=== "Modern"
    Here is an example of the ATSinterpread opcode. It uses the file [ATSinterpread-modern.csd](../examples/ATSinterpread-modern.csd).
    ``` csound-csd title="Example of the ATSinterpread opcode." linenums="1"
    --8<-- "examples/ATSinterpread-modern.csd"
    ```

=== "Classic"
    Here is an example of the ATSinterpread opcode. It uses the file [ATSinterpread.csd](../examples/ATSinterpread.csd).
    ``` csound-csd title="Example of the ATSinterpread opcode." linenums="1"
    --8<-- "examples/ATSinterpread.csd"
    ```

This example shows how to use _ATSinterpread_. Here a frequency is given by the score (p5) and this frequency is given to an _ATSinterpread_ (with a corresponding [ATSbufread](../opcodes/ATSbufread.md)). The _ATSinterpread_ uses this frequency to output a corresponding amplitude value, based on the atsfile given by the [ATSbufread](../opcodes/ATSbufread.md) (beats.ats in this case). We then use that amplitude to scale a sine-wave that is synthesized with the same frequency (p5). You could extend this to include multiple sine-waves. This way you could synthesize any reasonable frequency (within the low and high frequencies of the indicated ATS file), and maintain the shape (in frequency) of the indicated atsfile (given by the [ATSbufread](../opcodes/ATSbufread.md)).

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
