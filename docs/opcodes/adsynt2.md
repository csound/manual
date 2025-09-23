<!--
id:adsynt2
category:Signal Generators:Additive Synthesis/Resynthesis
-->
# adsynt2
Performs additive synthesis with an arbitrary number of partials, not necessarily harmonic. (see [adsynt](../opcodes/adsynt.md) for detailed manual)

## Syntax
=== "Modern"
    ``` csound-orc
    ar = adsynt2(kamp, kcps, iwfn, ifreqfn, iampfn, icnt [, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ar adsynt2 kamp, kcps, iwfn, ifreqfn, iampfn, icnt [, iphs]
    ```

### Initialization

_iwfn_ -- table containing a waveform, usually a sine. Table values are not interpolated for performance reasons, so larger tables provide better quality.

_ifreqfn_ -- table containing frequency values for each partial. _ifreqfn_ may contain beginning frequency values for each partial, but is usually used for generating parameters at runtime with _tablew_. Frequencies must be relative to _kcps_. Size must be at least _icnt_.

_iampfn_ -- table containing amplitude values for each partial. _iampfn_ may contain beginning amplitude values for each partial, but is usually used for generating parameters at runtime with _tablew_. Amplitudes must be relative to _kamp_. Size must be at least _icnt_.

_icnt_ -- number of partials to be generated

_iphs_ -- initial phase of each oscillator, if _iphs_ = -1, initialization is skipped. If _iphs_ &gt; 1, all phases will be initialized with a random value.

### Performance

_kamp_ -- amplitude of note

_kcps_ -- base frequency of note. Partial frequencies will be relative to _kcps_.

Frequency and amplitude of each partial is given in the two tables provided. The purpose of this opcode is to have an instrument generate synthesis parameters at k-rate and write them to global parameter tables with the _tablew_ opcode.

_adsynt2_ is identical to _adsynt_ (by Peter Neubäcker), except it provides linear interpolation for amplitude envelopes of each partial. It is a bit slower than _adsynt_, but interpolation higly improves sound quality in fast amplitude envelope transients when _kr_ &lt; _sr_ (i.e. when _ksmps_ &gt; 1). No interpolation is provided for pitch envelopes, since in this case sound quality degradation is not so evident even with high values of _ksmps_. It is not recommended when _kr_ = _sr_, in this case _adsynt_ is better (since it is faster).

## Examples

Here is an example of the adsynt2 opcode. These two instruments perform additive synthesis. The output of each sounds like a Tibetan bowl. The first one is static, as parameters are only generated at init-time. In the second one, parameters are continuously changed.

=== "Modern"
    Uses the file [adsynt2-modern.csd](../examples/adsynt2-modern.csd).
    ``` csound-orc title="Example of the adsynt2 opcode." linenums="1"
    --8<-- "examples/adsynt2-modern.csd"
    ```

=== "Classic"
    Uses the file [adsynt2.csd](../examples/adsynt2.csd).
    ``` csound-orc title="Example of the adsynt2 opcode." linenums="1"
    --8<-- "examples/adsynt2.csd"
    ```

## See also

[Additive Synthesis/Resynthesis](../siggen/additive.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
