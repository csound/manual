<!--
id:ATSaddnz
category:Spectral Processing:ATS
-->
# ATSaddnz
Uses the data from an ATS analysis file to perform noise resynthesis using a modified randi function.

## Syntax
``` csound-orc
ar ATSaddnz ktimepnt, iatsfile, ibands [, ibandoffset, ibandincr]
```

### Initialization

_iatsfile_ – the ATS number (n in ats.n) or the name in quotes of the analysis file made using [ATSA](../../utility/atsa).

_ibands_ – number of noise bands that will be used in the resynthesis (the noise has a maximum of 25 bands)

_ibandoffset_ (optional) – is the first noise band used (defaults to 0).

_ibandincr_ (optional) – sets an increment by which these synthesis opcodes counts up from _ibandoffset_ for ibins components in the re-synthesis (defaults to 1).

### Performance

_ktimepnt_ – The time pointer in seconds used to index the ATS file. Used for _ATSaddnz_ exactly the same as for [pvoc](../../opcodes/pvoc) and [ATSadd](../../opcodes/ATSadd).

_ATSaddnz_ and [ATSadd](../../opcodes/ATSadd) are based on [pvadd](../../opcodes/pvadd) by Richard Karpen and use files created by Juan Pampin's ATS ([Analysis - Transformation - Synthesis](https://ccrma.stanford.edu/~juan/ATS_manual.html)).

_ATSaddnz_ also reads from an ATS file but it resynthesizes the noise from noise energy data contained in the ATS file. It uses a modified randi function to create band limited noise and modulates that with a cosine wave, to synthesize a user specified selection of frequency bands. Modulating the noise is required to put the band limited noise in the correct place in the frequency spectrum.

## Examples

``` csound-orc
  ktime line     0, p3, 2.5
  asig  ATSaddnz ktime, "clarinet.ats", 25
```

In the example above we are synthesizing all 25 noise bands from the data contained in the ATS analysis file called "clarinet.ats".

Here is a complete example of the ATSaddnz opcode. It uses the file [ATSaddnz.csd](../../examples/ATSaddnz.csd).

``` csound-csd title="Example of the ATSaddnz opcode." linenums="1"
--8<-- "examples/ATSaddnz.csd"
```

Here is another example of the ATSaddnz opcode. It uses the file [ATSaddnz-2.csd](../../examples/ATSaddnz-2.csd).

``` csound-csd title="Example 2 of the ATSaddnz opcode." linenums="1"
--8<-- "examples/ATSaddnz-2.csd"
```

## See also

[ATS Spectral Processing](../../spectral/ATS)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
