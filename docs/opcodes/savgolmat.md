<!--
id:savgolmat
category:Signal Modifiers:Specialized Filters
-->
# savgolmat

Returns the Savitzky-Golay filter coefficients as a 2-D array.

`savgolmat` computes the same coefficients that [savgol](savgol.md) uses, but returns them instead of filtering a signal. It gives all the derivatives at once, so the kernels can be inspected, plotted, or applied to data with other opcodes.

## Syntax

=== "Modern"
    ``` csound-orc
    imat[][] = savgolmat(iwinsize, iorder [, idelta])
    ```

=== "Classic"
    ``` csound-orc
    imat[][] savgolmat iwinsize, iorder [, idelta]
    ```

### Initialization

_iwinsize_ -- the number of samples in the window. It must be odd and at least 3.

_iorder_ -- the degree of the fitted polynomial, from 0 to _iwinsize_ - 1.

_idelta_ (optional, default 1) -- the spacing between two samples. Row _d_ of the result is scaled by 1 / _idelta_<sup>_d_</sup>, so with the default of 1 the derivatives are per sample. It must be greater than 0.

_imat_ -- an array of _iorder_ + 1 rows and _iwinsize_ columns. Row _d_ holds the coefficients that give the _d_-th derivative of the fitted polynomial at the centre of the window, already multiplied by _d_!. Row 0 is the smoothing kernel. The columns go from the oldest sample of the window to the newest.

The dot product of row _d_ with _iwinsize_ consecutive samples gives what `savgol` outputs with _ideriv_ = _d_ for that window. Even rows are symmetric and odd rows are antisymmetric.

Invalid values cause an initialization error.

## Examples

This example prints the kernels for a window of 5 samples and order 2. Row 0 is the classic [-3, 12, 17, 12, -3] / 35 smoothing kernel. It then applies each row to five samples of a parabola and recovers its value, slope and curvature at the centre. It uses the file [savgolmat.csd](../examples/savgolmat.csd).

``` csound-csd title="Printing and applying the Savitzky-Golay kernels." linenums="1"
--8<-- "examples/savgolmat.csd"
```

Its output is:

``` text
row 0: [ -3  12  17  12  -3] / 35
row 1: [ -2  -1   0   1   2] / 10
row 2: [  2  -1  -2  -1   2] / 7
derivative 0 at the centre: 9
derivative 1 at the centre: 6
derivative 2 at the centre: 2
```

## See also

[Specialized Filters](../sigmod/speciali.md)

[savgol](savgol.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
