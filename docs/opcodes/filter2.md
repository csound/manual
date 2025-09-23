<!--
id:filter2
category:Signal Modifiers:Specialized Filters
-->
# filter2
General purpose custom filter.

Performs filtering using a transposed form-II digital filter lattice with no time-varying control. The filter coefficients implement the following difference equation:

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
    ares = filter2(asig, ibcoefs, iacoefs, ib0, ib1, ..., ibM, ia1, ia2, ..., iaN)
    kres = filter2(ksig, ibcoefs, iacoefs, ib0, ib1, ..., ibM, ia1, ia2, ..., iaN)
    ```

=== "Classic"
    ``` csound-orc
    ares filter2 asig, ibcoefs, iacoefs, ib0, ib1, ..., ibM, ia1, ia2, ..., iaN
    kres filter2 ksig, ibcoefs, iacoefs, ib0, ib1, ..., ibM, ia1, ia2, ..., iaN
    ```

### Initialization

_ibcoefs_ -- number of feedforward coefficients including b0.

_iacoefs_ -- number of feedback coefficients

_ib0, ... ibM_ -- feedforward coefficients including b0.

_ia1, ... iaN_ -- feedback coefficients

At initialization the number of zeros and poles of the filter are specified along with the corresponding zero and pole coefficients. The coefficients must be obtained by an external filter-design application such as Matlab and specified directly or loaded into a table via [GEN01](../scoregens/gen01.md).

### Performance

The _filter2_ opcodes perform filtering using a transposed form-II digital filter lattice with no time-varying control.

Since _filter2_ implements generalized recursive filters, it can be used to specify a large range of general DSP algorithms. For example, a digital waveguide can be implemented for musical instrument modeling using a pair of [delayr](../opcodes/delayr.md) and [delayw](../opcodes/delayw.md) opcodes in conjunction with the _filter2_ opcode.

## Examples

A first-order linear-phase lowpass FIR filter operating on a k-rate signal:

``` csound-orc
k1 filter2 ksig, 2, 0, 0.5, 0.5   ;; k-rate FIR filter
```

Here is another example of the filter2 opcode. It uses the file [filter2.csd](../examples/filter2.csd).

``` csound-csd title="Example of the filter2 opcode." linenums="1"
--8<-- "examples/filter2.csd"
```

## See also

[Specialized Filters: Other filters](../sigmod/speciali.md)

## Credits

Author: Michael A. Casey<br>
M.I.T.<br>
Cambridge, Mass.<br>
1997<br>

New in version 3.47
