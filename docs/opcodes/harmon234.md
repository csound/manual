<!--
id:harmon2
category:Signal Modifiers:Special Effects
-->
# harmon2
Analyze an audio input and generate harmonizing voices in synchrony with formants preserved.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = harmon2(asig, koct, kfrq1, kfrq2, icpsmode, ilowest[, ipolarity])
    ares = harmon3(asig, koct, kfrq1, kfrq2, kfrq3, icpsmode, ilowest[, ipolarity])
    ares = harmon4(asig, koct, kfrq1, kfrq2, kfrq3, kfrq4, icpsmode, ilowest \
                   [, ipolarity])
    ```

=== "Classic"
    ``` csound-orc
    ares harmon2 asig, koct, kfrq1, kfrq2, icpsmode, ilowest[, ipolarity]
    ares harmon3 asig, koct, kfrq1, kfrq2, kfrq3, icpsmode, ilowest[, ipolarity]
    ares harmon4 asig, koct, kfrq1, kfrq2, kfrq3, kfrq4, icpsmode, ilowest \
                 [, ipolarity]
    ```

### Initialization

_icpsmode_ -- interpreting mode for the generating frequency inputs _kfrq1_, _kfrq2_, _kfrq3_ and _kfrq4_: 0: input values are ratios w.r.t. the cps equivalent of _koct_.1: input values are the actual requested frequencies in cps.

_ilowest_ -- lowest value of the _koct_ input for which harmonizing voices will be generated.

_ipolarity_ -- polarity of _asig_ input, 1 = positive glottal pulses, 0 = negative. Default is 1.

### Performance

_Harmon2_, _harmon3_ and _harmon4_ are high-performance harmonizers, able to provide up to four pitch-shifted copies of the input _asig_ with spectral formants preserved. The pitch-shifting algorithm requires an accurate running estimate (_koct_, in decimal oct units) of the pitched content of _asig_, normally gained from an independent pitch tracker such as _specptrk_. The algorithm then isolates the most recent full pulse within _asig_, and uses this to generate the other voices at their required pulse rates.

If the frequency (or ratio) presented to _kfrq1_, _kfrq2_, _kfrq3_ or _kfrq4_ is zero, then no signal is generated for that voice.  If any of them is non-zero, but the _koct_ input is below the value _ilowest_, then that voice will output a direct copy of the input _asig._  As a consequence, the data arriving at the k-rate inputs can variously cause the generated voices to be turned on or off, to pass a direct copy of a non-voiced fricative source, or to harmonize the source according to some constructed algorithm. The transition from one mode to another is cross-faded, giving seemless alternating between voiced (harmonized) and non-voiced fricatives during spoken or sung input.

_harmon2_, _harmon3_, _harmon4_ are especially matched to the output of _specptrk_.  The latter generates pitch data in decimal octave format; it also emits its base value if no pitch is identified (as in fricative noise) and emits zero if the energy falls below a threshold, so that _harmon2_, _harmon3_, _harmon4_ can be set to pass the direct signal in both cases.  Of course, any other form of pitch estimation could also be used.  Since pitch trackers usually incur a slight delay for accurate estimation (for _specptrk_ the delay is printed by the _spectrum_ unit), it is normal to delay the audio signal by the same amount so that _harmon2_, _harmon3_, _harmon4_ can work from a fully concurrent estimate.

## Examples

Here is an example of the harmon2 opcode. It uses the file [harmon.csd](../examples/harmon.csd).

``` csound-orc title="Example of the harmon2 opcode." linenums="1"
a1,a2      ins                                     ; get mic input
w1         spectrum  a1, .02, 7, 24, 12, 1, 3      ; and examine it
koct,kamp  specptrk  w1, 1, 6.5, 9.5, 7.5, 10, 7, .7, 0, 3, 1
a3         delay     a1, .065                      ; allow for ptrk delay
a4         harmon2   a3, koct, 1.25, 0.75, 0, 6.9  ; output a fixed 6-4 harmony
           outs      a3, a4                        ; as well as the original
```

Here is a complete example of the harmon3 opcode. It uses the file [harmon3.csd](../examples/harmon3.csd).

``` csound-csd title="Example of the harmon3 opcode." linenums="1"
--8<-- "examples/harmon3.csd"
```

## See also

[Special Effects](../sigmod/speciale.md)

## Credits

Author: Barry L. Vercoe<br>
M.I.T., Cambridge, Mass<br>
2006<br>

New in version 5.04
