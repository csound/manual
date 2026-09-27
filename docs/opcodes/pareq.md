<!--
id:pareq
category:Signal Modifiers:Specialized Filters
-->
# pareq
Implementation of Zoelzer's parametric equalizer filters, with some modifications by the author.

The formulas below use _f_ for _kc_, _V_ for _kv_, and _Q_ for _kq_. The filter divides all coefficients by _a0_.

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
b2    = 1 - sqrt(2*V)*K + V*K^2

a0    = 1 + K/Q + K^2
a1    = -2*(K^2 - 1)
a2    = 1 - K/Q + K^2
```

The formula for the peaking filter is:

```
omega = 2*pi*f/sr
K     = tan(omega/2)

b0 =  1 + V*K/Q + K^2
b1 =  2*(K^2 - 1)
b2 =  1 - V*K/Q + K^2

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

_iskip_ (optional, default=0) -- a nonzero value keeps the filter's mode and history on reinitialization. First use always initializes the filter. With zero, reinitialization clears the history and applies _imode_.

### Performance

_kc_ -- center frequency in peaking mode, corner frequency in shelving mode.

_kv_ -- linear gain: a value below 1 is a cut, and a value above 1 is a boost. In peaking mode, 1 gives a flat response. In shelving modes, a flat response also requires _kq_ = sqrt(.5); other Q values can shape the response near the corner frequency even when _kv_ = 1.

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
