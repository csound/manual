<!--
id:pan2
category:Signal Modifiers:Panning and Spatialization
-->
# pan2
Distribute an audio signal across two channels with a choice of methods.

## Syntax
=== "Modern"
    ``` csound-orc
    a1, a2 = pan2(asig, xp [, imode])
    aouts[] = pan2(asig, xp [, imode])
    ```

=== "Classic"
    ``` csound-orc
    a1, a2 pan2 asig, xp [, imode]
    aouts[] pan2 asig, xs [, imode]
    ```

### Initialization

_imode_ (optional) -- mode of the stereo positioning algorithm. 0 signifies equal power (harmonic) panning, 1 means the square root method, 2 means simple linear and 3 means an alternative equal-power pan (based on an UDO). The default value is 0.

### Performance

_pan2_ takes an input signal _asig_ and distributes it across two outputs (essentially stereo speakers) according to the control _xp_ which can be k- or a-rate. A zero value for _xp_ indicates hard left, and a 1 is hard right.

## Examples

Here is an example of the pan2 opcodes. It uses the file [pan2.csd](../examples/pan2.csd).

``` csound-csd title="Example of the pan2 opcodes." linenums="1"
--8<-- "examples/pan2.csd"
```

## See also

[Panning and Spatialization: Amplitude spatialization](../sigmod/panspatl.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>
September 2007<br>
Array version: 2025<br>

New in version 5.07
