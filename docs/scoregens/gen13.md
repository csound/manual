<!--
id:GEN13
category:
-->
# GEN13
Stores a polynomial whose coefficients derive from the Chebyshev polynomials of the first kind.

Uses Chebyshev coefficients to generate stored polynomial functions which, under waveshaping, can be used to split a sinusoid into harmonic partials having a pre-definable spectrum.

## Syntax
``` csound-orc
f # time size 13 xint xamp h0 h1 h2 ...
```

### Initialization

_size_ -- number of points in the table. Must be a power of 2 or a power-of-2 plus 1 (see [f statement](../scoregens/f.md)). The normal value is power-of-2 plus 1.

_xint_ -- provides the left and right values [_-xint, +xint_] of the x interval over which the polynomial is to be drawn. These subroutines both call [GEN03](../scoregens/gen03.md) to draw their functions; the p5 value here is therefor expanded to a negative-positive p5, p6 pair before _GEN03_ is actually called. The normal value is 1.

_xamp_ -- amplitude scaling factor of the sinusoid input that is expected to produce the following spectrum.

_h0, h1, h2,_ etc. -- relative strength of partials 0 (DC), 1 (fundamental), 2 ... that will result when a sinusoid of amplitude

```
xamp * int(size/2)/xint
```

is waveshaped using this function table. These values thus describe a frequency spectrum associated with a particular factor _xamp_ of the input signal.

_GEN13_ is the function generator normally employed in standard waveshaping. It stores a polynomial whose coefficients derive from the Chebyshev polynomials of the first kind, so that a driving sinusoid of strength _xamp_ will exhibit the specified spectrum at output. Note that the evolution of this spectrum is generally not linear with varying _xamp_. However, it is bandlimited (the only partials to appear will be those specified at generation time); and the partials will tend to occur and to develop in ascending order (the lower partials dominating at low _xamp_, and the spectral richness increasing for higher values of _xamp_). A negative _hn_ value implies a 180 degree phase shift of that partial; the requested full-amplitude spectrum will not be affected by this shift, although the evolution of several of its component partials may be. The pattern +,+,-,-,+,+,... for _h0,h1,h2.._. will minimize the normalization problem for low _xamp_ values (see above), but does not necessarily provide the smoothest pattern of evolution.

## Examples

Here is an example of the GEN13 generator. It uses the file [gen13.csd](../examples/gen13.csd).

``` csound-csd title="Example of the GEN13 generator." linenums="1"
--8<-- "examples/gen13.csd"
```

These are the diagrams of the waveforms of the GEN13 routines, as used in the example:

<figure markdown="span">
![f1 0 513 13 1 1 0 100 -50 -33 25 20 -16.7 -14.2 12.5 11.1 -10 -9.09 8.333 7.69 -7.14 -6.67 6.25 5.88 -5.55 -5.26 5 -  quasi sawtooth transfer function](../images/gen13_1.png)
<figcaption>f1 0 513 13 1 1 0 100 -50 -33 25 20 -16.7 -14.2 12.5 11.1 -10 -9.09 8.333 7.69 -7.14 -6.67 6.25 5.88 -5.55 -5.26 5 -  quasi sawtooth transfer function</figcaption>
</figure>

<figure markdown="span">
![f3 0 513 13 1 1 0 100 0 -33 0 20 0 -14.2 0 11.1 0 -9.09 0 7.69 0 -6.67 0 5.88 0 -5.26 - quasi square wave transfer function](../images/gen13_2.png)
<figcaption>f3 0 513 13 1 1 0 100 0 -33 0 20 0 -14.2 0 11.1 0 -9.09 0 7.69 0 -6.67 0 5.88 0 -5.26 - quasi square wave transfer function</figcaption>
</figure>

<figure markdown="span">
![f5 0 513 13 1 1 0 100 0 -11.11 0 4 0 -2.04 0 1.23 0 -.826 0 .59 0 -.444 0 .346 0 -.277 - quasi triangle wave transfer function](../images/gen13_3.png)
<figcaption>f5 0 513 13 1 1 0 100 0 -11.11 0 4 0 -2.04 0 1.23 0 -.826 0 .59 0 -.444 0 .346 0 -.277 - quasi triangle wave transfer function</figcaption>
</figure>

<figure markdown="span">
![f7 0 513 13 1 1 0 1 -.8 0 .6 0 0 0 .4 0 0 0 0 .1 -.2 -.3 .5 - transfer function 1](../images/gen13_4.png)
<figcaption>f7 0 513 13 1 1 0 1 -.8 0 .6 0 0 0 .4 0 0 0 0 .1 -.2 -.3 .5 - transfer function 1</figcaption>
</figure>

<figure markdown="span">
![f9 0 513 13 1 1 0 0 0 -.1 0 .3 0 -.5 0 .7 0 -.9 0 1 0 -1 0 - transfer function 2](../images/gen13_5.png)
<figcaption>f9 0 513 13 1 1 0 0 0 -.1 0 .3 0 -.5 0 .7 0 -.9 0 1 0 -1 0 - transfer function 2</figcaption>
</figure>

<figure markdown="span">
![f11 0 513 13 1 1 0 0 0 0 0 0 0 -1 0 1 0 0 -.1 0 .1 0 -.2 .3 0 -.7 0 .2 0 -.1  - transfer function 3](../images/gen13_6.png)
<figcaption>f11 0 513 13 1 1 0 0 0 0 0 0 0 -1 0 1 0 0 -.1 0 .1 0 -.2 .3 0 -.7 0 .2 0 -.1  - transfer function 3</figcaption>
</figure>

<figure markdown="span">
![f13 0 513 13 1 1 0 5 0 3 0 1 - split a sinusoid into 3 odd-harmonic partials of relative strength 5:3:1](../images/gen13_7.png)
<figcaption>f13 0 513 13 1 1 0 5 0 3 0 1 - split a sinusoid into 3 odd-harmonic partials of relative strength 5:3:1</figcaption>
</figure>

## See Also

[GEN03](../scoregens/gen03.md), [GEN14](../scoregens/gen14.md), and [GEN15](../scoregens/gen15.md).

Information about the Chebyshev polynomials on Wikipedia: [http://en.wikipedia.org/wiki/Chebyshev_polynomials](http://en.wikipedia.org/wiki/Chebyshev_polynomials)
