<!--
id:integ
category:Signal Modifiers:Sample Level Operators
-->
# integ
Modify a signal by integration.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = integ(asig [, iskip])
    kres = integ(ksig [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares integ asig [, iskip]
    kres integ ksig [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- zero clears the running sum at initialization. A non-zero value keeps the previous sum.

### Performance

_integ_ keeps a running sum. At audio rate, it adds each input sample and outputs the new total. At control rate, it does the same once per control cycle. It does not divide the input by _sr_ or _kr_, so a constant input produces a ramp whose slope depends on that rate.

Low-frequency signals receive more gain than high-frequency signals. Any DC component accumulates, so the output can keep growing.

_integ_ and [diff](../opcodes/diff.md) reverse each other's operations in exact arithmetic. Rounding can prevent exact reconstruction of the input.

## Examples

Here is an example of the integ opcode. It uses the file [integ.csd](../examples/integ.csd).

``` csound-csd title="Example of the integ opcode." linenums="1"
--8<-- "examples/integ.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)
