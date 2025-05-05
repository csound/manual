<!--
id:noise
category:Signal Generators:Random (Noise) Generators
-->
# noise
A white noise generator with an IIR lowpass filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = noise(xamp, kbeta)
    ```

=== "Classic"
    ``` csound-orc
    ares noise xamp, kbeta
    ```

### Performance

_xamp_ -- amplitude of final output

_kbeta_ -- beta of the lowpass filter. Should be in the range of -1 to 1, exclusive of the end-points.

The filter equation is:

<figure markdown="span">
![[Filter equation for filter in noise opcode.]](../images/noise-filter.png)
<figcaption></figcaption>
</figure>

where _x<sub>n</sub>_ is the original white noise and _y<sub>n</sub>_ is lowpass filtered noise. The higher &beta; is, the lower the filter's cut-off frequency. The cutoff frequency is roughly sr * ((1-kbeta)/2).

## Examples

Here is an example of the noise opcode. It uses the file [noise.csd](../examples/noise.csd).

``` csound-orc title="Example of the noise opcode." linenums="1"
--8<-- "examples/noise.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist. Ltd.<br>
Bath, UK<br>
December 2000<br>

New in Csound version 4.10
