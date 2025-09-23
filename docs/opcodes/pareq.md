<!--
id:pareq
category:Signal Modifiers:Specialized Filters
-->
# pareq
Implementation of Zoelzer's parametric equalizer filters, with some modifications by the author.

The formula for the low shelf filter is:

```
omega = 2*pi*f/sr
K     = tan(omega/2)

b0    = 1 + sqrt(2*V)*K + V*K^2
b1    = 2*(V*K^2 - 1)
b2    = 1 - sqrt(2*V)*K + V*K^2

a0    = 1 + K/Q + K^2
a1    = 2*(K^2 - 1)
a2    = 1 - K/Q + K^2
```

The formula for the high shelf filter is:

```
omega = 2*pi*f/sr
K     = tan((pi-omega)/2)

b0    = 1 + sqrt(2*V)*K + V*K^2
b1    = -2*(V*K^2 - 1)
b1    = 1 - sqrt(2*V)*K + V*K^2

a0    = 1 + K/Q + K^2
a1    = -2*(K^2 - 1)
a2    = 1 - K/Q + K^2
```

The formula for the peaking filter is:

```
omega = 2*pi*f/sr
K     = tan(omega/2)

b0 =  1 + V*K/2 + K^2
b1 =  2*(K^2 - 1)
b2 =  1 - V*K/2 + K^2

a0 =  1 + K/Q + K^2
a1 =  2*(K^2 - 1)
a2 =  1 - K/Q + K^2
```

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pareq(asig, kc, kv, kq [, imode] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares pareq asig, kc, kv, kq [, imode] [, iskip]
    ```

### Initialization

_imode_ (optional, default: 0) -- operating mode

*  0 = Peaking
*  1 = Low Shelving
*  2 = High Shelving

_iskip_ (optional, default=0) -- if non zero skip the initialisation of the filter. (New in Csound version 4.23f13 and 5.0)

### Performance

_kc_ -- center frequency in peaking mode, corner frequency in shelving mode.

_kv_ -- amount of boost or cut. A value less than 1 is a cut. A value greater than 1 is a boost. A value of 1 is a flat response.

_kq_ -- Q of the filter (sqrt(.5) is no resonance)

_asig_ -- the incoming signal

## Examples

Here is an example of the pareq opcode. It uses the file [pareq.csd](../examples/pareq.csd).

``` csound-csd title="Example of the pareq opcode." linenums="1"
--8<-- "examples/pareq.csd"
```

## See also

[Specialized Filters: Parametric EQ](../sigmod/speciali.md)

## Credits

Hans Mikelson<br>
December 1998<br>

New in Csound version 3.50
