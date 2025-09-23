<!--
id:chebyshevpoly
category:Signal Modifiers:Waveshaping
-->
# chebyshevpoly
Efficiently evaluates the sum of Chebyshev polynomials of arbitrary order.

The _chebyshevpoly_ opcode calculates the value of a polynomial expression with a single a-rate input variable that is made up of a linear combination of the first N Chebyshev polynomials of the first kind.  Each Chebyshev polynomial, Tn(x), is weighted by a k-rate coefficient, _kn_, so that the opcode is calculating a sum of any number of terms in the form _kn*Tn(x)_.  Thus, the _chebyshevpoly_ opcode allows for the waveshaping of an audio signal with a _dynamic_ transfer function that gives precise control over the harmonic content of the output.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = chebyshevpoly(ain, k0 [, k1 [, k2 [...]]])
    ```

=== "Classic"
    ``` csound-orc
    aout chebyshevpoly ain, k0 [, k1 [, k2 [...]]]
    ```

### Performance

_ain_ --  the input signal used as the independent variable of the Chebyshev polynomials ("x").

_aout_ --  the output signal ("y").

_k0, k1, k2, ..._ --  k-rate multipliers for each Chebyshev polynomial.

This opcode is very useful for dynamic waveshaping of an audio signal.  Traditional waveshaping techniques utilize a lookup table for the transfer function -- usually a sum of Chebyshev polynomials.  When a sine wave at full-scale amplitude is used as an index to read the table, the precise harmonic spectrum as defined by the weights of the Chebyshev polynomials is produced.   A dynamic spectrum is acheived by varying the amplitude of the input sine wave, but this produces a non-linear change in the spectrum.

By directly calculating the Chebyshev polynomials, the _chebyshevpoly_ opcode allows more control over the spectrum and the number of harmonic partials added to the input can be varied with time.  The value of each _kn_ coefficient directly controls the amplitude of the nth harmonic partial if the input _ain_ is a sine wave with amplitude = 1.0.  This makes _chebyshevpoly_ an efficient additive synthesis engine for N partials that requires only one oscillator instead of N oscillators.  The amplitude or waveform of the input signal can also be changed for different waveshaping effects.

If we consider the input parameter _ain_ to be "x" and the output _aout_ to be "y", then the _chebyshevpoly_ opcode calculates the following equation:

```
y = k0*T0(x) + k1*T1(x) + k2*T2(x) + k3*T3(x) + ...
```

where the Tn(x) are defined by the recurrence relation

```
T0(x) = 1,
T1(x) = x,
Tn(x) = 2x*T[n-1](x) - T[n-2](x)
```

More information about Chebyshev polynomials can be found on Wikipedia at [http://en.wikipedia.org/wiki/Chebyshev_polynomial](http://en.wikipedia.org/wiki/Chebyshev_polynomial)

## Examples

=== "Modern"
    Here is an example of the chebyshevpoly opcode. It uses the file [chebyshevpoly-modern.csd](../examples/chebyshevpoly-modern.csd).
    ``` csound-csd title="Example of the chebyshevpoly opcode." linenums="1"
    --8<-- "examples/chebyshevpoly-modern.csd"
    ```

=== "Classic"
    Here is an example of the chebyshevpoly opcode. It uses the file [chebyshevpoly.csd](../examples/chebyshevpoly.csd).
    ``` csound-csd title="Example of the chebyshevpoly opcode." linenums="1"
    --8<-- "examples/chebyshevpoly.csd"
    ```

## See also

[Waveshaping](../sigmod/wavshape.md)

[Opcode Equivalents of Functions](../math/opeqfunc.md)

## Credits

Author: Anthony Kozar<br>
January 2008<br>

New in Csound version 5.08
