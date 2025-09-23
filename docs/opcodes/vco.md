<!--
id:vco
category:Signal Generators:Dynamic Spectrum Oscillators
-->
# vco
Implementation of a band limited, analog modeled oscillator.

It is based on integration of band limited impulses. _vco_ can be used to simulate a variety of analog wave forms.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = vco(xamp, xcps, iwave, kpw [, ifn] [, imaxd] [, ileak] [, inyx] \
               [, iphs] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares vco xamp, xcps, iwave, kpw [, ifn] [, imaxd] [, ileak] [, inyx] \
             [, iphs] [, iskip]
    ```

### Initialization

_iwave_ -- determines the waveform:

*  _iwave_ = 1 - sawtooth
*  _iwave_ = 2 - square/PWM
*  _iwave_ = 3 - triangle/saw/ramp

_ifn_ (optional, default = 1) -- Must point to a
valid table which contains a sine wave. Csound will report an
error if this parameter is not set and table 1 does not exist.

_imaxd_ (optional, default = 1) -- is the maximum delay time. A time of 1/_ifqc_ may be required for the PWM and triangle waveform. To bend the pitch down this value must be as large as 1/(minimum frequency).

_ileak_ (optional, default = 0) -- if _ileak_ is between zero and one (0 &lt; ileak &lt; 1) then _ileak_ is used as the leaky integrator value. Otherwise a leaky integrator value of .999 is used for the saw and square waves and .995 is used for the triangle wave. This can be used to &#8220;flatten&#8221; the square wave or &#8220;straighten&#8221; the saw wave at low frequencies by setting _ileak_ to .99999 or a similar value. This should give a hollower sounding square wave.

_inyx_ (optional, default = .5) -- this is used to determine the number of harmonics in the band limited pulse.  All overtones up to _sr_ * _inyx_ will be used.  The default gives _sr_ * .5 (_sr_/2).  For _sr_/4 use _inyx_ = .25.  This can generate a &#8220;fatter&#8221; sound in some cases.

_iphs_ (optional, default = 0) -- this is a phase value.  There is an artifact (bug-like feature) in _vco_ which occurs during the first half cycle of the square wave which causes the waveform to be greater in magnitude than all others.  The value of _iphs_ has an effect on this artifact.  In particular setting _iphs_ to .5 will cause the first half cycle of the square wave to resemble a small triangle wave.  This may be more desirable than the large wave artifact which is the current default.

_iskip_ (optional, default = 0) -- if non zero
skip the initialisation of the filter. (New in Csound version
4.23f13 and 5.0)

### Performance

_kpw_ -- determines either the pulse width (if _iwave_ is 2) or the saw/ramp character (if _iwave_ is 3) The value of _kpw_ should be greater than 0 and less than 1. A value of 0.5 will generate either a square wave (if _iwave_ is 2) or a triangle wave (if _iwave_ is 3).

_xamp_ -- determines the amplitude

_xcps_ -- is the frequency of the wave in cycles per second.

## Examples

Here is an example of the vco opcode. It uses the file [vco.csd](../examples/vco.csd).

``` csound-orc title="Example of the vco opcode." linenums="1"
--8<-- "examples/vco.csd"
```

## See Also

[Dynamic Spectrum Oscillators](../siggen/dynamic.md)

## Credits

Author: Hans Mikelson<br>
December 1998<br>

New in Csound version 3.50

November 2002. Corrected the documentation for the _kpw_ parameter thanks to Luis Jure and Hans Mikelson.
