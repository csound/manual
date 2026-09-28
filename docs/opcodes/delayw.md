<!--
id:delayw
category:Signal Modifiers:Delay
-->
# delayw
Writes the audio signal to a digital delay line.

## Syntax
=== "Modern"
    ``` csound-orc
    delayw(asig)
    ```

=== "Classic"
    ``` csound-orc
    delayw asig
    ```

### Performance

When several _delayr_ units precede the writers, each _delayw_ pairs at initialization with the oldest reader that still needs a writer. The optional index returned by _delayr_ selects delay taps and does not change this pairing. See the [indexed delay example](delayr.md#selecting-a-delay-line).

_delayw_ writes _asig_ into the delay area established by the preceding [delayr](../opcodes/delayr.md) unit. Viewed as a pair, these two units permit the formation of modified feedback loops, etc. However, there is a lower bound on the value of _idlt_, which must be at least 1 control period (or 1/_kr_).

## Examples

Here is an example of the delayw opcode. It uses the file [delayw.csd](../examples/delayw.csd).

``` csound-csd title="Example of the delayw opcode." linenums="1"
--8<-- "examples/delayw.csd"
```

## See also

[Delay](../sigmod/delayops.md)
