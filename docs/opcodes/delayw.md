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

_delayw_ writes _asig_ into the delay area established by the preceding [delayr](../opcodes/delayr.md) unit. Viewed as a pair, these two units permit the formation of modified feedback loops, etc. However, there is a lower bound on the value of _idlt_, which must be at least 1 control period (or 1/_kr_).

## Examples

Here is an example of the delayw opcode. It uses the file [delayw.csd](../examples/delayw.csd).

``` csound-csd title="Example of the delayw opcode." linenums="1"
--8<-- "examples/delayw.csd"
```

## See also

[Delay](../sigmod/delayops.md)
