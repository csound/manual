<!--
id:ATSadd
category:Spectral Processing:ATS
-->
# ATSadd
Uses the data from an ATS analysis file to perform additive synthesis using an internal array of interpolating oscillators.

## Syntax
=== "Modern"
    ``` csound-orc
    ar = ATSadd(ktimepnt, kfmod, iatsfile, ifn, ipartials [, ipartialoffset, \
                ipartialincr, igatefn])
    ```

=== "Classic"
    ``` csound-orc
    ar ATSadd ktimepnt, kfmod, iatsfile, ifn, ipartials [, ipartialoffset, \
              ipartialincr, igatefn]
    ```

### Initialization

_iatsfile_ – the ATS number (n in ats.n) or the name in quotes of the analysis file made using [ATSA](../utility/atsa.md).

_ifn_ – table number of a stored function containing a sine wave for _ATSadd_ and a cosine for [ATSaddnz](../opcodes/ATSaddnz.md) (see examples below for more info)

_ipartials_ – number of partials that will be used in the resynthesis (the noise has a maximum of 25 bands)

_ipartialoffset_ (optional) – is the first partial used (defaults to 0).

_ipartialincr_ (optional) – sets an increment by which these synthesis opcodes counts up from _ipartialoffset_ for ibins components in the re-synthesis (defaults to 1).

_igatefn_ (optional) – is the number of a stored function which will be applied to the amplitudes of the analysis bins before resynthesis takes place. If _igatefn_ is greater than 0 the amplitudes of each bin will be scaled by _igatefn_ through a simple mapping process. First, the amplitudes of all of the bins in all of the frames in the entire analysis file are compared to determine the maximum amplitude value. This value is then used to create normalized amplitudes as indices into the stored function _igatefn_. The maximum amplitude will map to the last point in the function. An amplitude of 0 will map to the first point in the function. Values between 0 and 1 will map accordingly to points along the function table. See the examples below.

### Performance

_ktimepnt_ – The time pointer in seconds used to index the ATS file. Used for _ATSadd_ exactly the same as for [pvoc](../opcodes/pvoc.md).

_ATSadd_ and [ATSaddnz](../opcodes/ATSaddnz.md) are based on [pvadd](../opcodes/pvadd.md) by Richard Karpen and use files created by Juan Pampin's ATS ([Analysis - Transformation - Synthesis](https://ccrma.stanford.edu/~juan/ATS_manual.html)).

_kfmod_ – A control-rate transposition factor: a value of 1 incurs no transposition, 1.5 transposes up a perfect fifth, and .5 down an octave. Used for _ATSadd_ exactly the same as for [pvoc](../opcodes/pvoc.md).

_ATSadd_ reads from an ATS analysis file and uses the data to perform additive synthesis using an internal array of interpolating oscillators. The user supplies the wave table (usually one period of a sine wave), and can choose which analysis partials will be used in the re-synthesis.

## Examples

``` csound-orc
  ktime line   0, p3, 2.5
  asig  ATSadd ktime, 1, "clarinet.ats", 1, 20, 2
```

In the example above, _ipartials_ is 20 and _ipartialoffset_ is 2. This will synthesize the 3rd thru 22nd partials in the "clarinet.ats" analysis file. _kfmod_ is 1 so there will be no pitch transformation. Since the _ktimepnt_ envelope moves from 0 to 2.5 over the duration of the note, the analysis file will be read from 0 to 2.5 seconds of the original duration of the analysis over the duration of the csound note, this way we can change the duration independent of the pitch.

=== "Modern"
    Here is a complete example of the ATSadd opcode. It uses the file [ATSadd-modern.csd](../examples/ATSadd-modern.csd).
    ``` csound-csd title="Example of the ATSadd opcode." linenums="1"
    --8<-- "examples/ATSadd-modern.csd"
    ```

=== "Classic"
    Here is a complete example of the ATSadd opcode. It uses the file [ATSadd.csd](../examples/ATSadd.csd).
    ``` csound-csd title="Example of the ATSadd opcode." linenums="1"
    --8<-- "examples/ATSadd.csd"
    ```

=== "Modern"
    Here is another example of the ATSadd opcode. It uses the file [ATSadd-2-modern.csd](../examples/ATSadd-2-modern.csd).
    ``` csound-csd title="Example 2 of the ATSadd opcode." linenums="1"
    --8<-- "examples/ATSadd-2-modern.csd"
    ```

=== "Classic"
    Here is another example of the ATSadd opcode. It uses the file [ATSadd-2.csd](../examples/ATSadd-2.csd).
    ``` csound-csd title="Example 2 of the ATSadd opcode." linenums="1"
    --8<-- "examples/ATSadd-2.csd"
    ```

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
