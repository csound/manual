<!--
id:mvmfilter
category:Signal Modifiers:Specialized Filters
-->
# mvmfilter
A filter with pronounced resonance and controllable decay time.

Filters the incoming signal with the specified resonance frequency and decay time. This can be used to overlay a specific resonance on to an incoming sound or to model short bursts of sinusoids at a desired frequency. With a sufficiently long decay time it can be used as a sinusoidal oscillator.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = mvmfilter(ain, xfreq, xTau [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    aout mvmfilter ain, xfreq, xTau [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- if non zero skip the initialisation of the filter.

### Performance

_aout_ -- filtered signal

_ain_ -- signal to filter

_xfreq_ -- resonant frequency of the filter

> :warning: **Warning**
>
> The filter output can rapidly grow to very large output if the input signal correlates with the output. The worst case is that it grows by the magnitude of the input with every sample. To limit the growth so the filter does not explode, it is best to scale down any continuous input significantly. The required scale is related to the value of the decay-time tau so if you select a maximum decay-time you can calculate the required scaling: factor = 1 / $M_E / (_sr_*tau)

_xTau_ -- Decay time of the filter in seconds

The decay time is the time in seconds for filter to decay to 1/_e_

## Examples

Here is an example of the mvmfilter opcode. It uses the file [mvmfilter.csd](../examples/mvmfilter.csd).

``` csound-csd title="Example of the mvmfilter opcode." linenums="1"
--8<-- "examples/mvmfilter.csd"
```

## See also

[Specialized Filters: Other filters](../sigmod/speciali.md)

### References

This filter is based on the work of Max Mathews and Julius O. Smith III. This filter was originally used by Max Mathews in an application which applied a bank of these filters to an incoming sound with live controls over the decay time and frequency parameters. This setup was the basis for collaborative live performance and was referred to as Phasor Filters.

1.   Max Mathews and Julius O. Smith III, ["Very High Q Parametrically WellBehaved Two Pole Filters"](https://ccrma.stanford.edu/~jos/smac03maxjos/smac03maxjos.pdf)

## Credits

Original design by Max V. Mathews and Julius O. Smith III

Opcode implementation by Joel Ross

New in version 6.16

May 2021.
