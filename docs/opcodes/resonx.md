<!--
id:resonx
category:Signal Modifiers:Standard Filters:Resonant
-->
# resonx
Emulates a stack of filters using the reson opcode.

_resonx_ passes the input through a series of [reson](../opcodes/reson.md) filters. All layers use the same center frequency, bandwidth, and scaling mode. More layers give a sharper combined response.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = resonx(asig, xcf, xbw [, inumlayer] [, iscl] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares resonx asig, xcf, xbw [, inumlayer] [, iscl] [, iskip]
    ```

### Initialization

_inumlayer_ (optional) -- number of elements in the filter stack. Default value is 4.

_iscl_ (optional, default=0) -- scaling mode for each layer, as in _reson_. A value of 1 gives each layer a peak gain of 1. A value of 2 gives each layer an RMS gain of 1 for white-noise input; this does not make the combined filter's RMS gain equal to 1. A value of 0 applies no scaling. Use [balance](../opcodes/balance.md) if you need to adjust the final output level.

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal.

_xcf_ -- center frequency of each layer in Hz, at control or audio rate.

_xbw_ -- bandwidth of each layer in Hz, at control or audio rate. This is the difference between that layer's upper and lower half-power frequencies. The combined filter has a narrower bandwidth when it contains more than one layer.

At each sample, every layer uses the same current _xcf_ and _xbw_ values. Either parameter can be audio-rate while the other is control-rate.

## Examples

Here is an example of the resonx opcode. It uses the file [resonx.csd](../examples/resonx.csd).

``` csound-csd title="Example of the resonx opcode." linenums="1"
--8<-- "examples/resonx.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado (adapted by John ffitch)<br>
Italy<br>

New in Csound version 3.49

Audio rate parameters introduced in version 6.02

November 2013.
