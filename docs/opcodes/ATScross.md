<!--
id:ATScross
category:Spectral Processing:ats
-->
# atscross
_atscross_ uses data from an ATS analysis file and data from an [atsbufread](../opcodes/ATSbufread.md) to perform cross synthesis.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *ATScross*.

## Syntax
=== "Modern"
    ``` csound-orc
    ar = atscross(ktimepnt, kfmod, iatsfile, ifn, kmylev, kbuflev, ipartials \
                  [, ipartialoffset, ipartialincr])
    ```

=== "Classic"
    ``` csound-orc
    ar ATScross ktimepnt, kfmod, iatsfile, ifn, kmylev, kbuflev, ipartials \
                [, ipartialoffset, ipartialincr]
    ```

### Initialization

_iatsfile_ – integer or character-string denoting a control-file derived from ATS analysis of an audio signal. An integer denotes the suffix of a file ATS.m; a character-string (in double quotes) gives a filename, optionally a full pathname. If not full-path, the file is sought first in the current directory, then in the one given by the environment variable SADIR (if defined).

_ifn_ – table number of a stored function containing a sine wave.

_ipartials_ – number of partials that will be used in the resynthesis

_ipartialoffset_ (optional) – is the first partial used (defaults to 0).

_ipartialincr_ (optional) – sets an increment by which these synthesis opcodes counts up from _ipartialoffset_ for ibins components in the re-synthesis (defaults to 1).

### Performance

_ktimepnt_ – The time pointer in seconds used to index the ATS file. Used for _atscross_ exactly the same as for [pvoc](../opcodes/pvoc.md).

_kfmod_ – an input for performing pitch transposition or frequency modulation on all of the synthesized partials, if no fm or pitch change is desired then use a 1 for this value.

_kmylev_ - scales the _atscross_ component of the frequency spectrum applied to the partials from the ATS file indicated by the _atscross_ opcode. The frequency spectrum information comes from the _atscross_ ATS file. A value of 1 (and 0 for _kbuflev_) gives the same results as [atsadd](../opcodes/ATSadd.md).

_kbuflev_ - scales the [atsbufread](../opcodes/ATSbufread.md) component of the frequency spectrum applied to the partials from the ATS file indicated by the _atscross_ opcode. The frequency spectrum information comes from the [atsbufread](../opcodes/ATSbufread.md) ATS file. A value of 1 (and 0 for _kmylev_) results in partials that have frequency information from the ATS file given by the _atscross_, but amplitudes imposed by data from the ATS file given by [atsbufread](../opcodes/ATSbufread.md).

_atscross_ uses data from an ATS analysis file (indicated by _iatsfile_) and data from an [atsbufread](../opcodes/ATSbufread.md) to perform cross synthesis. _atscross_ uses _ktimepnt_, _kfmod_, _ipartials_, _ipartialoffset_ and _ipartialincr_ just like  [atsadd](../opcodes/ATSadd.md). _atscross_ synthesizes a sine-wave for each partial selected by the user and uses the frequency of that partial (after scaling in frequency by _kfmod_) to index the table created by [atsbufread](../opcodes/ATSbufread.md). Interpolation is used to get in-between values. _atscross_ uses the sum of the amplitude data from its ATS file (scaled by _kmylev_) and the amplitude data gained from an [atsbufread](../opcodes/ATSbufread.md) (scaled by _kbuflev_) to scale the amplitude of each partial it synthesizes. Setting _kmylev_ to one and _kbuflev_ to zero will make _atscross_ act exactly like [atsadd](../opcodes/ATSadd.md). Setting _kmylev_ to zero and _kbuflev_ to one will produce a sound that has all the partials selected by the _atscross_ ugen, but with amplitudes taken from an [atsbufread](../opcodes/ATSbufread.md). The time pointers of the [atsbufread](../opcodes/ATSbufread.md) and _atscross_ do not need to be the same.

## Examples

=== "Modern"
    Here is an example of the atscross opcode. It uses the file [atscross-modern.csd](../examples/atscross-modern.csd).
    ``` csound-csd title="Example of the atscross opcode." linenums="1"
    --8<-- "examples/atscross-modern.csd"
    ```

=== "Classic"
    Here is an example of the ATScross opcode. It uses the file [ATScross.csd](../examples/ATScross.csd).
    ``` csound-csd title="Example of the ATScross opcode." linenums="1"
    --8<-- "examples/ATScross.csd"
    ```

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
