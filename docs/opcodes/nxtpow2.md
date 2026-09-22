<!--
id:nxtpow2
category:Mathematical Operations:Mathematical Functions
-->
# nxtpow2
Returns a power of two at least as large as the integer part of its input, with a minimum result of 2.

Use `nxtpow2` when choosing a buffer or function-table size that must be a power of two. It returns a number and does not allocate storage.

## Syntax

=== "Modern"
    ``` csound-orc
    isize = nxtpow2(ivalue)
    ```

=== "Classic"
    ``` csound-orc
    isize nxtpow2 ivalue
    ```

### Initialization

`ivalue` is the number to convert. The opcode runs at initialization only.

`isize` is the smallest power of two that is at least 2 and at least the input's integer part. An exact power of two stays unchanged, except that 1 becomes 2.

The fractional part truncates toward zero before the calculation. For example, 8.9 becomes 8, so the result is 8. If the result must cover the full input value, use `nxtpow2(ceil(ivalue))`.

| Input | Result |
| --- | --- |
| -5.8 | 2 |
| 0 | 2 |
| 1 | 2 |
| 2 | 2 |
| 3 | 4 |
| 8 | 8 |
| 8.9 | 8 |
| 9 | 16 |
| 1500000000 | 2147483648 |

### Input limits

The input must be finite, at least -2147483648 and less than 2147483648. Values outside that range, infinity and NaN cause an initialization error. The range check happens before truncation.

The largest possible result is 2147483648, or 2 to the power of 31. That value is a valid result but is outside the input range. The minimum result is 2, including for valid negative inputs and zero.

Csound builds with 32-bit samples cannot represent every large integer. For example, 2147483647 rounds to 2147483648 and fails the input check in those builds. [floatsize](floatsize.md) reports the sample type's size in bytes.

A result within these limits may still exceed the size supported by a table, FFT or available memory. Check the requirements of the opcode that will use it.

## Examples

The example chooses a buffer size for a duration in seconds. It first rounds the sample count up with [ceil](ceil.md), then rounds to a power of two. At 48000 Hz, 0.1 seconds needs 4800 samples and uses an 8192-element buffer. A quarter of a second needs 12000 samples and uses 16384 elements.

It uses [nxtpow2.csd](../examples/nxtpow2.csd).

``` csound-csd title="Choose a buffer size from a duration" linenums="1"
--8<-- "examples/nxtpow2.csd"
```

## See also

[ceil](ceil.md), [int](int.md), [powoftwo](powoftwo.md), [ftgen](ftgen.md), [floatsize](floatsize.md), [Mathematical Functions](../math/mathfunc.md)

## Credits

Author Victor Lazzarini, 2016.

New in Csound 6.08.
