<!--
id:zfilter2
category:Signal Modifiers:Specialized Filters
-->
# zfilter2
Performs filtering using a transposed form-II digital filter lattice with radial pole-shearing and angular pole-warping.

General purpose custom filter with time-varying pole control. The filter coefficients implement the following difference equation:

$$
(1) y(n) = b_0 x[n] + b_1 x[n-1] + ... + b_M x[n-M] - a_1 y[n-1] - ... - a_N y[n-N]
$$

the system function for which is represented by:

$$
H(z) = \frac{B(z)}{A(z)} = \frac{b_0 + b_1 z^{-1} + ... + b_M z^{-M}}{1 + a_1 z^{-1} + ... + a_N z^{-N}}
$$

## Syntax
=== "Modern"
    ``` csound-orc
    ares = zfilter2(asig, kdamp, kfreq, iM, iN, ib0, ib1, ..., ibM, ia1,ia2, ..., iaN)
    ```

=== "Classic"
    ``` csound-orc
    ares zfilter2 asig, kdamp, kfreq, iM, iN, ib0, ib1, ..., ibM, ia1,ia2, ..., iaN
    ```

### Initialization

At initialization the number of zeros and poles of the filter are specified along with the corresponding zero and pole coefficients. The coefficients must be obtained by an external filter-design application such as Matlab or Octave (GPL) and specified directly or loaded into a table via [GEN01](../scoregens/gen01.md). With _zfilter2_, the roots of the characteristic polynomials are solved at initialization so that the pole-control operations can be implemented efficiently.

### Performance

The [filter2](../opcodes/filter2.md) opcodes perform filtering using a transposed form-II digital filter lattice with no time-varying control. _zfilter2_ uses the additional operations of radial pole-shearing and angular pole-warping in the Z plane.

Pole shearing increases the magnitude of poles along radial lines in the Z-plane. This has the affect of altering filter ring times. The k-rate variable _kdamp_ is the damping parameter. Positive values (0.01 to 0.99) increase the ring-time of the filter (hi-Q), negative values (-0.01 to -0.99) decrease the ring-time of the filter, (lo-Q).

Pole warping changes the frequency of poles by moving them along angular paths in the Z plane. This operation leaves the shape of the magnitude response unchanged but alters the frequencies by a constant factor (preserving 0 and p). The k-rate variable _kfreq_ determines the frequency warp factor. Positive values (0.01 to 0.99) increase frequencies toward p and negative values (-0.01 to -0.99) decrease frequencies toward 0.

Since _filter2_ implements generalized recursive filters, it can be used to specify a large range of general DSP algorithms. For example, a digital waveguide can be implemented for musical instrument modeling using a pair of [delayr](../opcodes/delayr.md) and [delayw](../opcodes/delayw.md) opcodes in conjunction with the _filter2_ opcode.

## Examples

A controllable second-order IIR filter operating on an a-rate signal:

``` csound-orc
a1 zfilter2 asig, kdamp, kfreq, 1, 2, 1, ia1, ia2 ;; controllable a-rate IIR filter
```

Here is an example of the zfilter2 opcode. It uses the files [zfilter2.csd](../examples/zfilter2.csd).

``` csound-csd title="Example of the zfilter2 opcode." linenums="1"
--8<-- "examples/zfilter2.csd"
```

## See also

[Specialized Filters: Other filters](../sigmod/speciali.md)

## Credits

Author: Michael A. Casey<br>
M.I.T.<br>
Cambridge, Mass.<br>
1997<br>

New in Version 3.47
