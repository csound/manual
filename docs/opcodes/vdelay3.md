<!--
id:vdelay3
category:Signal Modifiers:Delay
-->
# vdelay3
A variable time delay with cubic interpolation.

_vdelay3_ is experimental. It is the same as [vdelay](../opcodes/vdelay.md) except that it uses cubic interpolation. (New in Version 3.50.)

## Syntax
=== "Modern"
    ``` csound-orc
    ares = vdelay3(asig, adel, imaxdel [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares vdelay3 asig, adel, imaxdel [, iskip]
    ```

### Initialization

_imaxdel_ -- Maximum value of delay in milliseconds. If _adel_ gains a value greater than _imaxdel_ it is folded around _imaxdel_. This should not happen.

_iskip_ (optional) -- Skip initialization if present and non-zero.

### Performance

With this unit generator it is possible to do Doppler effects or chorusing and flanging.

_asig_ -- Input signal.

_adel_ -- Current value of delay in milliseconds. Note that linear functions have no pitch change effects. Fast changing values of _adel_ will cause discontinuities in the waveform resulting noise.

## Examples

Here is an example of the vdelay3 opcode. It uses the file [vdelay3.csd](../examples/vdelay3.csd).

``` csound-csd title="Example of the vdelay3 opcode." linenums="1"
--8<-- "examples/vdelay3.csd"
```

Two important points here. First, the delay time must be always positive. And second, even though the delay time can be controlled in k-rate, it is not advised to do so, since sudden time changes will create clicks.

## See also

[Delay](../sigmod/delayops.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>
