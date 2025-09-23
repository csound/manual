<!--
id:adsyn
category:Signal Generators:Additive Synthesis/Resynthesis
-->
# adsyn
Output is an additive set of individually controlled sinusoids, using an oscillator bank.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = adsyn(kamod, kfmod, ksmod, ifilcod)
    ```

=== "Classic"
    ``` csound-orc
    ares adsyn kamod, kfmod, ksmod, ifilcod
    ```

### Initialization

_ifilcod_ --  integer or character-string denoting a control-file derived from analysis of an audio signal. An integer denotes the suffix of a file _adsyn.m_ or _pvoc.m_; a character-string (in double quotes) gives a filename, optionally a full pathname. If not fullpath, the file is sought first in the current directory, then in the one given by the environment variable [SADIR](../invoke/environment-variables.md) (if defined). _adsyn_ control contains breakpoint amplitude- and frequency-envelope values organized for oscillator resynthesis, while _pvoc_ control contains similar data organized for fft resynthesis. Memory usage depends on the size of the files involved, which are read and held entirely in memory during computation but are shared by multiple calls (see also [lpread](../opcodes/lpread.md)).

### Performance

_kamod_ -- amplitude factor of the contributing partials.

_kfmod_ -- frequency factor of the contributing partials. It is a control-rate transposition factor: a value of 1 incurs no transposition, 1.5 transposes up a perfect fifth, and .5 down an octave.

_ksmod_ -- speed factor of the contributing partials.

_adsyn_ synthesizes complex time-varying timbres through the method of additive synthesis. Any number of sinusoids, each individually controlled in frequency and amplitude, can be summed by high-speed arithmetic to produce a high-fidelity result.

Component sinusoids are described by a control file describing amplitude and frequency tracks in millisecond breakpoint fashion. Tracks are defined by sequences of 16-bit binary integers:

```
-1, time, amp, time, amp,...
-2, time, freq, time, freq,...
```
such as from hetrodyne filter analysis of an audio file. (For details see [hetro](../utility/hetro.md).) The instantaneous amplitude and frequency values are used by an internal fixed-point oscillator that adds each active partial into an accumulated output signal. While there is a practical limit (limit removed in version 3.47) on the number of contributing partials, there is no restriction on their behavior over time. Any sound that can be described in terms of the behavior of sinusoids can be synthesized by _adsyn_ alone.

Sound described by an _adsyn_ control file can also be modified during re-synthesis. The signals _kamod,_ _kfmod_, _ksmod_ will modify the amplitude, frequency, and speed of contributing partials. These are multiplying factors, with _kfmod_ modifying the frequency and _ksmod_ modifying the _speed_ with which the millisecond breakpoint line-segments are traversed. Thus .7, 1.5, and 2 will give rise to a softer sound, a perfect fifth higher, but only half as long. The values 1,1,1 will leave the sound unmodified. Each of these inputs can be a control signal.

## Examples

=== "Modern"
    Here is an example of the adsyn opcode. It uses the file [adsyn-modern.csd](../examples/adsyn-modern.csd).
    ``` csound-orc title="Example of the adsyn opcode." linenums="1"
    --8<-- "examples/adsyn-modern.csd"
    ```

=== "Classic"
    Here is an example of the adsyn opcode. It uses the file [adsyn.csd](../examples/adsyn.csd).
    ``` csound-orc title="Example of the adsyn opcode." linenums="1"
    --8<-- "examples/adsyn.csd"
    ```

## See also

[Additive Synthesis/Resynthesis](../siggen/additive.md)
