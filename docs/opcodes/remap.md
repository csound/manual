<!--
id:remap
category:Signal Generators:Linear and Exponential Generators
-->
# remap

Maps a value through a curve defined by a table of breakpoints.

The breakpoints are given as two arrays of the same length, one with the x coordinates and one with the y coordinates. For each input value, `remap` finds the two breakpoints that bracket it and returns the matching y, interpolated in one of five ways: linear, nearest, previous, next, or a shape-preserving cubic. A separate setting decides what happens when the input falls outside the table.

The input can be a k-rate value, a k-rate array, or an audio signal. With an audio input, every sample goes through the curve, so `remap` works as a waveshaper with a transfer function drawn by the breakpoints.

## Syntax

=== "Modern"
    ``` csound-orc
    y:k = remap(x:k, xdata[], ydata[], mode:i, bounds:i [, fill:i])
    y:k[] = remap(x:k[], xdata[], ydata[], mode:i, bounds:i [, fill:i])
    y:a = remap(x:a, xdata[], ydata[], mode:i, bounds:i [, fill:i])
    ```

=== "Classic"
    ``` csound-orc
    ky remap kx, kxdata[], kydata[], imode, ibounds [, ifill]
    ky[] remap kx[], kxdata[], kydata[], imode, ibounds [, ifill]
    ay remap ax, kxdata[], kydata[], imode, ibounds [, ifill]
    ```

`xdata` and `ydata` may be i-rate or k-rate arrays, in any combination.

### Initialization

_mode_ -- how to interpolate between the two breakpoints that bracket the input:

* 0 = linear.
* 1 = nearest: the y of the closer breakpoint. When the input is exactly halfway, the left breakpoint wins.
* 2 = previous: the y of the breakpoint at or to the left of the input. This is a step function that changes on each breakpoint.
* 3 = next: the y of the first breakpoint to the right of the input. This is a step function, one breakpoint ahead of _previous_.
* 4 = cubic: a shape-preserving piecewise cubic (PCHIP, Fritsch-Carlson). The curve is smooth and passes through every breakpoint. Unlike a natural cubic spline, it does not overshoot: between two breakpoints the curve stays within their y values, so a monotonic table gives a monotonic curve and a flat segment stays flat.

_bounds_ -- what to do when the input is lower than the first x or higher than the last x:

* 0 = error: stop the instrument with a performance error.
* 1 = clamp: output the first or the last y.
* 2 = fill: output _fill_.
* 3 = extrapolate: continue the first or the last segment beyond the table. With _mode_ 0 the segment is a straight line, and with _mode_ 4 it is the cubic of the end segment. The step modes (1, 2 and 3) pick a y from the two breakpoints of the end segment: below the table, _nearest_ and _previous_ give the first y and _next_ gives the second; above it, _nearest_ and _next_ give the last y and _previous_ gives the one before.

_fill_ -- the value output when _bounds_ is 2. Defaults to 0. It is ignored for any other _bounds_ setting.

Any other value of _mode_ or _bounds_ causes an initialization error.

### Performance

_x_ -- the input: a k-rate value, a k-rate array, or an audio signal.

_xdata_ -- the x coordinates of the breakpoints. They must be strictly increasing.

_ydata_ -- the y coordinates of the breakpoints. They can take any values.

_y_ -- the output. For an array input, _y_ is an array of the same length as _x_, and each element is computed on its own, so _x_ does not need to be sorted. If _x_ changes length during performance, _y_ follows.

Both tables must hold at least two breakpoints and have the same length. A length mismatch causes a performance error. The lengths are checked at every call, since a global array can be resized by another instrument while the note runs.

When both tables are i-rate arrays, `remap` checks at initialization that _xdata_ is strictly increasing and reports an initialization error otherwise. k-rate tables can be rewritten at any control period, and `remap` uses the new values at once. They are not checked: keeping a k-rate _xdata_ strictly increasing is up to the orchestra, and an unsorted _xdata_ gives meaningless results.

The output array may also be one of the tables, for example `ydata = remap(x, xdata, ydata, 1, 1)`. Every element of the input is then mapped through the table as it was before the call.

`remap` has no i-rate version. Its output is first computed in the first control period, so an init-time read of a k-rate output gives 0.

> :memo: **Breakpoints and step modes**
>
> On a breakpoint, linear, nearest and cubic return the y of that breakpoint. _previous_ also returns it, except on the last breakpoint, where it returns the y of the one before. _next_ returns the y of the following breakpoint, except on the last one, where it returns its own y. With x = [0, 1, 3, 4] and y = [0, 2, 2, 6], an input of 4 gives 2 with _previous_ and 6 with _next_.

The search for the bracketing breakpoints takes the same time whatever the input, so an unsorted array costs the same as a ramp. In cubic mode, the coefficients of a segment are computed only when needed, without any extra memory, even when the breakpoints change at k-rate.

## Examples

### Modes and bounds

This example prints what each mode and each bounds policy returns for a few inputs. The flat middle segment shows that the cubic mode does not overshoot. It uses the file [remap.csd](../examples/remap.csd).

``` csound-csd title="Interpolation modes and out-of-bounds policies." linenums="1"
--8<-- "examples/remap.csd"
```

Its output is:

``` text
x           0.250  1.000  2.000  3.750
linear      0.500  2.000  2.000  5.000
nearest     0.000  2.000  2.000  6.000
previous    0.000  2.000  2.000  2.000
next        2.000  2.000  2.000  6.000
cubic       0.688  2.000  2.000  4.625

x                   -1.000    5.000
clamp                0.000    6.000
fill -100         -100.000 -100.000
extrapolate lin.    -2.000   10.000
extrapolate cub.    -0.667    7.333
```

### Scale quantizer

When the same array is used for _xdata_ and _ydata_, the nearest mode snaps any input to the closest value in the table. Here the table holds a pentatonic scale, and a single call with an array input quantizes a three-note random chord. It uses the file [remap-quantize.csd](../examples/remap-quantize.csd).

``` csound-csd title="Quantizing an array of random pitches to a scale." linenums="1"
--8<-- "examples/remap-quantize.csd"
```

### Waveshaper

With an audio input, the breakpoints draw a transfer curve. This one is a soft saturation that never goes above 0.8. The cubic mode rounds off the corners that the linear mode leaves at each breakpoint, which gives a smoother tone. It uses the file [remap-waveshaper.csd](../examples/remap-waveshaper.csd).

``` csound-csd title="Waveshaping a sine with a breakpoint transfer curve." linenums="1"
--8<-- "examples/remap-waveshaper.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

[bpf](bpf.md), [linlin](linlin.md), [tablei](tablei.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
