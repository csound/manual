<!--
id:ATSinterpread
category:Spectral Processing:ATS
-->
# atsinterpread
Allows a user to determine the frequency envelope of any [atsbufread](../opcodes/ATSbufread.md).

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *ATSinterpread*.

## Syntax
=== "Modern"
    ``` csound-orc
    kamp = atsinterpread(kfreq)
    ```

=== "Classic"
    ``` csound-orc
    kamp ATSinterpread kfreq
    ```

### Performance

_kfreq_ - a frequency value (given in Hertz) used by _atsinterpread_ as in index into the table produced by an [atsbufread](../opcodes/ATSbufread.md).

_atsinterpread_ takes a frequency value (_kfreq_ in Hz). This frequency is used to index the data of an [atsbufread](../opcodes/ATSbufread.md). The return value is an amplitude gained from the [atsbufread](../opcodes/ATSbufread.md)  after interpolation. _atsinterpread_ allows a user to determine the frequency envelope of any [atsbufread](../opcodes/ATSbufread.md). This data could be useful for an number of reasons, one might be performing cross synthesis of data from an ATS file and non ATS data.

## Examples

=== "Modern"
    Here is an example of the atsinterpread opcode. It uses the file [atsinterpread-modern.csd](../examples/atsinterpread-modern.csd).
    ``` csound-csd title="Example of the atsinterpread opcode." linenums="1"
    --8<-- "examples/atsinterpread-modern.csd"
    ```

=== "Classic"
    Here is an example of the ATSinterpread opcode. It uses the file [ATSinterpread.csd](../examples/ATSinterpread.csd).
    ``` csound-csd title="Example of the ATSinterpread opcode." linenums="1"
    --8<-- "examples/ATSinterpread.csd"
    ```

This example shows how to use _atsinterpread_. Here a frequency is given by the score (p5) and this frequency is given to an _atsinterpread_ (with a corresponding [atsbufread](../opcodes/ATSbufread.md)). The _atsinterpread_ uses this frequency to output a corresponding amplitude value, based on the atsfile given by the [atsbufread](../opcodes/ATSbufread.md) (beats.ats in this case). We then use that amplitude to scale a sine-wave that is synthesized with the same frequency (p5). You could extend this to include multiple sine-waves. This way you could synthesize any reasonable frequency (within the low and high frequencies of the indicated ATS file), and maintain the shape (in frequency) of the indicated atsfile (given by the [atsbufread](../opcodes/ATSbufread.md)).

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
