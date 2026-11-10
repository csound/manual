<!--
id:atonela
category:Signal Modifiers:Standard Filters
-->
# atonela
A look-ahead first-order high-pass filter equivalent to [atone](../opcodes/atone.md).

_atonela_ is the high-pass complement of [tonela](../opcodes/tonela.md). For a
constant cutoff it produces the same output as [atone](../opcodes/atone.md),
without adding latency. Its output is the input signal minus the low-pass output
of _tonela_:

a<sub>hp</sub> = x<sub>n</sub> - y<sub>n</sub>

where y<sub>n</sub> is the look-ahead low-pass result used by _tonela_. As with
[atone](../opcodes/atone.md), power scaling is not normalized, so parallel
matching _tonela_ and _atonela_ outputs add back to the original signal.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = atonela(asig, khp [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares atonela asig, khp [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ares_ -- the output signal at audio rate.

_asig_ -- the input signal at audio rate.

_khp_ -- the response curve's half-power point, in Hertz. Half power is defined as peak power / root 2. The cutoff is k-rate.

_atonela_ uses the same four-sample look-ahead form as [tonela](../opcodes/tonela.md)
and subtracts its low-pass output from the input. It therefore tracks
[atone](../opcodes/atone.md) for a constant cutoff and adds no latency. When
_khp_ changes, the direct recurrence is used for four samples before the
look-ahead form resumes.

The look-ahead form performs more arithmetic per sample than _atone_, since each
output is formed from four input taps and one delayed output. It is intended for
situations where the four independent samples can be processed efficiently in
parallel.

## Examples

Here is an example of the atonela opcode. It uses the file [atonela.csd](../examples/atonela.csd).

``` csound-csd title="Example of the atonela opcode." linenums="1"
--8<-- "examples/atonela.csd"
```

## See also

[Standard filters: Hi-pass filters](../sigmod/standard.md)

## Credits

Author: Victor Lazzarini<br>
Ireland<br>

New in Csound version 7.0
