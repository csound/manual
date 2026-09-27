<!--
id:diff
category:Signal Modifiers:Sample Level Operators
-->
# diff
Modify a signal by differentiation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = diff(asig [, iskip])
    kres = diff(ksig [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares diff asig [, iskip]
    kres diff ksig [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- zero clears the saved input at initialization. A non-zero value keeps the previous input.

### Performance

_diff_ subtracts the previous input from the current input. It does this once per audio sample or control cycle, and saves the current input for the next step. After a reset, the previous input is zero.

For a sine wave at frequency _f_, the amplitude gain is `2 * sin(pi * f / sr)` at audio rate, or `2 * sin(pi * f / kr)` at control rate. The approximation `2 * pi * f / sr` applies only at frequencies much lower than _sr_; use _kr_ for the control-rate form.

[integ](../opcodes/integ.md) and _diff_ reverse each other's operations in exact arithmetic. Rounding can prevent exact reconstruction of the input.

## Examples

Here is an example of the diff opcode. It uses the file [diff.csd](../examples/diff.csd).

``` csound-csd title="Example of the diff opcode." linenums="1"
--8<-- "examples/diff.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)
