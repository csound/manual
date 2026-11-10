<!--
id:tonela
category:Signal Modifiers:Standard Filters
-->
# tonela
A look-ahead first-order recursive low-pass filter equivalent to [tone](../opcodes/tone.md).

_tonela_ implements the same first-order low-pass response as _tone_, but uses an
algebraically equivalent form that computes four output samples at a time. For a
constant cutoff it produces the same output as _tone_ without adding latency. The
form is intended for implementations that can take advantage of SIMD or parallel
sample processing.

The direct first-order recurrence used by [tone](../opcodes/tone.md) is:

y<sub>n</sub> = c1 * x<sub>n</sub> + c2 * y<sub>n-1</sub>

Writing a = c2 and b = c1, the same filter can be evaluated four samples ahead as:

y<sub>n</sub> = a<sup>4</sup> y<sub>n-4</sub>
&nbsp;+&nbsp; b x<sub>n</sub>
&nbsp;+&nbsp; ab x<sub>n-1</sub>
&nbsp;+&nbsp; a<sup>2</sup>b x<sub>n-2</sub>
&nbsp;+&nbsp; a<sup>3</sup>b x<sub>n-3</sub>

The four delayed output values and the three delayed input values form the filter
state. In this form the four output samples in a group are independent of each
other, so they can be evaluated in parallel or with vector instructions.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = tonela(asig, khp [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares tonela asig, khp [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ares_ -- the output audio signal.

_asig_ -- the input audio signal.

_khp_ -- the response curve's half-power point, in Hertz. Half power is defined as peak power / root 2. The cutoff is k-rate.

_tonela_ implements the same response as [tone](../opcodes/tone.md), but its
four-sample look-ahead form evaluates four output samples together. It has no
additional latency. When _khp_ changes, the direct recurrence is used for four
samples so that the filter output is not disturbed, after which the look-ahead
form resumes.

The look-ahead form performs more arithmetic per sample than _tone_, since each
output is formed from four input taps and one delayed output. It is intended for
situations where the four independent samples can be processed efficiently in
parallel.

## Examples

Here is an example of the tonela opcode. It uses the file [tonela.csd](../examples/tonela.csd).

``` csound-csd title="Example of the tonela opcode." linenums="1"
--8<-- "examples/tonela.csd"
```

## See also

[Standard filters: Low-pass filters](../sigmod/standard.md)

## Credits

Author: Victor Lazzarini<br>
Ireland<br>

New in Csound version 7.0
