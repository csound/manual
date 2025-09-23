<!--
id:tonek
category:Signal Modifiers:Standard Filters:Control
-->
# tonek
A first-order recursive low-pass filter with variable frequency response.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = tonek(ksig, khp [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    kres tonek ksig, khp [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_kres_ -- the output signal at control-rate.

_ksig_ -- the input signal at control-rate.

_khp_ --  the response curve's half-power point, in Hertz. Half power is defined as peak power / root 2.

_tonek_ is like [tone](../opcodes/tone.md) except its output is at control-rate rather than audio rate.

## Examples

Here is an example of the tonek opcode. It uses the file [tonek.csd](../examples/tonek.csd).

``` csound-csd title="Example of the tonek opcode." linenums="1"
--8<-- "examples/tonek.csd"
```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>
