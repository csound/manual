<!--
id:mode
category:Signal Modifiers:Standard Filters
-->
# mode
A filter that simulates a mass-spring-damper system.

Filters the incoming signal with the specified resonance frequency and quality factor. It can also be seen as a signal generator for high quality factor, with an impulse for the excitation. You can combine several modes to built complex instruments such as bells or guitar tables.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = mode(ain, xfreq, xQ [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    aout mode ain, xfreq, xQ [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- if non zero skip the initialisation of the filter.

### Performance

_aout_ -- filtered signal

_ain_ -- signal to filter

_xfreq_ -- resonant frequency of the filter

> :warning: **Warning**
>
> As this filter would become unstable if _sr_/_xfreq_ &lt; pi, the value of the xfreq is limited to sr/pi-sr/100 internally (e.g _xfreq_ &gt; 13596 Hz @ 44.1 kHz). The _sr_/100 term is because the filter while mathematically stable has a very large amplification as it approaches the unstable region.

_xQ_ -- quality factor of the filter

The resonance time is roughly proportional to _xQ_/_xfreq_.

See [Modal Frequency Ratios](../misc/modalfreq.md) for frequency ratios of real instruments which can be used to determine the values of _xfreq_.

## Examples

Here is an example of the mode opcode. It uses the file [mode.csd](../examples/mode.csd).

``` csound-csd title="Example of the mode opcode." linenums="1"
--8<-- "examples/mode.csd"
```

## See also

[Specialized Filters: Other filters](../sigmod/speciali.md)

## Credits

Original UDO and documentation/example by François Blanc

Opcode translation to C-code by Steven Yi

New in version 5.04

Audio rate parameters introduced in version 6.02

November 2013.
