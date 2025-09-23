<!--
id:ATSread
category:Spectral Processing:ATS
-->
# ATSread
Reads data from an ATS file.

_ATSread_ returns the amplitude (_kamp_) and frequency (_kfreq_) information of a user specified partial contained in the ATS analysis file at the time indicated by the time pointer _ktimepnt_.

## Syntax
=== "Modern"
    ``` csound-orc
    kfreq, kamp = ATSread(ktimepnt, iatsfile, ipartial)
    ```

=== "Classic"
    ``` csound-orc
    kfreq, kamp ATSread ktimepnt, iatsfile, ipartial
    ```

### Initialization

_iatsfile_ – the ATS number (n in ats.n) or the name in quotes of the analysis file made using [ATSA](../utility/atsa.md).

_ipartial_ – the number of the analysis partial to return the frequency in Hz and amplitude.

### Performance

_kfreq, kamp_ - outputs of the _ATSread_ unit. These values represent the frequency and amplitude of a specific partial selected by the user using _ipartial_. The partials' informations are derived from an ATS analysis. _ATSread_ linearly interpolates the frequency and amplitude between frames in the ATS analysis file at k-rate. The output is dependent on the data in the analysis file and the pointer _ktimepnt_.

_ktimepnt_ – The time pointer in seconds used to index the ATS file. Used for _ATSread_ exactly the same as for [pvoc](../opcodes/pvoc.md) and [ATSadd](../opcodes/ATSadd.md).

## Examples

=== "Modern"
    Here is an example of the ATSread opcode. It uses the file [ATSread-modern.csd](../examples/ATSread-modern.csd).
    ``` csound-csd title="Example of the ATSread opcode." linenums="1"
    --8<-- "examples/ATSread-modern.csd"
    ```

=== "Classic"
    Here is an example of the ATSread opcode. It uses the file [ATSread.csd](../examples/ATSread.csd).
    ``` csound-csd title="Example of the ATSread opcode." linenums="1"
    --8<-- "examples/ATSread.csd"
    ```

Here we are using _ATSread_ to get the 10th partial's frequency and amplitude data out of the 'beats.ats' ATS analysis file. We are using that data to drive an oscillator, but we could use it for anything else that can take a k-rate input, like the bandwidth and resonance of a filter etc.

=== "Modern"
    Here is a musical example of the ATSread opcode. It uses the file [ATSread-musical-modern.csd](../examples/ATSread-musical-modern.csd).
    ``` csound-csd title="Musical example of the ATSread opcode." linenums="1"
    --8<-- "examples/ATSread-musical-modern.csd"
    ```

=== "Classic"
    Here is a musical example of the ATSread opcode. It uses the file [ATSread-musical.csd](../examples/ATSread-musical.csd).
    ``` csound-csd title="Musical example of the ATSread opcode." linenums="1"
    --8<-- "examples/ATSread-musical.csd"
    ```

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
