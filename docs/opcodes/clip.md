<!--
id:clip
category:Signal Modifiers:Amplitude Modifiers
-->
# clip
Clips an a-rate signal to a given limit, in a &#8220;soft&#8221; manner, using one of three methods.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = clip(asig, imeth, ilimit [, iarg])
    ares = clip(asig, kmeth, klimit [, karg])
    ```

=== "Classic"
    ``` csound-orc
    ares clip asig, imeth, ilimit [, iarg]
    ares clip asig, kmeth, klimit [, karg]
    ```

### Performance

_asig_ -- a-rate input signal

_kmeth_ / _imeth_ -- selects the clipping method. This argument is required. The methods are:

*  0 = Bram de Jong method
*  1 = sine clipping
*  2 = tanh clipping

Other method codes use method 0.

_klimit_ / _ilimit_ -- a finite, non-negative clipping limit. A limit of 0 produces silence.

_karg_ / _iarg_ (optional, default=0.5) -- for method 0, the fraction of _klimit_ at which soft 
clipping starts. Use a value from 0 to 1. A value of 1 gives hard clipping at _klimit_. Methods 
1 and 2 ignore this argument.

All three arguments are k-rate, so they can change at each control cycle. They may also be given 
as i-rate values.

For a positive _klimit_, the curves below use _L_ for _klimit_ and _x_ for the input sample.

The Bram de Jong method (_kmeth_ = 0) uses _a_ for _karg_ and _u_ for the input magnitude, $u = |x|$:

$$
u \le La: \quad f(x) = x
$$

$$
La < u \le L: \quad f(x) = \operatorname{sign}(x)
\left(La + \frac{u-La}{1 + \left(\frac{u-La}{L(1-a)}\right)^2}\right)
$$

$$
u > L: \quad f(x) = \operatorname{sign}(x)\frac{L(1+a)}{2}
$$

The curved segment is empty when _a_ = 1. For smaller values of _a_, the output stops at $\pm L(1+a)/2$, below the clipping limit.

The second method (_kmeth_ = 1) is the sine clip:

$$
|x| < L: \quad f(x) = L\sin\left(\frac{\pi x}{2L}\right),
\qquad |x| \ge L: \quad f(x) = L\operatorname{sign}(x)
$$

The third method (_kmeth_ = 2) is the tanh clip:

$$
|x| < L: \quad f(x) = L\frac{\tanh(x/L)}{\tanh(1)},
\qquad |x| \ge L: \quad f(x) = L\operatorname{sign}(x)
$$

## Examples

=== "Modern"
    Here is an example of the clip opcode. It uses the file [clip-modern.csd](../examples/clip-modern.csd).

    ``` csound-csd title="Example of the clip opcode." linenums="1"
    --8<-- "examples/clip-modern.csd"
    ```

=== "Classic"
    Here is an example of the clip opcode. It uses the file [clip.csd](../examples/clip.csd).

    ``` csound-csd title="Example of the clip opcode." linenums="1"
    --8<-- "examples/clip.csd"
    ```

## See also

[Amplitude Modifiers and Dynamic processing](../sigmod/ampmod.md)

[Waveshaping](../sigmod/wavshape.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>
August, 2000<br>

New in Csound version 4.07

September 2009: Thanks to a note from Paolo Dell'Osso, corrected the formula.
November 2026 (csound 7): The method, limit and shape arguments are k-rate, de Jong method heavily optimized (Eduardo Moguillansky)
