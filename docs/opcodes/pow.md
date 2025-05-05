<!--
id:pow
category:Mathematical Operations:Opcode Equivalents of Functions
-->
# pow
Computes one argument to the power of another argument and scales the result.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pow(aarg, k= pow([, inorm])
    ires = pow(iarg, i= pow([, inorm])
    kres = pow(karg, k= pow([, inorm])
    ires[] = pow(iarg[], ipow[])
    kres[] = pow(karg[], kpow[])
    ires[] = pow(iarg[], ipow)
    kres[] = pow(karg[], kpow)
    ```

=== "Classic"
    ``` csound-orc
    ares pow aarg, kpow [, inorm]
    ires pow iarg, ipow [, inorm]
    kres pow karg, kpow [, inorm]
    ires[] pow iarg[], ipow[]
    kres[] pow karg[], kpow[]
    ires[] pow iarg[], ipow
    kres[] pow karg[], kpow
    ```

### Initialization

_inorm_ (optional, default=1) -- The number to divide the result (default to 1). This is especially useful if you are doing powers of a- or k- signals where samples out of range are extremely common!

### Performance

_aarg_, _iarg_, _karg_ -- the base.

_ipow_, _kpow_ -- the exponent.

> :memo: **Note**
>
> Use _&circ;_ with caution in arithmetical statements, as the precedence may not be correct. New in Csound version 3.493.

## Examples

Here is an example of the pow opcode. It uses the file [pow.csd](../examples/pow.csd).

``` csound-csd title="Example of the pow opcode." linenums="1"
--8<-- "examples/pow.csd"
```

Its output should include lines like these:

```
i1     0.50000
i1     0.50007
i1     0.50014
.......
i1    14.45986
i1    14.46130
```

## See also

[Mathematical Functions](../math/mathfunc.md)

[Opcode Equivalents of Functions](../math/opeqfunc.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>
