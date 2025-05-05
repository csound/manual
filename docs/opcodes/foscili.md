<!--
id:foscili
category:Signal Generators:FM Synthesis
-->
# foscili
Basic frequency modulated oscillator with linear interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = foscili(xamp, kcps, xcar, xmod, kndx [, ifn, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares foscili xamp, kcps, xcar, xmod, kndx [, ifn, iphs]
    ```

### Initialization

_ifn_ (optional) -- function table
number. Requires a wrap-around guard point. Defaults to a sine wave.

_iphs_ (optional, default=0) -- initial phase of waveform in table _ifn_, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is 0.

### Performance

_xamp_ -- the amplitude of the output signal.

_kcps_ -- a common denominator, in cycles per second, for the carrier and modulating frequencies.

_xcar_ -- a factor that, when multiplied by the _kcps_ parameter, gives the carrier frequency.

_xmod_ -- a factor that, when multiplied by the _kcps_ parameter, gives the modulating frequency.

_kndx_ -- the modulation index.

_foscili_ differs from [foscil](../opcodes/foscil.md) in that the standard procedure of using a truncated phase as a sampling index is here replaced by a process that interpolates between two successive lookups. Interpolating generators will produce a noticeably cleaner output signal, but they may take as much as twice as long to run. Adequate accuracy can also be gained without the time cost of interpolation by using large stored function tables of 2K, 4K or 8K points if the space is available.

## Examples

Here is an example of the foscili opcode. It uses the file [foscili.csd](../examples/foscili.csd).

``` csound-orc title="Example of the foscili opcode." linenums="1"
--8<-- "examples/foscili.csd"
```

## See Also

[FM Synthesis](../siggen/fmsynth.md)

More information about frequency modulation on Wikipedia: [http://en.wikipedia.org/wiki/Frequency_modulation_synthesis](http://en.wikipedia.org/wiki/Frequency_modulation_synthesis)
