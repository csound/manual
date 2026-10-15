<!--
id:savgol
category:Signal Modifiers:Specialized Filters
-->
# savgol

Savitzky-Golay smoothing and differentiation filter.

For each input sample, `savgol` fits a polynomial to the last _winsize_ samples by least squares and outputs the value of that polynomial at the centre of the window. It can also output a derivative of the polynomial instead of its value, which gives a smoothed slope or curvature of the signal.

Because the fit depends linearly on the samples, the whole operation is a fixed FIR filter. Its coefficients are computed once at initialization. Compared with an ordinary lowpass of similar bandwidth, a Savitzky-Golay filter keeps the height and width of peaks better. This makes it useful for envelopes, control signals and any material where the shape of a transient matters more than strong attenuation of high frequencies.

## Syntax

=== "Modern"
    ``` csound-orc
    ares = savgol(asig, iwinsize, iorder [, ideriv] [, idelta])
    kres = savgol(ksig, iwinsize, iorder [, ideriv] [, idelta])
    ```

=== "Classic"
    ``` csound-orc
    ares savgol asig, iwinsize, iorder [, ideriv] [, idelta]
    kres savgol ksig, iwinsize, iorder [, ideriv] [, idelta]
    ```

### Initialization

_iwinsize_ -- the number of samples in the window. It must be odd and at least 3. A longer window smooths more.

_iorder_ -- the degree of the fitted polynomial, from 0 to _iwinsize_ - 1. For the same window, a higher order follows the signal more closely and smooths less. Order 0 is a plain moving average. When smoothing, an odd order gives the same result as the even order below it: order 1 is also a moving average, and order 3 smooths exactly like order 2.

_ideriv_ (optional, default 0) -- which derivative of the fitted polynomial to output, from 0 to _iorder_. 0 smooths the signal, 1 outputs its slope, 2 its curvature, and so on.

_idelta_ (optional, default 1) -- the spacing between two input samples, which scales the derivatives. With the default of 1, derivatives are given per sample. To get them per second, use `1/sr` for an audio input or `1/kr` for a control input. It must be greater than 0 and has no effect when _ideriv_ is 0.

Invalid values cause an initialization error.

### Performance

_asig_, _ksig_ -- the input signal.

_ares_, _kres_ -- the filtered signal, or the requested derivative.

The output belongs to the centre of the window, so it lags the input by (_iwinsize_ - 1) / 2 samples at a-rate, or by the same number of control periods at k-rate. The window starts filled with zeros: the first _iwinsize_ - 1 outputs are the response to a signal that was silent before the note started.

Each output sample costs _iwinsize_ multiplications and additions.

The fit reproduces any polynomial up to degree _iorder_ exactly. The other side of this is a weak stopband: content near the Nyquist frequency is reduced, not removed. For example, with _iwinsize_ = 11 and _iorder_ = 2, a component at the Nyquist frequency keeps about 14% of its amplitude. If the stopband matters more than the shape of the signal, use a conventional lowpass filter.

To get the coefficients themselves, use [savgolmat](savgolmat.md).

## Examples

### Smoothing and slope of a control signal

The input is the parabola t² plus a small jitter that changes sign at every control period. With an order 2 fit, the slope comes out exact once the window is full, while the jitter in the smoothed value shrinks from 0.05 to about 0.007. Both outputs are five control periods late, so the expected values in parentheses are taken five control periods back. It uses the file [savgol.csd](../examples/savgol.csd).

``` csound-csd title="Smoothing a control signal and measuring its slope." linenums="1"
--8<-- "examples/savgol.csd"
```

Its output is:

``` text
t=0.01  in=-0.050  smooth= 0.004 ( 0.002)  slope=-0.227 (-0.080)
t=0.26  in= 0.118  smooth= 0.037 ( 0.044)  slope= 0.420 ( 0.420)
t=0.51  in= 0.210  smooth= 0.219 ( 0.212)  slope= 0.920 ( 0.920)
t=0.76  in= 0.628  smooth= 0.497 ( 0.504)  slope= 1.420 ( 1.420)
t=1.01  in= 0.970  smooth= 0.929 ( 0.922)  slope= 1.920 ( 1.920)
t=1.26  in= 1.638  smooth= 1.457 ( 1.464)  slope= 2.420 ( 2.420)
t=1.51  in= 2.230  smooth= 2.139 ( 2.132)  slope= 2.920 ( 2.920)
t=1.76  in= 3.148  smooth= 2.917 ( 2.924)  slope= 3.420 ( 3.420)
```

The first line is printed before the window is full, which is why it is off.

### Audio lowpass

A sawtooth is played through several combinations of window size and order. A longer window makes the sound darker, and a higher order with the same window makes it brighter. It uses the file [savgol-audio.csd](../examples/savgol-audio.csd).

``` csound-csd title="savgol on an audio signal with different windows and orders." linenums="1"
--8<-- "examples/savgol-audio.csd"
```

## See also

[Specialized Filters](../sigmod/speciali.md)

[savgolmat](savgolmat.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
