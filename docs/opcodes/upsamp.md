<!--
id:upsamp
category:Signal Modifiers:Sample Level Operators
-->
# upsamp
Modify a signal by up-sampling.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = upsamp(ksig)
    ```

=== "Classic"
    ``` csound-orc
    ares upsamp ksig
    ```

### Performance

_upsamp_ converts a control signal to an audio signal. It does it by simple repetition of the kval. _upsamp_ is a slightly more efficient form of the assignment, _asig_ = _ksig_.

## Examples

Here is an example of the upsamp opcode. It uses the file [upsamp.csd](../examples/upsamp.csd).

``` csound-csd title="Example of the upsamp opcode." linenums="1"
--8<-- "examples/upsamp.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)
