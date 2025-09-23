<!--
id:port
category:Signal Modifiers:Standard Filters:Control
-->
# port
Applies portamento to a step-valued control signal.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = port(ksig, ihtim [, isig])
    ```

=== "Classic"
    ``` csound-orc
    kres port ksig, ihtim [, isig]
    ```

### Initialization

_ihtim_ -- half-time of the function, in seconds.

_isig_
(optional, default=0) -- initial (i.e. previous) value for internal feedback. The default value is 0. Negative value will cause initialization to be skipped and last value from previous instance to be used as initial value for note.

### Performance

_kres_ -- the output signal at control-rate.

_ksig_ -- the input signal at control-rate.

_port_ applies portamento to a step-valued control signal. At each new step value, _ksig_ is low-pass filtered to move towards that value at a rate determined by _ihtim_. _ihtim_ is the &#8220;half-time&#8221; of the function (in seconds), during which the curve will traverse half the distance towards the new value, then half as much again, etc., theoretically never reaching its asymptote. With [portk](../opcodes/portk.md), the half-time can be varied at the control rate.

## Examples

Here is an example of the port opcode. It uses the file [port.csd](../examples/port.csd).

``` csound-csd title="Example of the port opcode." linenums="1"
--8<-- "examples/port.csd"
```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)
