<!--
id:bpfcos
category:Signal Generators:Linear and Exponential Generators
-->
# bpfcos
Break point function with cosine (easy-in/easy-out) interpolation.

Plugin opcode in emugens.

Given an x value and a series of pairs (x, y), it returns the corresponding y value in the half cosine curve defined by the pairs. It works both at i- and k- time

## Syntax
=== "Modern"
    ``` csound-orc
    ky = bpfcos(kx, kx1, ky1, kx2, ..., kxn, kyn)
    kys[] = bpfcos(kxs[], kx1, ky1, kx2, ..., kxn, kyn)
    ky = bpfcos(kx, kxs[], kys[])
    ky = bpfcos(kx, ixs[], iys[])
    ky, kz = bpfcos(kx, kxs[], kys[], kzs[])
    ky, kz = bpfcos(kx, ixs[], iys[], izs[])
    ```

=== "Classic"
    ``` csound-orc
    ky bpfcos kx, kx1, ky1, kx2, ..., kxn, kyn
    kys[] bpfcos kxs[], kx1, ky1, kx2, ..., kxn, kyn
    ky bpfcos kx, kxs[], kys[]
    ky bpfcos kx, ixs[], iys[]
    ky, kz bpfcos kx, kxs[], kys[], kzs[]
    ky, kz bpfcos kx, ixs[], iys[], izs[]
    ```

### Performance

_kx_ -- Input value. Can also be an array

_kxn, kyn_ -- Defines a breakpoint. Can be changed at krate, but all _kx_s must be sorted

The points (kx1, ky1), (kx2, ky2), etc, define a cosine interpolated function. This function is evaluated at point _kx_. This function extends to both -inf and +inf, so if kx &lt; kx1 then ky = ky1 and the same holds true the other end.

Array Variants:

``` csound-orc
kys[] bpfcos kxs[], kx1, ky1, kx2, ..., kxn, kyn
```

For each x in kxs, calculate the y value defined by the points (kx1, ky1), ... (kxn, kyn)

``` csound-orc
ky bpfcos kx, ixs[], iys[]
```

In this variants the points are defined through arrays. ixs contains all the x values, iys contains all the y values

``` csound-orc
ky, kz bpfcos kx, kxs[], kys[], kzs[] 
```

The same as the variant above, but for multidimensional points. Given two curves sharing the same x points, calculate the value at x for both dimensions simultaneously.
(see example)

> :memo: **Note**
>
> x values need to be sorted. Both x and y values can change but x values must stay sorted.


## Examples

Here is an example of the bpfcos opcode. It uses the file [bpfcos.csd](../examples/bpfcos.csd).

``` csound-orc title="Example of the bpfcos opcode." linenums="1"
--8<-- "examples/bpfcos.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

By: Eduardo Moguillansky 2018

New plugin in version 6.12

Array versions in version 6.14
