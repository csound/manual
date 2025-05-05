<!--
id:vbapz
category:Signal Modifiers:Panning and Spatialization
-->
# vbapz
Writes a multi-channel audio signal to a ZAK array.

## Syntax
=== "Modern"
    ``` csound-orc
    vbapz(inumchnls, istartndx, asig, kazim [, kelev] [, kspread])
    ```

=== "Classic"
    ``` csound-orc
    vbapz inumchnls, istartndx, asig, kazim [, kelev] [, kspread]
    ```

### Initialization

_inumchnls_ -- number of channels to write to the ZA array. Must be in the range 2 - 256.

_istartndx_ -- first index or position in the ZA array to use

### Performance

_asig_ -- audio signal to be panned

_kazim_ -- azimuth angle of the virtual source

_kelev_ (optional) -- elevation angle of the virtual source

_kspread_ (optional) -- spreading of the virtual source (range 0 - 100).  If value is zero, conventional amplitude panning is used. When _kspread_ is increased, the number of loudspeakers used in panning increases. If value is 100, the sound is applied to all loudspeakers.

The opcode _vbapz_ is the multiple channel analog of the opcodes like [vbap4](../opcodes/vbap4.md), working on _inumchnls_ and using a ZAK array for output.

> :warning: **Warning**
>
> Please note that all _vbap_ panning opcodes require the _vbap_ system to be initialized using [vbaplsinit](../opcodes/vbaplsinit.md).

### Reference

Ville Pulkki: &#8220;Virtual Sound Source Positioning Using Vector Base Amplitude Panning&#8221; _Journal of the Audio Engineering Society_, 1997 June, Vol. 45/6, p. 456.

## Examples

See the entry for [vbap8](../opcodes/vbap8.md) for an example of usage of the _vbap_ opcodes.

## See also

[Panning and Spatialization: Vector Base Amplitude Panning](../sigmod/panspatl.md)

## Credits

John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
May 2000<br>

New in Csound Version 4.07. Input parameters accept k-rate since Csund 5.09.
