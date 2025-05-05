<!--
id:lincos
category:Signal Generators:Linear and Exponential Generators
-->
# lincos
Linear to cosine interpolation.

Plugin opcode in emugens.

Maps a linear range of values to a cosine (easy-in/easy-out) range of values. At present it supports only scalars, at i- and k-time (no arrays)

## Syntax
=== "Modern"
    ``` csound-orc
    ky = lincos(kx, ky0, ky1 [, kx0, kx1 ])
    iy = lincos(ix, iy0, iy1 [, ix0, ix1 ])
    ```

=== "Classic"
    ``` csound-orc
    ky lincos kx, ky0, ky1 [, kx0, kx1 ]
    iy lincos ix, iy0, iy1 [, ix0, ix1 ]
    ```

### Performance

_kx_ -- Input signal

_ky0_ -- Lower limit of output range

_ky1_ -- Higher limit of output range

_kx0_ -- Lower limit of input range (default = 0)

_kx1_ -- Higher limit of input range (default = 1)

```
dx = ((x-x0) / (x1-x0)) * PI + PI
y  = y0 + ((y1 - y0) * (1 + cos(dx)) / 2.0);
```

## Examples

Here is an example of the lincos opcode. It uses the file [lincos.csd](../examples/lincos.csd).

``` csound-orc title="Example of the lincos opcode." linenums="1"
--8<-- "examples/lincos.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

By: Eduardo Moguillansky 2018

New plugin in version 6.12
