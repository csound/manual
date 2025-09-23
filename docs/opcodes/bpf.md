<!--
id:bpf
category:Signal Generators:Linear and Exponential Generators
-->
# bpf
Break point function with linear interpolation.

Plugin opcode in emugens.

## Syntax
=== "Modern"
    ``` csound-orc
    ky = bpf(kx, kx1, ky1, kx2, ..., kxn, kyn)
    iy = bpf(ix, ix1, iy1, ix2, ..., ixn, iyn)
    kys[] = bpf(kxs[], kx1, ky1, kx2, ..., kxn, kyn)
    iys[] = bpf(ixs[], ix1, iy1, ix2, ..., ixn, iyn)
    ky = bpf(kx, kxs[], kys[])
    iy = bpf(ix, ixs[], iys[])
    ay = bpf(ax, kx1, ky1, kx2, ..., kxn, kyn)
    ay = bpf(ax, kxs[], kys[])
    ky, kw = bpf(kx, kxs[], kys[], kws[])
    ```

=== "Classic"
    ``` csound-orc
    ky bpf kx, kx1, ky1, kx2, ..., kxn, kyn
    iy bpf ix, ix1, iy1, ix2, ..., ixn, iyn
    kys[] bpf kxs[], kx1, ky1, kx2, ..., kxn, kyn
    iys[] bpf ixs[], ix1, iy1, ix2, ..., ixn, iyn
    ky bpf kx, kxs[], kys[]
    iy bpf ix, ixs[], iys[]
    ay bpf ax, kx1, ky1, kx2, ..., kxn, kyn
    ay bpf ax, kxs[], kys[]
    ky, kw bpf kx, kxs[], kys[], kws[]
    ```

### Performance

_kx_ -- Input value

_kxn, kyn_ -- Defines a breakpoint. Can be changed at krate, but all _kx_s must be sorted.

The points (kx1, ky1), (kx2, ky2), etc, define a linearly interpolated function. This function is evaluated at point _kx_. This function extends to both -inf and +inf, so if kx &lt; kx1 then ky = ky1 and the same holds true the other end.

These are equivalent:

``` csound-orc
ky bpf kx, 0, 0,  0.5, 10,  1.02, 200

itab ftgenonce 0, 0, -27, 0, 0, 50, 10, 102, 200
ky = tablei(limit(kx, 0, 1.02)*100, itab)
```

> :memo: **Note**
>
> x values need to be sorted. Both x and y values can change but x values must stay sorted.


## Examples

Here is an example of the bpf opcode. It uses the file [bpf.csd](../examples/bpf.csd).

``` csound-orc title="Example of the bpf opcode." linenums="1"
--8<-- "examples/bpf.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

By: Eduardo Moguillansky 2017
