<!--
id:rms
category:Instrument Control:Sensing and Control
-->
# rms
Determines the root-mean-square amplitude of an audio signal.

It low-pass filters the actual value, to average in the manner of a VU meter.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = rms(asig [, ihp] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    kres rms asig [, ihp] [, iskip]
    ```

### Initialization

_ihp_ (optional, default=10) -- half-power point (in Hz) of a special internal low-pass filter. The default value is 10.

_iskip_ (optional, default=0) -- initial disposition of internal data space (see [reson](../opcodes/reson.md)). The default value is 0.

### Performance

_asig_ -- input audio signal

_kres_ -- low-pass filtered rms value of the input signal

_rms_ output values _kres_ will trace the root-mean-square value of the audio input _asig_. This unit is not a signal modifier, but functions rather as a signal power-gauge. It uses an internal low-pass filter to make the response smoother. _ihp_ can be used to control this smoothing. The higher the value, the "snappier" the measurement.

This opcode can also be used as an evelope follower.

The _kres_ output from this opcode is given in amplitude and depends on [0dbfs](../opcodes/0dbfs.md). If you want the output in decibels, you can use [dbamp](../opcodes/dbamp.md)

## Examples

Here is an example of the rms opcode. It uses the file [rms.csd](../examples/rms.csd).

``` csound-csd title="Example of the rms opcode." linenums="1"
--8<-- "examples/rms.csd"
```

Here is another example of the rms opcode. It uses the file [rms-FLTK.csd](../examples/rms-FLTK.csd).

``` csound-csd title="Advanced example of the rms opcode." linenums="1"
--8<-- "examples/rms-FLTK.csd"
```

## See also

[Sensing and Control: Envelope followers](../control/sensing.md)
