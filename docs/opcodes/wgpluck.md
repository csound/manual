<!--
id:wgpluck
category:Signal Generators:Waveguide Physical Modeling
-->
# wgpluck
A high fidelity simulation of a plucked string, using interpolating delay-lines.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = wgpluck(icps, iamp, kpick, iplk, idamp, ifilt, axcite)
    ```

=== "Classic"
    ``` csound-orc
    ares wgpluck icps, iamp, kpick, iplk, idamp, ifilt, axcite
    ```

### Initialization

_icps_ -- frequency of plucked string

_iamp_ -- amplitude of string pluck

_iplk_ -- point along the string, where it is plucked, in the range of 0 to 1. 0 = no pluck

_idamp_ -- damping of the note. This controls the overall decay of the string. The greater the value of _idamp_, the faster the decay. Negative values will cause an increase in output over time.

_ifilt_ -- control the attenuation of the filter at the bridge. Higher values cause the higher harmonics to decay faster.

### Performance

_kpick_ -- proportion of the way along the point to sample the output.

_axcite_ -- a signal which excites the string.

A string of frequency _icps_ is plucked with amplitude _iamp_ at point _iplk_. The decay of the virtual string is controlled by _idamp_ and _ifilt_ which simulate the bridge. The oscillation is sampled at the point _kpick_, and excited by the signal _axcite_.

## Examples

Here is an example of the wgpluck opcode. It uses the
file [wgpluck.csd](../examples/wgpluck.csd).

``` csound-csd title="An example of the wgpluck opcode." linenums="1"
--8<-- "examples/wgpluck.csd"
```

## See also

[Waveguide Physical Modeling](../siggen/wavguide.md)

## Credits

Author: Michael A. Casey<br>
M.I.T.<br>
Cambridge, Mass.<br>
1997<br>

New in Version 3.47
