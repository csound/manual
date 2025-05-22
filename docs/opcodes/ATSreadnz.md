<!--
id:ATSreadnz
category:Spectral Processing:ATS
-->
# ATSreadnz
reads data from an ATS file.

_ATSreadnz_ returns the energy (_kenergy_) of a user specified noise band (1-25 bands) at the time indicated by the time pointer _ktimepnt_.

## Syntax
=== "Modern"
    ``` csound-orc
    kenergy = ATSreadnz(ktimepnt, iatsfile, iband)
    ```

=== "Classic"
    ``` csound-orc
    kenergy ATSreadnz ktimepnt, iatsfile, iband
    ```

### Initialization

_iatsfile_ – the ATS number (n in ats.n) or the name in quotes of the analysis file made using [ATSA](../utility/atsa.md).

_iband_ – the number of the noise band to return the energy data.

### Performance

_kenergy_ outputs the linearly interpolated energy of the noise band indicated in _iband_. The output is dependent on the data in the analysis file and the _ktimepnt_.

_ktimepnt_ – The time pointer in seconds used to index the ATS file. Used for _ATSreadnz_ exactly the same as for [pvoc](../opcodes/pvoc.md) and [ATSadd](../opcodes/ATSadd.md).

_ATSaddnz_ reads from an ATS file and resynthesizes the noise from noise energy data contained in the ATS file. It uses a modified randi function to create band limited noise and modulates that with a user supplied wave table (one period of a cosine wave), to synthesize a user specified selection of frequency bands. Modulating the noise is required to put the band limited noise in the correct place in the frequency spectrum.

An ATS analysis differs from a pvanal in that ATS tracks the partials and computes the noise energy of the sound being analyzed. For more info about ATS analysis read Juan Pampin's description on the the [ATS](https://ccrma.stanford.edu/~juan/ATS_manual.html) web-page.

## Examples

``` csound-orc
  ktime   line      2.5, p3, 0
  kenergy	ATSreadnz ktime, "clarinet.ats", 5
```

Here we are extracting the noise energy from band 5 in the 'clarinet.ats' ATS analysis file. We are actually reading backwards from 2.5 seconds to the beginning of the analysis file. We could use this to synthesize noise like this:

``` csound-orc
  anoise  randi     sqrt(kenergy), 55
  aout    oscili    4000000000000000000000000, 455, 2
  aout    =         aout * anoise
```

Function table 2 used in the oscillator is a cosine, which is needed to shift the band limited noise into the correct place in the frequency spectrum. The _randi_ function creates a band of noise centered about 0 Hz that has a bandwidth of about 110 Hz; multiplying it by a cosine will shift it to be centered at 455 Hz, which is the center frequency of the 5th critical noise band. This is only an example, for synthesizing the noise you would be better off just using [ATSaddnz](../opcodes/ATSaddnz.md) unless you want to use your own noise synthesis algorithm. Maybe you could use the noise energy for something else like applying a small amount of jitter to specific partials or for controlling something totally unrelated to the source sound?

=== "Modern"
    Here is a complete example of the ATSreadnz opcode. It uses the file [ATSreadnz-modern.csd](../examples/ATSreadnz-modern.csd).
    ``` csound-csd title="Example of the ATSreadnz opcode." linenums="1"
    --8<-- "examples/ATSreadnz-modern.csd"
    ```

=== "Classic"
    Here is a complete example of the ATSreadnz opcode. It uses the file [ATSreadnz.csd](../examples/ATSreadnz.csd).
    ``` csound-csd title="Example of the ATSreadnz opcode." linenums="1"
    --8<-- "examples/ATSreadnz.csd"
    ```

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
