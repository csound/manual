<!--
id:lfsr
category:Signal Generators:Random (Noise) Generators
-->
# lfsr
Linear Feedback Shift Register (LFSR).

Output is a series of pseudo-random positive integers. This is the technique used in so-called "Turing machine" synth modules and is usually used to generate melodic sequences. This implementation is adapted from the firmware for the Ornament &amp; Crime module, as used in the Quantermain and Meta-Q apps.

## Syntax
=== "Modern"
    ``` csound-orc
    knum = lfsr(ilen, iprob [, iseed])
    ```

=== "Classic"
    ``` csound-orc
    knum lfsr ilen, iprob [, iseed]
    ```

### Initialization

_ilen_ -- length of shift register, valid values are 1-31 (inclusive). The larger the length, the larger the resulting integers in the output. You can use this to constrain the output to a suitable range.

_iprob_ -- probability, valid values 1-255 (inclusive). Controls the spread of the output; larger values result in a wider spread of values.

_iseed_ (optional, default -1) -- initial state of the shift register, as a pattern of bits. The value is treated as an unsigned integer, so the default of -1 is effectivly all bits on (0b11111111...).

### Performance

_knum_ -- integer output

## Examples

Here is an example of the lfsr opcode. It uses the file [lfsr.csd](../examples/lfsr.csd).

``` csound-orc title="Example of the lfsr opcode." linenums="1"
--8<-- "examples/lfsr.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

By: Dave Seidel 2020

Based on code by Patrick Dowling in the Ornament &amp; Crime firmware.

New in version 6.16
