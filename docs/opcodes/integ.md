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

_iskip_ (optional) -- initial disposition of internal save space (see [reson](../opcodes/reson.md)). The default value is 0.

### Performance

_integ_ and [diff](../opcodes/diff.md) perform integration and differentiation on an input control signal or audio signal. Each is the converse of the other, and applying both will reconstruct the original signal. Since these units are special cases of low-pass and high-pass filters, they produce a scaled (and phase shifted) output that is frequency-dependent. Thus _diff_ of a sine produces a cosine, with amplitude 2 * _pi_ * Hz / _sr_ that of the original (for each component partial); _integ_ will inversely affect the magnitudes of its component inputs. With this understanding, these units can provide useful signal modification.

## Examples

Here is an example of the integ opcode. It uses the file [integ.csd](../examples/integ.csd).

``` csound-csd title="Example of the integ opcode." linenums="1"
--8<-- "examples/integ.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)
