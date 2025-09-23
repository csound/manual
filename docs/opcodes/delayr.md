<!--
id:delayr
category:Signal Modifiers:Delay
-->
# delayr
Reads from an automatically established digital delay line.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = delayr(idlt [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares delayr idlt [, iskip]
    ```

### Initialization

_idlt_ -- requested delay time in seconds. This can be as large as available memory will permit. The space required for n seconds of delay is 4n * _sr_ bytes. It is allocated at the time the instrument is first initialized, and returned to the pool at the end of a score section.

_iskip_ (optional, default=0) -- initial disposition of delay-loop data space (see [reson](../opcodes/reson.md)). The default value is 0.

### Performance

_delayr_ reads from an automatically established digital delay line, in which the signal retrieved has been resident for _idlt_ seconds. This unit must be paired with and precede an accompanying [delayw](../opcodes/delayw.md) unit. Any other Csound statements can intervene.

## Examples

Here is an example of the delayr opcode. It uses the file [delayr.csd](../examples/delayr.csd).

``` csound-csd title="Example of the delayr opcode." linenums="1"
--8<-- "examples/delayr.csd"
```

## See also

[Delay](../sigmod/delayops.md)
