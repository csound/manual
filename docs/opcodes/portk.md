<!--
id:portk
category:Signal Modifiers:Standard Filters:Control
-->
# portk
Applies portamento to a step-valued control signal.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = portk(ksig, khtim [, isig])
    ```

=== "Classic"
    ``` csound-orc
    kres portk ksig, khtim [, isig]
    ```

### Initialization

_isig_ (optional, default=0) -- initial (i.e. previous) value for internal feedback. The default value is 0.

### Performance

_kres_ -- the output signal at control-rate.

_ksig_ -- the input signal at control-rate.

_khtim_ -- half-time of the function in seconds.

_portk_ is like [port](../opcodes/port.md) except the half-time can be varied at the control rate.

## Examples

Here is an example of the portk opcode. It uses the file [portk.csd](../examples/portk.csd).

``` csound-csd title="Example of the portk opcode." linenums="1"
--8<-- "examples/portk.csd"
```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>
