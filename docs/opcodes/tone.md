<!--
id:tone
category:Signal Modifiers:Standard Filters
-->
# tone
A first-order recursive low-pass filter with variable frequency response.

_tone_ is a 1 term IIR filter. Its formula is:

y<sub>n</sub> = c1 * x<sub>n</sub> + c2 * y<sub>n-1</sub>

where

*  b  = 2 - cos(2 &pi; hp/sr);
*  c2 = b - sqrt(b<sup>2</sup> - 1.0)
*  c1 = 1 - c2

## Syntax
=== "Modern"
    ``` csound-orc
    ares = tone(asig, khp [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares tone asig, khp [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ares_ -- the output audio signal.

_asig_ -- the input audio signal.

_khp_ --  the response curve's half-power point, in Hertz. Half power is defined as peak power / root 2.

_tone_ implements a first-order recursive low-pass filter in which the variable _khp_ (in Hz) determines the response curve's half-power point. Half power is defined as peak power / root 2.

## Examples

Here is an example of the tone opcode. It uses the file [tone.csd](../examples/tone.csd).

``` csound-csd title="Example of the tone opcode." linenums="1"
--8<-- "examples/tone.csd"
```

## See also

[Standard filters: Low-pass filters](../sigmod/standard.md)
