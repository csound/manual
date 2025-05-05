<!--
id:squinewave
category:Signal Generators:Dynamic Spectrum Oscillators
-->
# squinewave
A mostly bandlimited shape-shifting square-pulse-saw-sinewave oscillator with hardsync.

This oscillator generates a variable shape waveform that can morph freely between classical shapes sine, square, pulse and saw.
The shape is controlled by two interacting values: clip (squareness) and "skew" (symmetry).
All shapes use a minimum number of samples per transition (ie, the sharp end of a saw or a pulse uses minimum N samples), this makes output bandlimited.
At higher frequency, the minimum sweep rate takes over, so over a certain pitch all shapes "degrade" to sinewave. The minimum sweep rate is i-time configurable.
Hardsync (a very quick sweep to phase=0) is supported, and a sync signal is output once per cycle.

## Syntax
=== "Modern"
    ``` csound-orc
    aout [, asyncout] = squinewave(acps, aClip, aSkew, asyncin [, iMinSweep] [, iphase])
    aout [, asyncout] = squinewave(acps, aClip, aSkew [, ksyncin] [, iMinSweep] [, iphase])
    ```

=== "Classic"
    ``` csound-orc
    aout [, asyncout] squinewave acps, aClip, aSkew, asyncin [, iMinSweep] [, iphase]
    aout [, asyncout] squinewave acps, aClip, aSkew [, ksyncin] [, iMinSweep] [, iphase]
    ```

### Initialization

_iMinSweep_ (optional) -- Range 4 and up. Sample count of the shortest square/pulse edges.  Default: sr/3000 (mostly alias-free).

_iphase_ (optional, default=-1) -- initial phase, range 0-2, proportional to the segments of the waveform (see notes). If negative value is given, skip setting phase

### Performance

_aout_ -- audio output, normalized +/-1

_asyncout_ -- (optional) - Sync signal: 1 at endpoint of each cycle, else 0.

_acps_ -- frequency. Range 0-anything; negative freq not implemented.

_aClip_ -- "squareness" of waveform shape. Range 0-1. Clip 0 is sinewave (or saw), clip 1 is squarewave (or pulse).

_aSkew_ -- symmetry of waveform shape. Range -1 to +1. Skew = 0 is symmetric like sine or square. Skew +1 or -1 is right/left-facing saw or pulse.

_asyncin_/_ksyncin_ -- (optional, ignored if not a-rate) - when &gt;= 1, waveform quickly sweeps to phase 0. Sweep length is 0 to about 1.5*iMinSweep samples depending on current phase.

The _squinewave_ opcode is a variable shape oscillator with internally generated waveform.
The waveform has two parts:

1. cosine sweep down, followed by flat part at -1
2. cosine sweep up, followed by flat part at +1

At the end of (2), sync signal is output.

Clip (0-1) controls the proportion of flatness to sweep length in each segment.<br>
Skew (-1 to +1) controls the proportions of segments (1) and (2) in the waveform cycle.

If skew &lt; 0, part (1) is shorter, if skew &gt; 0, (1) is longer than (2)

Classic waveforms have simple values:

* sine: clip=0, skew=0
* saw(like): clip=0, skew=+1 or -1 (left- or right-facing)
* square: clip=1, skew=0
* pulse: clip=1, skew=+1 or -1

Fractional values generate intermediate waveforms.

_asyncin_

Hardsync input (asyncin &gt;= 1) makes the waveform quickly sweep to end by raising frequency to 2 * sr/iMinSweep.
Sync pulses are thus sharper than the pulse waveform.

_iMinSweep_

The waveform is bandlimited by always using a minimum number of samples for cosine sweeps, even when clip/skew are at extreme values. This is controlled by _iMinSweep_.
Since _iMinSweep_ is counted in samples, the waveform output is dependent on samplerate, but the spectrum will be very similiar independent of sr.
Default sr/3000 is fairly "soft", the actual values are 14 samples at 44.1K, 16 at 48K, 32 at 96K etc. _iMinSweep_ is counted in integers, although not strictly necessary.

If several units of _squinewave_ are run in unison, it is recommend to use different _iMinSweep_ values.
The min sweep value creates "dips" or quieter areas in the overtone series.
By using slightly different min sweep settings, spectrum is filled, rather than emphasizing the spectral profile.

### Notes

_squinewave_ is based on cosine instead of sine to generate the waveform. (This simplifies the controlling logic.)
The difference is that cosine cos(0) = 1, whereas sin(0) = 0.
This means that hardsync occurs when waveform is at peak, just about to enter its down sweep. (Sinewave hardsync would occur at a zero-crossing)

_Tip_

The length of hardsync sweeps allows chain syncing several _squinewave_ units, creating staggered hardsync pulses.

_Pitch stability_

Note that _iMinSweep_ and shape limits the ability of squinewave to match frequency exactly.
When skew or clip is active, and FM is applied, the _squinewave_ waveform will be longer or shorter than the exact period.
The differences even out however, so with symmetric FM, _squinewave_ drifts back to match average frequency.
Sinewave unshaped signal (clip=skew=0) matches poscil output to 7-8 significant digits (also under FM).

_Initial phase_

Setting initial phase is useful if squinewave is used as a shaped LFO.
Init phase is split into 4 segments with symbolic values range 0-2, so it will start at the expected place regardless of skew/clip values.
0-1 represents the first part, 1-2 the second. Some interesting _iphase_ segment values are:

* 0 - start of 1st sweep down.
* 0.5 - end of down sweep (start of "low" flat section).
* 1 - midpoint, end of 1st flat section, start 2nd, "up" sweep
* 1.5 - end of up sweep, (start of "high" flat section)
* 0.25 and 1.25 are 0-crossings at middle of down/up sweep sections.
* 0.75 and 1.75 are middle of low/high flat sections.

If _iphase_ &lt; 0 (skip) at first use, initial phase is set to 1.25, ie 0-crossing of the "up" sweep. This makes output look like a sinewave.

## Examples

Here is an example of the _squinewave_ opcode. It uses the file [squinewave.csd](../examples/squinewave.csd).

``` csound-orc title="Example of the squinewave opcode." linenums="1"
--8<-- "examples/squinewave.csd"
```

## See Also

[Dynamic Spectrum Oscillators](../siggen/dynamic.md)

## Credits

Author: Rasmus Ekman<br>
November 2017<br>

New in version 6.10
