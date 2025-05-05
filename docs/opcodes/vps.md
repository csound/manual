<!--
id:vps
category:Signal Modifiers:Phase Shaping
-->
# vps
Shapes a phase signal according to a two-dimensional vector.

Vector phase shaping modifies a phase input value by mapping an input, in the range [0, 1) according to a non-linear function consisting of two piecewise linear segments joined at an inflection point. This is defined by the vector [kd, kv], where kd is in the range [0, 1) and kv can have any value.

## Syntax
=== "Modern"
    ``` csound-orc
    avp = vps(aph,kd,kv)
    ```

=== "Classic"
    ``` csound-orc
    avp vps aph,kd,kv
    ```

### Performance

_avp_ -- output phase.

_aph_ -- input phase (as produced by phasor).

_kd_ -- horizontal vector component.

_aph_ -- vertical vector component.

## Examples

Here is an example of the use of the _vps_ opcode. It uses the file [vps.csd](../examples/vps.csd).

``` csound-csd title="Example of the _vps_ opcode." linenums="1"
--8<-- "examples/vps.csd"
```

## See also

[Phase Distortion](../sigmod/wavshape.md)

## Credits

Author: Victor Lazzarini<br>
July  2020<br>
