<!--
id:powershape
category:Signal Modifiers:Waveshaping
-->
# powershape
Waveshapes a signal by raising it to a variable exponent.

The _powershape_ opcode raises an input signal to a power with pre- and post-scaling of the signal so that the output will be in a predictable range.  It also processes negative inputs in a symmetrical way to positive inputs, calculating a dynamic transfer function that is useful for waveshaping.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = powershape(ain, kShapeAmount [, ifullscale])
    ```

=== "Classic"
    ``` csound-orc
    aout powershape ain, kShapeAmount [, ifullscale]
    ```

### Initialization

_ifullscale_ -- optional parameter specifying the range of input values from -_ifullscale_ to _ifullscale_.  Defaults to 1.0 -- you should set this parameter to the maximum expected input value.

### Performance

_ain_ --  the input signal to be shaped.

_aout_ --  the output signal.

_kShapeAmount_ --  the amount of the shaping effect applied to the input; equal to the power that the input signal is raised.

The _powershape_ opcode is very similar to the _pow_ unit generators for calculating the mathematical "power of" operation.  However, it introduces a couple of twists that can make it much more useful for waveshaping audio-rate signals.  The _kShapeAmount_ parameter is the exponent to which the input signal is raised.

To avoid discontinuities, the _powershape_ opcode treats all input values as positive (by taking their absolute value) but preserves their original sign in the output signal.  This allows for smooth shaping of any input signal while varying the exponent over any range.  (_powershape_ also (hopefully) deals intelligently with  discontinuities that could arise when the exponent and input are both zero.  Note though that negative exponents will usually cause the signal to exceed the maximum amplitude specified by the ifullscale parameter and should normally be avoided).

The other adaptation involves the _ifullscale_ parameter.  The input signal is divided by _ifullscale_ before being raised to _kShapeAmount_ and then multiplied by _ifullscale_ before being output.  This normalizes the input signal to the interval [-1,1], guaranteeing that the output (before final scaling) will also be within this range for positive shaping amounts and providing a smoothly evolving transfer function while varying the amount of shaping.  Values of _kShapeAmount_ between (0,1) will make the signal more "convex" while values greater than 1 will make it more "concave". A value of exactly 1.0 will produce no change in the input signal.

## Examples

Here is an example of the powershape opcode. It uses the file [powershape.csd](../examples/powershape.csd).

``` csound-csd title="Example of the powershape opcode." linenums="1"
--8<-- "examples/powershape.csd"
```

## See also

[pow](../opcodes/pow.md), [powoftwo](../opcodes/powoftwo.md)

[Waveshaping](../sigmod/wavshape.md)

[Mathematical Functions](../math/mathfunc.md)

## Credits

Author: Anthony Kozar<br>
January 2008<br>

New in Csound version 5.08
