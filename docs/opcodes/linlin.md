<!--
id:linlin
category:Signal Generators:Linear and Exponential Generators
-->
# linlin
Linear to linear interpolation.

Plugin opcode in emugens.

Maps a linear range of values to another linear range of values. Supports both scalars and arrays, at i- and k-time

## Syntax
=== "Modern"
    ``` csound-orc
    ky = linlin(kx, ky0, ky1 [, kx0, kx1 ])
    iy = linlin(ix, iy0, iy1 [, ix0, ix1 ])
    kys[] = linlin(kxs[], ky0, ky1 [, kx0, kx1 ])
    iys[] = linlin(ixs[], ky0, ky1, [ kx0, kx1 ])
    kC[] = linlin(kx, kA[], kB[] [, kx0, kx1 ])
    ```

=== "Classic"
    ``` csound-orc
    ky linlin kx, ky0, ky1 [, kx0, kx1 ]
    iy linlin ix, iy0, iy1 [, ix0, ix1 ]
    kys[] linlin kxs[], ky0, ky1 [, kx0, kx1 ]
    iys[] linlin ixs[], ky0, ky1, [ kx0, kx1 ]
    kC[] linlin kx, kA[], kB[] [, kx0, kx1 ]
    ```

### Performance

_kx_ -- Input signal

_kx0_ -- Lower limit of input range. _Defaults to 0_

_kx1_ -- Higher limit of input range. _Defaults to 1_

_ky0_ -- Lower limit of output range

_ky1_ -- Higher limit of output range

```
y = (x - x0) / (x1 - x0) * (y1 - y0) + y0
```

## Examples

Here is an example of the linlin opcode. It uses the file [linlin.csd](../examples/linlin.csd).

``` csound-orc title="Example of the linlin opcode." linenums="1"
--8<-- "examples/linlin.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

By: Eduardo Moguillansky 2017

New plugin in version 6.11
