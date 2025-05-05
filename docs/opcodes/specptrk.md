<!--
id:specptrk
category:Spectral Processing:Non-Standard
-->
# specptrk
Estimates the pitch of the most prominent complex tone in the spectrum.

## Syntax
=== "Modern"
    ``` csound-orc
    koct, kamp = specptrk(wsig, kvar, ilo, ihi, istr, idbthresh, inptls, irolloff \
                          [, iodd] [, iconfs] [, interp] [, ifprd] [, iwtflg])
    ```

=== "Classic"
    ``` csound-orc
    koct, kamp specptrk wsig, kvar, ilo, ihi, istr, idbthresh, inptls, irolloff \
                        [, iodd] [, iconfs] [, interp] [, ifprd] [, iwtflg]
    ```

### Initialization

_ilo, ihi, istr_ -- pitch range conditioners (low, high, and starting) expressed in decimal octave form.

_idbthresh_ -- energy threshold (in decibels) for pitch tracking to occur.  Once begun, tracking will be continuous until the energy falls below one half the threshold (6 dB down), whence the _koct_ and _kamp_ outputs will be zero until the full threshold is again surpassed. _idbthresh_ is a guiding value. At initialization it is first converted to the _idbout_ mode of the source spectrum (and the 6 dB down point becomes .5, .25, or 1/root 2 for modes 0, 2 and 3). The values are also further scaled to allow for the weighted partial summation used during correlation.The actual thresholding is done using the internal weighted and summed _kamp_ value that is visible as the second output parameter.

_inptls, irolloff_ -- number of harmonic partials used as a matching template in the spectrally-based pitch detection, and an amplitude rolloff for the set expressed as some fraction per octave (linear, so don't roll off to negative).  Since the partials and rolloff fraction can affect the pitch following, some experimentation will be useful: try 4 or 5 partials with .6 rolloff as an initial setting; raise to 10 or 12 partials with rolloff .75 for complex timbres like the bassoon (weak fundamental). Computation time is dependent on the number of partials sought. The maximum number is 16.

_iodd_ (optional) -- if non-zero, employ only odd partials in the above set (e.g. _inptls_ of 4 would employ partials 1,3,5,7). This improves the tracking of some instruments like the clarinet The default value is 0 (employ all partials).

_iconfs_ (optional) -- number of confirmations required for the pitch tracker to jump an octave, pro-rated for fractions of an octave (i.e. the value 12 implies a semitone change needs 1 confirmation (two hits) at the _spectrum_ generating _iprd_). This parameter limits spurious pitch analyses such as octave errors. A value of 0 means no confirmations required; the default value is 10.

_interp_ (optional) -- if non-zero, interpolate each output signal (_koct_, _kamp_) between incoming _wsig_ frames. The default value is 0 (repeat the signal values between frames).

_ifprd_ (optional) -- if non-zero, display the internally computed spectrum of candidate fundamentals.  The default value is 0 (no display).

_iwtftg_ (optional) -- wait flag. If non-zero, hold each display until released by the user. The default value is 0 (no wait).

### Performance

At note initialization this unit creates a template of _inptls_ harmonically related partials (odd partials, if _iodd_ non-zero) with amplitude rolloff to the fraction _irolloff_ per octave. At each new frame of _wsig_, the spectrum is cross-correlated with this template to provide an internal spectrum of candidate fundamentals (optionally displayed). A likely pitch/amp pair (_koct_, _kamp_, in decimal octave and summed _idbout_ form) is then estimated. _koct_ varies from the previous _koct_ by no more than plus or minus _kvar_ decimal octave units. It is also guaranteed to lie within the hard limit range _ilo_ -- _ihi_ (decimal octave low and high pitch). _kvar_ can be dynamic, e.g. onset amp dependent.  Pitch resolution uses the originating _spectrum_ _ifrqs_ bins/octave, with further parabolic interpolation between adjacent bins. Settings of root magnitude, _ifrqs_ = 24, _iq_ = 15 should capture all the inflections of interest. Between frames, the output is either repeated or interpolated at the k-rate. (See [spectrum](../opcodes/spectrum.md).)

## Examples

``` csound-orc
  a1, a2   ins                                       ; read a stereo clarinet input
  krms     rms        a1, 20                         ; find a monaural rms value
  kvar     =          0.6 + krms/8000                ; & use to gate the pitch variance
  wsig     spectrum   a1, 0.01, 7, 24, 15, 0, 3      ; get a 7-oct spectrum, 24 bibs/oct
           specdisp   wsig, 0.2                      ; display this and now estimate
  ; the pch and amp
  koct, ka spectrk    wsig, kvar, 7.0, 10, 9, 20, 4, 0.7, 1, 5, 1, 0.2
  aosc     oscil      ka * ka * 10, cpsoct(koct), 2  ; & generate \ new tone with these
  koct     =          (koct < 7.0 ? 7.0 : koct)      ; replace non pitch with low C
           display    koct - 7.0, 0.25, 20           ; & display the pitch track
           display    ka, 0.25, 20                   ; plus the summed root mag
           outs       a1, aosc                       ; output 1 original and 1 new track
```
