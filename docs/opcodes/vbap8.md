<!--
id:vbap8
category:Signal Modifiers:Panning and Spatialization
-->
# vbap8
Distributes an audio signal among 8 channels.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1, ..., ar8 = vbap8(asig, kazim [, kelev] [, kspread])
    ```

=== "Classic"
    ``` csound-orc
    ar1, ..., ar8 vbap8 asig, kazim [, kelev] [, kspread]
    ```

### Performance

_asig_ -- audio signal to be panned

_kazim_ -- azimuth angle of the virtual source

_kelev_ (optional) -- elevation angle of the virtual source

_kspread_ (optional) -- spreading of the virtual source (range 0 - 100).  If value is zero, conventional amplitude panning is used. When _kspread_ is increased, the number of loudspeakers used in panning increases. If value is 100, the sound is applied to all loudspeakers.

_vbap8_ takes an input signal, _asig_, and distributes it among 8 outputs, according to the controls _kazim_ and _kelev_, and the configured loudspeaker placement.  If _idim_ = 2, _kelev_ is set to zero. The distribution is performed using Vector Base Amplitude Panning (VBAP - See reference).  VBAP distributes the signal using loudspeaker data configured with _vbaplsinit_. The signal is applied to, at most, two loudspeakers in 2-D loudspeaker configurations, and three loudspeakers in 3-D loudspeaker configurations. If the virtual source is panned outside the region spanned by loudspeakers, the nearest loudspeakers are used in panning.

> :warning: **Warning**
>
> Please note that all _vbap_ panning opcodes require the _vbap_ system to be initialized using [vbaplsinit](../opcodes/vbaplsinit.md).

### Reference

Ville Pulkki: &#8220;Virtual Sound Source Positioning Using Vector Base Amplitude Panning&#8221; _Journal of the Audio Engineering Society_, 1997 June, Vol. 45/6, p. 456.

## Examples

Here is a simple example of the _vbap8_ opcode. It uses the file [vbap8.csd](../examples/vbap8.csd).

``` csound-csd title="Example of the vbap8 opcode." linenums="1"
--8<-- "examples/vbap8.csd"
```

## See also

[Panning and Spatialization: Vector Base Amplitude Panning](../sigmod/panspatl.md)

## Credits

Author: Ville Pulkki<br>
Sibelius Academy Computer Music Studio<br>
Laboratory of Acoustics and Audio Signal Processing<br>
Helsinki University of Technology<br>
Helsinki, Finland<br>
May 2000<br>

New in Csound Version 4.07. Input parameters accept k-rate since Csund 5.09.
