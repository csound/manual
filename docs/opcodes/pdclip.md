<!--
id:pdclip
category:Signal Modifiers:Waveshaping
-->
# pdclip
Performs linear clipping on an audio signal or a phasor.

The _pdclip_ opcode allows a percentage of the input range of a signal to be clipped to fullscale. It is similar to simply multiplying the signal and limiting the range of the result, but _pdclip_ allows you to think about how much of the signal range is being distorted instead of the scalar factor and has a offset parameter for assymetric clipping of the signal range. _pdclip_ is also useful for remapping phasors for phase distortion synthesis.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = pdclip(ain, kWidth, kCenter [, ibipolar [, ifullscale]])
    ```

=== "Classic"
    ``` csound-orc
    aout pdclip ain, kWidth, kCenter [, ibipolar [, ifullscale]]
    ```

### Initialization

_ibipolar_ -- an optional parameter specifying either unipolar (0) or bipolar (1) mode.  Defaults to unipolar mode.

_ifullscale_ -- an optional parameter specifying the range of input and output values. The maximum will be _ifullscale_. The minimum depends on the mode of operation: zero for unipolar or -_ifullscale_ for bipolar.  Defaults to 1.0 -- you should set this parameter to the maximum expected input value.

### Performance

_ain_ --  the input signal to be clipped.

_aout_ --  the output signal.

_kWidth_ --  the percentage of the signal range that is clipped (must be between 0 and 1).

_kCenter_ --  an offset for shifting the unclipped window of the signal higher or lower in the range (essentially a DC offset).   Values should be in the range [-1, 1] with a value of zero representing no shift (regardless of whether bipolar or unipolar mode is used).

The _pdclip_ opcode performs linear clipping on the input signal ain. _kWidth_ specifies the percentage of the signal range that is clipped. The rest of the input range is mapped linearly from zero to ifullscale in unipolar mode and from -ifullscale to ifullscale in bipolar mode.  When _kCenter_ is zero, equal amounts of the top and bottom of the signal range are clipped.  A negative value shifts the unclipped range more towards the bottom of the input range and a positive value shifts it more towards the top.  ibipolar should be 1 for bipolar operation and 0 for unipolar mode.  The default is unipolar mode (ibipolar = 0).  ifullscale sets the maximum amplitude of the input and output signals (defaults to 1.0).

This amounts to waveshaping the input with the following transfer function (normalized to ifullscale=1.0 in bipolar mode):

```
        1|   _______      x-axis is input range, y-axis is output
         |  /
         | /              width of clipped region is 2*kWidth
-1       |/        1      width of unclipped region is 2*(1 - kWidth)
--------------------      kCenter shifts the unclipped region
        /|                 left or right (up to kWidth)
       / |
      /  |
------   |-1
```

Bipolar mode can be used for direct, linear distortion of an audio signal.  Alternatively, unipolar mode is useful for modifying the output of a phasor before it is used to index a function table, effectively making this a phase distortion technique.

## Examples

Here is an example of the pdclip opcode. It uses the file [pdclip.csd](../examples/pdclip.csd).

``` csound-csd title="Example of the pdclip opcode." linenums="1"
--8<-- "examples/pdclip.csd"
```

## See also

[Phase Distortion](../sigmod/wavshape.md)

## Credits

Author: Anthony Kozar<br>
January 2008<br>

New in Csound version 5.08
