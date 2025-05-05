<!--
id:slider64f
category:Real-time MIDI:Slider Banks
-->
# slider64f
Creates a bank of 64 different MIDI control message numbers, filtered before output.

## Syntax
=== "Modern"
    ``` csound-orc
    k1, ..., k64 = slider64f(ichan, ictlnum1, imin1, imax1, init1, ifn1, icutoff1, \
                             ..., ictlnum64, imin64, imax64, init64, ifn64, icutoff64)
    ```

=== "Classic"
    ``` csound-orc
    k1, ..., k64 slider64f ichan, ictlnum1, imin1, imax1, init1, ifn1, icutoff1, \
                           ..., ictlnum64, imin64, imax64, init64, ifn64, icutoff64
    ```

### Initialization

_ichan_ -- MIDI channel (1-16)

_ictlnum1 ... ictlnum64_ -- MIDI control number (0-127)

_imin1 ... imin64_ -- minimum values for each controller

_imax1 ... imax64_ -- maximum values for each controller

_init1 ... init64_ -- initial value for each controller

_ifn1 ... ifn64_ -- function table for conversion for each controller

_icutoff1 ... icutoff64_ -- low-pass filter cutoff frequency for each controller

### Performance

_k1 ... k64_ -- output values

_slider64f_ is a bank of MIDI controllers, useful when using MIDI mixer such as Kawai MM-16 or others for changing whatever sound parameter in real-time. The raw MIDI control messages at the input port are converted to agree with _iminN_ and _imaxN_,  and an initial value can be set. Also, an optional non-interpolated function table with a custom translation curve is allowed, useful for enabling exponential response curves.

When no function table translation is required, set the _ifnN_ value to 0, else set _ifnN_ to a valid function table number.  When table translation is enabled (i.e. setting _ifnN_ value to a non-zero number referring to an already allocated function table), _initN_ value should be set equal to _iminN_ or _imaxN_ value, else the initial output value will not be the same as specified in _initN_ argument.

_slider64f_ allows a bank of 64 different MIDI control message numbers. It filters the signal before output. This eliminates discontinuities due to the low resolution of the MIDI (7 bit). The cutoff frequency can be set separately for each controller (suggested range: .1 to 5 Hz).

As the input and output arguments are many, you can split the line using '\' (backslash) character (new in 3.47 version) to improve the readability. Using these opcodes is considerably more efficient than using the separate ones ([ctrl7](../opcodes/ctrl7.md) and [tonek](../opcodes/tonek.md)) when more controllers are required.

> :warning: **Warning**
>
> _slider64f_ opcodes do not output the required initial value immediately, but only after some k-cycles because the filter slightly delays the output.

## See Also

[Slider Banks](../midi/sliderbk.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
December 1998<br>

New in Csound version 3.50

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
