<!--
id:distort
category:Signal Modifiers:Special Effects
-->
# distort
Distort an audio signal via waveshaping and optional clipping.

## Syntax
=== "Modern"
    ``` csound-orc
    ar = distort(asig, kdist, ifn[, ihp, istor])
    ```

=== "Classic"
    ``` csound-orc
    ar distort asig, kdist, ifn[, ihp, istor]
    ```

### Initialization

_ifn_ -- table number of a waveshaping function with extended guard point.  The function can be of any shape, but it should pass through 0 with positive slope at the table mid-point.  The table size need not be large, since it is read with interpolation.

_ihp_ -- (optional) half-power frequency in Hz of the RMS detector's low-pass filter. Lower values make the level estimate change more slowly during waveshaping. Zero holds the detector's current level. The default is 10.

_istor_ -- (optional) zero resets the stored RMS level and scale factor. A nonzero value preserves them during reinitialization. The first use initializes the state either way. The default is 0.

### Performance

_asig_ -- Audio signal to be processed

_kdist_ -- amount of distortion, usually between 0 and 1. Values below 0.001 use 0.001.

The opcode uses the running RMS level and _kdist_ to scale the input before reading the waveshaping table. It applies the inverse scale to the table output. The scale factor changes smoothly over each control block. The RMS estimate has a minimum of `0dbfs / 32768` to avoid division by zero at silence.

The amount of distortion depends on the nature of the shaping function and on the value of _kdist_, which generally ranges from 0 to 1. For low values of _kdist_, we should like the shaping function to pass the signal almost unchanged.  This will be the case if, at the mid-point of the table, the shaping function is near-linear and is passing through 0 with positive slope.  A line function from  -1 to +1 will satisfy this requirement;  so too will a sigmoid (sinusoid from 270 to 90 degrees).  As _kdist_ is increased, the compressed signal is expanded to encounter more and more of the shaping function, and if this becomes non-linear the signal is increasingly _bent_ on read-through to cause distortion.

When _kdist_ becomes large enough, the read-through process will eventually hit the outer limits of the table.  The table is not read with wrap-around, but will &#8220;stick&#8221; at the end-points as the incoming signal exceeds them;  this introduces clipping, an additional form of signal distortion.  The point at which clipping begins will depend on the complexity (rms-to-peak value) of the input signal.  For a pure sinusoid, clipping will begin only as _kdist_ exceeds 0.7;  for a more complex input, clipping might begin at a _kdist_ of 0.5 or much less.  _kdist_ can exceed the clip point by any amount, and may be greater than 1.

The shaping function can be made arbitrarily complex for extra effect. It should generally be continuous, though this is not a requirement.  It should also be well-behaved near the mid-point, and roughly balanced positive-negative overall, else some excessive DC offset may result.  The user might experiment with more aggressive functions to suit the  purpose.  A generally positive slope allows the distorted signal to be mixed with the source without phase cancellation.

_distort_ is useful as an effects process, and is usually combined with reverb and chorusing on effects busses.  However, it can alternatively be used to good effect within a single instrument.

## Examples

Here is an example of the distort opcode. It uses the file [distort.csd](../examples/distort.csd).

``` csound-csd title="Example of the distort opcode." linenums="1"
--8<-- "examples/distort.csd"
```

## See also

[Special Effects](../sigmod/speciale.md)

[Waveshaping](../sigmod/wavshape.md)

## Credits

Written by Barry L. Vercoe for Extended Csound and released in Csound5.
