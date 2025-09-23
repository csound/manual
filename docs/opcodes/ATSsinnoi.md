<!--
id:ATSsinnoi
category:Spectral Processing:ATS
-->
# ATSsinnoi
_ATSsinnoi_ reads data from an ATS data file and uses the information to synthesize sines and noise together.

## Syntax
=== "Modern"
    ``` csound-orc
    ar = ATSsinnoi(ktimepnt, ksinlev, knzlev, kfmod, iatsfile, ipartials \
                   [, ipartialoffset, ipartialincr])
    ```

=== "Classic"
    ``` csound-orc
    ar ATSsinnoi ktimepnt, ksinlev, knzlev, kfmod, iatsfile, ipartials \
                 [, ipartialoffset, ipartialincr]
    ```

### Initialization

_iatsfile_ – the ATS number (n in ats.n) or the name in quotes of the analysis file made using [ATSA](../utility/atsa.md).

_ipartials_ – number of partials that will be used in the resynthesis (the noise has a maximum of 25 bands)

_ipartialoffset_ (optional) – is the first partial used (defaults to 0).

_ipartialincr_ (optional) – sets an increment by which these synthesis opcodes counts up from _ipartialoffset_ for ibins components in the re-synthesis (defaults to 1).

### Performance

_ktimepnt_ – The time pointer in seconds used to index the ATS file. Used for _ATSsinnoi_ exactly the same as for [pvoc](../opcodes/pvoc.md).

_ksinlev_ - controls the level of the sines in the _ATSsinnoi_ ugen. A value of 1 gives full volume sinewaves.

_knzlev_ - controls the level of the noise components in the _ATSsinnoi_ ugen. A value of 1 gives full volume noise.

_kfmod_ – an input for performing pitch transposition or frequency modulation on all of the synthesized partials, if no fm or pitch change is desired then use a 1 for this value.

_ATSsinnoi_ reads data from an ATS data file and uses the information to synthesize sines and noise together. The noise energy for each band is distributed equally among each partial that falls in that band. Each partial is then synthesized, along with that partial's noise component. Each noise component is then modulated by the corresponding partial to be put in the correct place in the frequency spectrum. The level of the noise and the partials are individually controllable. An ATS analysis differs from a pvanal in that ATS tracks the partials and computes the noise energy of the sound being analyzed. For more info about ATS analysis read Juan Pampin's description on the the [ATS](https://ccrma.stanford.edu/~juan/ATS_manual.html) web-page.

## Examples

``` csound-orc
  ktime   line       0, p3, 2.5
  asig    ATSsinnoi  ktime, 1, 1, 1, "beats.ats", 42
```

Here we synthesize both the noise and the sinewaves (all 42 partials) contained in "beats.ats" together. The relative volumes of the noise and the partials are unaltered (each set to 1).

=== "Modern"
    Here is a complete example of the ATSsinnoi opcode. It uses the file [ATSsinnoi-modern.csd](../examples/ATSsinnoi-modern.csd).
    ``` csound-csd title="Example of the ATSsinnoi opcode." linenums="1"
    --8<-- "examples/ATSsinnoi-modern.csd"
    ```

=== "Classic"
    Here is a complete example of the ATSsinnoi opcode. It uses the file [ATSsinnoi.csd](../examples/ATSsinnoi.csd).
    ``` csound-csd title="Example of the ATSsinnoi opcode." linenums="1"
    --8<-- "examples/ATSsinnoi.csd"
    ```

=== "Modern"
    Here is another complete example of the ATSsinnoi opcode. It uses the file [ATSsinnoi-2-modern.csd](../examples/ATSsinnoi-2-modern.csd).
    ``` csound-csd title="Example 2 of the ATSsinnoi opcode." linenums="1"
    --8<-- "examples/ATSsinnoi-2-modern.csd"
    ```

=== "Classic"
    Here is another complete example of the ATSsinnoi opcode. It uses the file [ATSsinnoi-2.csd](../examples/ATSsinnoi-2.csd).
    ``` csound-csd title="Example 2 of the ATSsinnoi opcode." linenums="1"
    --8<-- "examples/ATSsinnoi-2.csd"
    ```

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
