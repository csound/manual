<!--
id:vbapg
category:Signal Modifiers:Panning and Spatialization
-->
# vbapg

Calculates the gains for a sound location for up to 64.

## Syntax
=== "Modern"
    ``` csound-orc
    k1[, k2...] = vbapg(kazim [,kelev] [, kspread] [, ilayout])
    karray[] = vbapg(kazim [,kelev] [, kspread] [, ilayout])
    ```

=== "Classic"
    ``` csound-orc
    k1[, k2...] vbapg kazim [,kelev] [, kspread] [, ilayout]
    karray[] vbapg kazim [,kelev] [, kspread] [, ilayout]
    ```

### Initialization

_ilayout_ -- index of the speaker layout in the range 0-99, corresponding to a call to
_vbaplsinit_.  The default value is 0.

### Performance

_kazim_ -- azimuth angle of the virtual source

_kelev_ (optional) -- elevation angle of the virtual source

_kspread_ (optional) -- spreading of the virtual source (range 0 - 100).  If value is zero, conventional amplitude panning is used. When _kspread_ is increased, the number of loudspeakers used in panning increases. If value is 100, the sound is applied to all loudspeakers.

_vbapg_ calculates the gains that an input signal would have between multiple speakers according to the controls _kazim_ and _kelev_, and the configured loudspeaker placement _ilayout_.  If _idim_ = 2, _kelev_ is set to zero. The distribution is performed using Vector Base Amplitude Panning (VBAP - See reference).  VBAP distributes the signal using loudspeaker data configured with _vbaplsinit_. The signal is applied to, at most, two loudspeakers in 2-D loudspeaker configurations, and three loudspeakers in 3-D loudspeaker configurations. If the virtual source is panned outside the region spanned by loudspeakers, the nearest loudspeakers are used in panning.

> :warning: **Warning**
>
> Please note that all _vbap_ panning opcodes require the _vbap_ system to be initialized using [vbaplsinit](../opcodes/vbaplsinit.md).

### Reference

Ville Pulkki: &#8220;Virtual Sound Source Positioning Using Vector Base Amplitude Panning&#8221; _Journal of the Audio Engineering Society_, 1997 June, Vol. 45/6, p. 456.

## Examples

Here is an example of the vbapg opcode. It uses the file [vbapg.csd](../examples/vbapg.csd).

``` csound-csd title="Example of the vbapg opcode." linenums="1"
--8<-- "examples/vbapg.csd"
```

Its output should include lines like these:

```
spread of source = 0
spread of source = 8
spread of source = 17
spread of source = 25
spread of source = 33
spread of source = 42
spread of source = 50
spread of source = 58
spread of source = 67
spread of source = 75
spread of source = 83
spread of source = 92
spread of source = 100
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
Author: John ffitch<br>
July 2012, Sept 2013<br>

New in Csound Version 5.17.13.

Array version new in Csound Version 6.01.
