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

_iskip_ (optional) -- initial disposition of internal save space (see [reson](../opcodes/reson.md)). The default value is 0.

### Performance

[integ](../opcodes/integ.md) and _diff_ perform integration and differentiation on an input control signal or audio signal. Each is the converse of the other, and applying both will reconstruct the original signal. Since these units are special cases of low-pass and high-pass filters, they produce a scaled (and phase shifted) output that is frequency-dependent. Thus _diff_ of a sine produces a cosine, with amplitude 2 * _pi_ * Hz / _sr_ that of the original (for each component partial); _integ_ will inversely affect the magnitudes of its component inputs. With this understanding, these units can provide useful signal modification.

## Examples

Here is an example of the diff opcode. It uses the file [diff.csd](../examples/diff.csd).

``` csound-csd title="Example of the diff opcode." linenums="1"
--8<-- "examples/diff.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)
