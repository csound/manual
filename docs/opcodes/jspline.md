<!--
id:jspline
category:Signal Generators:Random (Noise) Generators
-->
# jspline
A jitter-spline generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = jspline(xamp, kcpsMin, kcpsMax)
    kres = jspline(kamp, kcpsMin, kcpsMax)
    ```

=== "Classic"
    ``` csound-orc
    ares jspline xamp, kcpsMin, kcpsMax
    kres jspline kamp, kcpsMin, kcpsMax
    ```

### Performance

_kres, ares_ -- Output signal

_xamp_ -- Amplitude factor

_kcpsMin, kcpsMax_ -- Range of point-generation rate. Min and max limits are expressed in cps.

_jspline_ (jitter-spline generator) generates a smooth curve based on random points generated at [_cpsMin_, _cpsMax_] rate.  This opcode is similar to [randomi](../opcodes/randomi.md) or [randi](../opcodes/randi.md) or [jitter](../opcodes/jitter.md), but segments are not straight lines, but cubic spline curves. Output value range is approximately &gt; -_xamp_ and &lt; _xamp_. Actually, real range could be a bit greater, because of interpolating curves beetween each pair of random-points.

At present time generated curves are quite smooth when _cpsMin_ is not too different from _cpsMax_. When _cpsMin_-_cpsMax_ interval is big, some little discontinuity could occurr, but it should not be a problem, in most cases. Maybe the algorithm will be improved in next versions.

These opcodes are often better than [jitter](../opcodes/jitter.md) when user wants to &#8220;naturalize&#8221; or &#8220;analogize&#8221; digital sounds. They could be used also in algorithmic composition, to generate smooth random melodic lines when used together with [samphold](../opcodes/samphold.md) opcode.

Note that the result is quite different from the one obtained by filtering white noise, and they allow the user to obtain a much more precise control.

## Examples

Here is an example of the jspline opcode. It uses the file [jspline.csd](../examples/jspline.csd).

``` csound-orc title="Example of the jspline opcode." linenums="1"
--8<-- "examples/jspline.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: Gabriel Maldonado

New in Version 4.15
