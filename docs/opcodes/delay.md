<!--
id:delay
category:Signal Modifiers:Delay
-->
# delay
Delays an input signal by some time interval.

A signal can be read from or written into a delay path, or it can be automatically delayed by some time interval.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = delay(asig, idlt [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares delay asig, idlt [, iskip]
    ```

### Initialization

_idlt_ -- requested delay time in seconds. This can be as large as available memory will permit. The space required for n seconds of delay is 4n * _sr_ bytes. It is allocated at the time the instrument is first initialized, and returned to the pool at the end of a score section.

_iskip_ (optional, default=0) -- initial disposition of delay-loop data space (see [reson](../opcodes/reson.md)). The default value is 0.

### Performance

_asig_ -- audio signal

_delay_ is a composite of [delayr](../opcodes/delayr.md) and [delayw](../opcodes/delayw.md), both reading from and writing into its own storage area. It can thus accomplish signal time-shift, although modified feedback is not possible. There is no minimum delay period.

## Examples

Here is an example of the delay opcode. It uses the file [delay.csd](../examples/delay.csd).

``` csound-csd title="Example of the delay opcode." linenums="1"
--8<-- "examples/delay.csd"
```

## See also

[Delay](../sigmod/delayops.md)
