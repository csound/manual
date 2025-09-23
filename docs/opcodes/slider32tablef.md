<!--
id:slider32tablef
category:Real-time MIDI:Slider Banks
-->
# slider32tablef
Stores a bank of 32 different MIDI control messages to a table, filtered before output.

## Syntax
=== "Modern"
    ``` csound-orc
    kflag = slider32tablef(ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \
                           init1, ifn1, icutoff1, ...., \
                           ictlnum32, imin32, imax32, init32, ifn32, icutoff32)
    ```

=== "Classic"
    ``` csound-orc
    kflag slider32tablef ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \
                         init1, ifn1, icutoff1, ...., \
                         ictlnum32, imin32, imax32, init32, ifn32, icutoff32
    ```

### Initialization

_ichan_ -- MIDI channel (1-16)

_ioutTable_ -- number of the table that will contain the output

_ioffset_ -- output table offset. A zero means that the output of the first slider will affect the first table element. A 10 means that the output of the first slider will affect the 11th table element.

_ictlnum1 ... ictlnum32_ -- MIDI control number (0-127)

_imin1 ... imin32_ -- minimum values for each controller

_imax1 ... imax32_ -- maximum values for each controller

_init1 ... init32_ -- initial value for each controller

_ifn1 ... ifn32_ -- function table for conversion for each controller

_icutoff1 ... icutoff32_ -- low-pass filter cutoff frequency for each controller

### Performance

_kflag_ -- a flag that informs if any control-change message in the bank has been received. In this case _kflag_ is set to 1. Otherwise is set to zero.

_slider32tablef_ is a bank of MIDI controllers, useful when using MIDI mixer such as Kawai MM-16 or others for changing whatever sound parameter in real-time. The raw MIDI control messages at the input port are converted to agree with _iminN_ and _imaxN_,  and an initial value can be set. Also, an optional non-interpolated function table with a custom translation curve is allowed, useful for enabling exponential response curves.

When no function table translation is required, set the _ifnN_ value to 0, else set _ifnN_ to a valid function table number.  When table translation is enabled (i.e. setting _ifnN_ value to a non-zero number referring to an already allocated function table), _initN_ value should be set equal to _iminN_ or _imaxN_ value, else the initial output value will not be the same as specified in _initN_ argument.

_slider32tablef_ allows a bank of 32 different MIDI control message numbers. It filters the signal before output. This eliminates discontinuities due to the low resolution of the MIDI (7 bit). The cutoff frequency can be set separately for each controller (suggested range: .1 to 5 Hz).

As the input and output arguments are many, you can split the line using '\' (backslash) character (new in 3.47 version) to improve the readability. Using these opcodes is considerably more efficient than using the separate ones ([ctrl7](../opcodes/ctrl7.md) and [tonek](../opcodes/tonek.md)) when more controllers are required.

_slider32tablef_ is very similar to  [slider32f](../opcodes/slider32f.md) and _sliderNf_ family of opcodes (see their manual for more information). The actual difference is that the output is not stored to k-rate variables, but to a table, denoted by the _ioutTable_ argument. It is possible to define a starting index in order to use the same table for more than one slider bank (or other purposes).

It is possible to use this opcode together with *FLslidBnk2Setk* and *FLslidBnk2*, so you can synchronize the position of the MIDI values to the position of the FLTK valuator widgets of *FLslidBnk2*. Notice that you have to specify the same min/max values as well the linear/exponential responses in both *sliderNtable(f)* and *FLslidBnk2*. The exception is when using table-indexed response instead of a lin/exp response. In this case, in order to achieve a useful result, the table-indexed response and actual min/max values must be set only in *FLslidBnk2*, whereas, in sliderNtable(f), you have to set a linear response and a minimum of zero and a maximum of one in all sliders. The FLTK opcodes are plugin opcodes in widgets from the plugins repository.

> :warning: **Warning**
>
> _slider32tablef_ opcodes do not output the required initial value immediately, but only after some k-cycles because the filter slightly delays the output.

## See Also

[Slider Banks](../midi/sliderbk.md)

## Credits

Author: Gabriel Maldonado<br>

New in Csound version 5.06
