<!--
id:vbapzmove
category:Signal Modifiers:Panning and Spatialization
-->
# vbapzmove
Writes a multi-channel audio signal to a ZAK array with moving virtual sources.

## Syntax
=== "Modern"
    ``` csound-orc
    vbapzmove(inumchnls, istartndx, asig, idur, ispread, ifldnum, ifld1, ifld2, [...])
    ```

=== "Classic"
    ``` csound-orc
    vbapzmove inumchnls, istartndx, asig, idur, ispread, ifldnum, ifld1, ifld2, [...]
    ```

### Initialization

_inumchnls_ -- number of channels to write to the ZA array. Must be in the range 2 - 256.

_istartndx_ -- first index or position in the ZA array to use

_idur_ -- the duration over which the movement takes place.

_ispread_ -- spreading of the virtual source (range 0 - 100).  If value is zero, conventional amplitude panning is used. When _ispread_ is increased, the number of loudspeakers used in panning increases. If value is 100, the sound is applied to all loudspeakers.

_ifldnum_ -- number of fields (absolute value must be 2 or larger). If _ifldnum_ is positive, the virtual source movement is a polyline specified by given directions. Each transition is performed in an equal time interval. If _ifldnum_ is negative, specified angular velocities are applied to the virtual source during specified relative time intervals (see below).

_ifld1, ifld2, ..._ -- azimuth angles or angular velocities, and relative durations of movement phases (see below).

### Performance

_asig_ -- audio signal to be panned

The opcode _vbapzmove_ is the multiple channel analog of the opcodes like [vbap4move](../opcodes/vbap4move.md), working on _inumchnls_ and using a ZAK array for output.

> :warning: **Warning**
>
> Please note that all _vbap_ panning opcodes require the _vbap_ system to be initialized using [vbaplsinit](../opcodes/vbaplsinit.md).

### Reference

Ville Pulkki: &#8220;Virtual Sound Source Positioning Using Vector Base Amplitude Panning&#8221; _Journal of the Audio Engineering Society_, 1997 June, Vol. 45/6, p. 456.

## Examples

See the entry for [vbap8move](../opcodes/vbap8move.md) for an example of usage of the _vbapXmove_ opcodes.

## See also

[Panning and Spatialization: Vector Base Amplitude Panning](../sigmod/panspatl.md)

## Credits

John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
May 2000<br>

New in Csound Version 4.07
