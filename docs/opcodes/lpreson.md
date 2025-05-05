<!--
id:lpreson
category:Spectral Processing:LPC
-->
# lpreson
RResynthesises a signal from the data passed internally by a previous _lpread_.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = lpreson(asig)
    ```

=== "Classic"
    ``` csound-orc
    ares lpreson asig
    ```

### Performance

_asig_ -- an audio driving function for resynthesis.

_lpreson_ receives values internally produced by a leading _lpread_._lpread_ gets its values from the control file according to the input value _ktimpnt_ (in seconds). If _ktimpnt_ proceeds at the analysis rate, time-normal synthesis will result; proceeding at a faster, slower, or variable rate will result in time-warped synthesis. At each k-period, _lpread_ interpolates between adjacent frames to more accurately determine the parameter values (presented as output) and the filter coefficient settings (passed internally to a subsequent _lpreson_).

The error signal _kerr_ (between 0 and 1) derived during predictive analysis reflects the deterministic/random nature of the analyzed source. This will emerge low for pitched (periodic) material and higher for noisy material. The transition from voiced to unvoiced speech, for example, produces an error signal value of about .3. During synthesis, the error signal value can be used to determine the nature of the  _lpreson_ driving function: for example, by arbitrating between pitched and non-pitched input, or even by determining a mix of the two. In normal speech resynthesis, the pitched input to _lpreson_ is a wideband periodic signal or pulse train derived from a unit such as [buzz](../opcodes/buzz.md), and the nonpitched source is usually derived from [rand](../opcodes/rand.md). However, any audio signal can be used as the driving function, the only assumption of the analysis being that it has a flat response.

[lpfreson](../opcodes/lpfreson.md) is a formant shifted _lpreson_, in which _kfrqratio_ is the (cps) ratio of shifted to original formant positions. This permits synthesis in which the source object changes its apparent acoustic size. [lpfreson](../opcodes/lpfreson.md) with _kfrqratio_ = 1 is equivalent to _lpreson_.

Generally, _lpreson_ provides a means whereby the time-varying content and spectral shaping of a composite audio signal can be controlled by the dynamic spectral content of another. There can be any number of _lpread/lpreson_ (or _lpfreson_) pairs in an instrument or in an orchestra; they can read from the same or different control files independently.

## Examples

Here is an example of the lpreson opcode. It uses the file [lpreson.csd](../examples/lpreson.csd).

``` csound-csd title="Example of the lpreson opcode." linenums="1"
--8<-- "examples/lpreson.csd"
```

Here is another example of the lpreson opcode. It uses the file [lpreson-2.csd](../examples/lpreson-2.csd).

``` csound-csd title="Another example of the lpreson opcode." linenums="1"
--8<-- "examples/lpreson-2.csd"
```

## See also

[Linear Predictive Coding (LPC) Resynthesis](../spectral/lpcresyn.md)
