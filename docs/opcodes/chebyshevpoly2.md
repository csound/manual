<!--
id:chebyshevpoly2
category:Signal Modifiers:Waveshaping
-->
# chebyshevpoly2
Evaluates a weighted sum of Chebyshev polynomials directly for each audio sample.

Use it for waveshaping with changing harmonic weights, especially when you need many terms. It accepts a list of coefficients or a numeric array.

## Syntax

=== "Modern"
    ``` csound-orc
    aout = chebyshevpoly2(ain, k0 [, k1 [, k2 [...]]])
    aout = chebyshevpoly2(ain, kcoefficients)
    aout = chebyshevpoly2(ain, icoefficients)
    ```

=== "Classic"
    ``` csound-orc
    aout chebyshevpoly2 ain, k0 [, k1 [, k2 [...]]]
    aout chebyshevpoly2 ain, kcoefficients
    aout chebyshevpoly2 ain, icoefficients
    ```

### Performance

`ain` is the audio input and `aout` is the audio output. The opcode evaluates the following sum, where `x` is the current input sample.

``` text
output = c0*T0(x) + c1*T1(x) + c2*T2(x) + ...
T0(x) = 1
T1(x) = x
T2(x) = 2*x*x - 1
Tn(x) = 2*x*T[n-1](x) - T[n-2](x)
```

`k0, k1, k2, ...` are the weights for successive polynomials. Supply at least one coefficient. `k0` is the constant term, not the fundamental. A single coefficient produces a constant output. Two coefficients produce `k0 + k1*ain`. Coefficients can change at control rate.

`kcoefficients` and `icoefficients` are one-dimensional numeric arrays. Element 0 is `c0`, element 1 is `c1`, and so on. An array of length N includes terms through `T[N-1]`. The array must contain at least one element. Empty, uninitialized or multidimensional arrays cause an error. The k-rate form reads the current array values and length each control cycle.

For example, this i-rate array gives the same weights as the list `0, 1, 0, 0.5`.

``` csound-orc
icoefficients[] fillarray 0, 1, 0, 0.5
aout = chebyshevpoly2(ain, icoefficients)
```

For a cosine input of amplitude 1, `Tn(cos(phase))` is `cos(n*phase)`. Each coefficient then sets the weight of one harmonic, with `c0` adding a DC offset. Changing the input amplitude or waveform changes that relationship. Apply an output envelope after waveshaping if you want to keep the chosen harmonic balance.

For ordinary waveshaping, keep the input between -1 and 1. These are literal sample values, independent of `0dbfs`. The opcode does not clamp the input or normalize the output. Values outside that range can grow very large at high orders. Scale the output to avoid clipping, and keep the generated harmonics below half the sample rate to avoid aliasing.

### How it differs from chebyshevpoly

Both opcodes describe the same mathematical sum and use the same coefficient order. [chebyshevpoly](chebyshevpoly.md) first expands the sum into powers of `x`, then evaluates that polynomial. At high orders, the expanded coefficients can become very large. Rounding and overflow can spoil a result even when the final Chebyshev sum is finite.

`chebyshevpoly2` uses Clenshaw recurrence to evaluate the series without that expansion. It uses double precision for the intermediate calculations in both float and double builds. This improves high-order evaluation, but does not guarantee a finite result for every input or coefficient.

`chebyshevpoly` can be faster for low orders. It keeps its established behavior for existing pieces. `chebyshevpoly2` adds the array forms and can give different rounding results, so the two are not guaranteed to produce identical samples.

## Examples

The example starts with a 220 Hz tone and gradually adds its third harmonic at 660 Hz. A coefficient list produces the left channel and a k-rate array produces the right channel. Both use the same weights and should sound the same.

The input stays at amplitude 1. An envelope and output gain control the volume after waveshaping, so the fade does not change the harmonic balance.

It uses [chebyshevpoly2.csd](../examples/chebyshevpoly2.csd).

``` csound-csd title="Add a harmonic with list and array coefficients" linenums="1"
--8<-- "examples/chebyshevpoly2.csd"
```

## See also

[chebyshevpoly](chebyshevpoly.md), [polynomial](polynomial.md), [GEN13](../scoregens/gen13.md), [Waveshaping](../sigmod/wavshape.md)

## Credits

Author Hlöðver Sigurðsson, 2026.

The original `chebyshevpoly` opcode is by Anthony Kozar.

New in Csound 7.
