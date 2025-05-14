<!--
id:clip
category:Signal Modifiers:Amplitude Modifiers
-->
# clip
Clips an a-rate signal to a predefined limit, in a &#8220;soft&#8221; manner, using one of three methods.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = clip(asig, imeth, ilimit [, iarg])
    ```

=== "Classic"
    ``` csound-orc
    ares clip asig, imeth, ilimit [, iarg]
    ```

### Initialization

_imeth_ -- selects the clipping method. The default is 0. The methods are:

*  0 = Bram de Jong method (default)
*  1 = sine clipping
*  2 = tanh clipping

_ilimit_ -- limiting value

_iarg_ (optional, default=0.5) -- when _imeth_ = 0, indicates the point at which clipping starts, in the range 0 - 1. Not used when _imeth_ = 1 or _imeth_ = 2. Default is 0.5.

### Performance

_asig_ -- a-rate input signal

The Bram de Jong method (_imeth_ = 0) applies the algorithm (denoting _ilimit_ as _limit_ and _iarg_ as _a_):

$$
|x| \ge 0 \: \mathrm{and} \: |x| \le (limit \times a):  f(x) = f(x)
$$

$$
|x| \gt (limit \times a) \: \mathrm{and} \: |x| \le limit:  f(x) = sign(x) \times (limit \times a+ \frac{x - limit \times a}{1 + ((x-limit \times a)/(limit \times (1-a)))^2})
$$

$$
|x| \gt limit:  f(x) = sign(x) \times \frac{(limit\times(1+a))}{2}
$$

The second method (_imeth_ = 1) is the sine clip:

$$
|x| \lt limit:  f(x) = limit \times sin(\pi x/(2 \times limit)), \;  |x| \ge limit:  f(x) = limit \times sign(x)
$$

The third method (_imeth = 2_) is the tanh clip:

$$
|x| \lt limit:  f(x) = limit \times tanh(x/limit)/tanh(1), \;  |x| \ge limit:  f(x) = limit \times sign(x)
$$

> :memo: **Note**
>
> Method 1 appears to be non-functional at release of Csound version 4.07.

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
