<!--
id:foscil
category:Signal Generators:FM Synthesis
-->
# foscil
A basic frequency modulated oscillator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = foscil(xamp, kcps, xcar, xmod, kndx [, ifn , iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares foscil xamp, kcps, xcar, xmod, kndx [, ifn , iphs]
    ```

### Initialization

_ifn_ (optional) -- function table number. Requires a
wrap-around guard point.  Defaults to a sine wave.

_iphs_ (optional, default=0) -- initial phase of waveform in table _ifn_, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is 0.

### Performance

_xamp_ -- the amplitude of the output signal.

_kcps_ -- a common denominator, in cycles per second, for the carrier and modulating frequencies.

_xcar_ -- a factor that, when multiplied by the _kcps_ parameter, gives the carrier frequency.

_xmod_ -- a factor that, when multiplied by the _kcps_ parameter, gives the modulating frequency.

_kndx_ -- the modulation index.

_foscil_ is a composite unit that effectively banks two _oscil_ opcodes in the familiar Chowning FM setup, wherein the audio-rate output of one generator is used to modulate the frequency input of another (the &#8220;carrier&#8221;). Effective carrier frequency = _kcps_ * _xcar_, and modulating frequency = _kcps_ * _xmod_. For integral values of _xcar_ and _xmod_, the perceived fundamental will be the minimum positive value of _kcps_ * (_xcar_ - _n_ * _xmod_), _n_ = 0,1,2,... The input _kndx_ is the index of modulation (usually time-varying and ranging 0 to 4 or so) which determines the spread of acoustic energy over the partial positions given by _n_ = 0,1,2,.., etc. _ifn_ should point to a stored sine wave. Previous to version 3.50, _xcar_ and _xmod_ could be k-rate only.

The actual formula used for this implementation of FM synthesis is _xamp_ * cos(2&#960; * _t_ * _kcps_ * _xcar_ + _kndx_ * sin(2&#960; * _t _* _kcps_ * _xmod_) - &#960;), assuming that the table is a sine wave.

## Examples

Here is an example of the foscil opcode. It uses the file [foscil.csd](../examples/foscil.csd).

``` csound-orc title="Example of the foscil opcode." linenums="1"
--8<-- "examples/foscil.csd"
```

## See Also

[FM Synthesis](../siggen/fmsynth.md)

More information about frequency modulation on Wikipedia: [http://en.wikipedia.org/wiki/Frequency_modulation_synthesis](http://en.wikipedia.org/wiki/Frequency_modulation_synthesis)
