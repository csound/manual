<!--
id:pitch
category:Instrument Control:Sensing and Control
-->
# pitch
Tracks the pitch of a signal.

Using the same techniques as [spectrum](../opcodes/spectrum.md) and [specptrk](../opcodes/specptrk.md), pitch tracks the pitch of the signal in octave point decimal form, and amplitude in dB.

## Syntax
=== "Modern"
    ``` csound-orc
    koct, kamp = pitch(asig, iupdte, ilo, ihi, idbthresh [, ifrqs] [, iconf] \
                       [, istrt] [, iocts] [, iq] [, inptls] [, irolloff] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    koct, kamp pitch asig, iupdte, ilo, ihi, idbthresh [, ifrqs] [, iconf] \
                     [, istrt] [, iocts] [, iq] [, inptls] [, irolloff] [, iskip]
    ```

### Initialization

_iupdte_ -- length of period, in seconds, that outputs are updated

_ilo_, _ihi_ -- range in which pitch is detected, expressed in octave point decimal

_idbthresh_ -- amplitude, expressed in decibels, necessary for the pitch to be detected.  Once started it continues until it is 6 dB down.

_ifrqs_ (optional) -- number of divisons of an octave. Default is 12 and is limited to 120.

_iconf_ (optional) -- the number of conformations needed for an octave jump.  Default is 10.

_istrt_ (optional) -- starting pitch for tracker. Default value is (_ilo_ + _ihi_)/2.

_iocts_ (optional) -- number of octave decimations in spectrum. Default is 6.

_iq_ (optional) -- Q of analysis filters. Default is 10.

_inptls_ (optional) -- number of harmonics, used in matching. Computation time increases with the number of harmonics. Default is 4.

_irolloff_ (optional) -- amplitude rolloff for the set of filters expressed as fraction per octave. Values must be positive. Default is 0.6.

_iskip_ (optional) -- if non-zero, skips initialization. Default is 0.

### Performance

_koct_ -- The pitch output, given in the octave point decimal format.

_kamp_ -- The amplitude output.

_pitch_ analyzes the input signal, _asig_, to give a pitch/amplitude pair of outputs, for the strongest frequency in the signal. The value is updated every _iupdte_ seconds.

The number of partials and rolloff fraction can effect the pitch tracking, so some experimentation may be necessary. Suggested values are 4 or 5 harmonics, with rolloff 0.6, up to 10 or 12 harmonics with rolloff 0.75 for complex timbres, with a weak fundamental.

## Examples

Here is an example of the pitch opcode. It uses the file [pitch.csd](../examples/pitch.csd).

``` csound-csd title="Example of the pitch opcode." linenums="1"
--8<-- "examples/pitch.csd"
```

## See also

[Sensing and Control: Tempo and Pitch estimation](../control/sensing.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>
April 1999<br>

New in Csound version 3.54
