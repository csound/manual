<!--
id:rspline
category:Signal Generators:Random (Noise) Generators
-->
# rspline
Generate random spline curves.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = rspline(xrangeMin, xrangeMax, kcpsMin, kcpsMax)
    kres = rspline(krangeMin, krangeMax, kcpsMin, kcpsMax)
    ```

=== "Classic"
    ``` csound-orc
    ares rspline xrangeMin, xrangeMax, kcpsMin, kcpsMax
    kres rspline krangeMin, krangeMax, kcpsMin, kcpsMax
    ```

### Performance

_kres, ares_ -- Output signal

_xrangeMin, xrangeMax_ -- Range of values of random-generated points

_kcpsMin, kcpsMax_ -- Range of point-generation rate. Min and max limits are expressed in cps.

_rspline_ (random-spline-curve generator) is similar to [jspline](../opcodes/jspline.md) but output range is defined by means of two limit values. Also in this case, real output range could be a bit greater of range values, because of interpolating curves beetween each pair of random-points.

At present time generated curves are quite smooth when _cpsMin_ is not too different from _cpsMax_. When _cpsMin-cpsMax_ interval is big, some little discontinuity could occurr, but it should not be a problem, in most cases. Maybe the algorithm will be improved in next versions.

These opcodes are often better than [jitter](../opcodes/jitter.md) when user wants to &#8220;naturalize&#8221; or &#8220;analogize&#8221; digital sounds. They could be used also in algorithmic composition, to generate smooth random melodic lines when used together with [samphold](../opcodes/samphold.md) opcode.

Note that the result is quite different from the one obtained by filtering white noise, and they allow the user to obtain a much more precise control.

## Examples

Here is an example of the rspline opcode. It uses the file [rspline.csd](../examples/rspline.csd).

``` csound-orc title="Example of the rspline opcode." linenums="1"
--8<-- "examples/rspline.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: Gabriel Maldonado

New in version 4.15
