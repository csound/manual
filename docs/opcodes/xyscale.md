<!--
id:xyscale
category:Signal Generators:Linear and Exponential Generators
-->
# xyscale
2D linear interpolation.

Plugin opcode in emugens.

2D linear interpolation between 4 points at (0,0), (1,0), (0,1),
(1,1)

## Syntax
=== "Modern"
    ``` csound-orc
    kout = xyscale(kx, ky, k00, k10, k01, k11)
    ```

=== "Classic"
    ``` csound-orc
    kout xyscale kx, ky, k00, k10, k01, k11
    ```

### Performance

_kx_, _ky_ -- Coordinates to evaluate the interpolation. Value between 0-1, where:

_k00_ -- Value of point at coord (x=0, y=0)

_k10_ -- Value of point at coord (x=1, y=0)

_k01_ -- Value of point at coord (x=0, y=1)

_k11_ -- Value of point at coord (x=1, y=1)

```
(0,1)      (1,1)

(0,0)      (1,0)
```

Given 4 values placed at the corners of a square, find the interpolated value at point (x, y), where x and y are defined between 0-1.

## Examples

Here is an example of the xyscale opcode. It uses the file [xyscale.csd](../examples/xyscale.csd).

``` csound-orc title="Example of the xyscale opcode." linenums="1"
--8<-- "examples/xyscale.csd"
```

Here is another example of the xyscale opcode. It uses the file [xyscale-FLTK.csd](../examples/xyscale-FLTK.csd).

``` csound-orc title="Advanced example of the xyscale opcode." linenums="1"
--8<-- "examples/xyscale-FLTK.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

By: Eduardo Moguillansky 2017
