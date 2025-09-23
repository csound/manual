<!--
id:clfilt
category:Signal Modifiers:Standard Filters
-->
# clfilt
Implements the classical standard analog filter types: low-pass and high-pass.

They are implemented with the four classical kinds of filters: Butterworth, Chebyshev Type I, Chebyshev Type II, and Elliptical.  The number of poles may be any even number from 2 to 80.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = clfilt(asig, kfreq, itype, inpol [, ikind] [, ipbr] [, isba] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares clfilt asig, kfreq, itype, inpol [, ikind] [, ipbr] [, isba] [, iskip]
    ```

### Initialization

_itype_ -- 0 for low-pass, 1 for high-pass.

_inpol_ -- The number of poles in the filter. It must be an even number from 2 to 80.

_ikind_ (optional) -- 0 for Butterworth, 1 for Chebyshev Type I, 2 for Chebyshev Type II, 3 for Elliptical. Defaults to 0 (Butterworth)

_ipbr_ (optional) -- The pass-band ripple in dB. Must be greater than 0. It is ignored by Butterworth and Chebyshev Type II. The default is 1 dB.

_isba_ (optional) -- The stop-band attenuation in dB. Must be less than 0. It is ignored by Butterworth and Chebyshev Type I. The default is -60 dB.

_iskip_ (optional) --  0 initializes all filter internal states to 0. 1 skips initialization. The default is 0.

### Performance

_asig_ -- The input audio signal.

_kfreq_ -- The corner frequency for low-pass or high-pass.

## Examples

=== "Modern"
    Here is an example of the clfilt opcode as a low-pass filter. It uses the file [clfilt_lowpass-modern.csd](../examples/clfilt_lowpass-modern.csd).
    ``` csound-csd title="Example of the clfilt opcode." linenums="1"
    --8<-- "examples/clfilt_lowpass-modern.csd"
    ```

=== "Classic"
    Here is an example of the clfilt opcode as a low-pass filter. It uses the file [clfilt_lowpass.csd](../examples/clfilt_lowpass.csd).
    ``` csound-csd title="Example of the clfilt opcode." linenums="1"
    --8<-- "examples/clfilt_lowpass.csd"
    ```

=== "Modern"
    Here is an example of the clfilt opcode as a high-pass filter. It uses the file [clfilt_highpass-modern.csd](../examples/clfilt_highpass-modern.csd).
    ``` csound-csd title="Example of the clfilt opcode." linenums="1"
    --8<-- "examples/clfilt_highpass-modern.csd"
    ```

=== "Classic"
    Here is an example of the clfilt opcode as a high-pass filter. It uses the file [clfilt_highpass.csd](../examples/clfilt_highpass.csd).
    ``` csound-csd title="Example of the clfilt opcode." linenums="1"
    --8<-- "examples/clfilt_highpass.csd"
    ```

## See also

[Standard filters: General filters](../sigmod/standard.md)

## Credits

Author: Erik Spjut

New in version 4.20
