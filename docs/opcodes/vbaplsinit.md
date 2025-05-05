<!--
id:vbaplsinit
category:Signal Modifiers:Panning and Spatialization
-->
# vbaplsinit
Configures VBAP output according to loudspeaker parameters.
Configures VBAP output according to loudspeaker parameters.

## Syntax
=== "Modern"
    ``` csound-orc
    vbaplsinit(idim, ilsnum [, idir1] [, idir2] [...] [, idir32])
    vbaplsinit(idim, ilsnum, ilsarray)
    ```

=== "Classic"
    ``` csound-orc
    vbaplsinit idim, ilsnum [, idir1] [, idir2] [...] [, idir32]
    vbaplsinit idim, ilsnum, ilsarray
    ```

### Initialization

_idim_ -- dimensionality of loudspeaker array. Either 2 or 3.  If the dimension has a fractional part then that is used as the index of the layout created (used in _vbap_, _vbapz_ and _vbapg_ only).  The factional part should be between .00 and .99.

_ilsnum_ -- number of loudspeakers. In two dimensions, the number can vary from 2 to 64. In three dimensions, the number can vary from 3 and 64.

_idir1, idir2, ..., idir32_ -- directions of loudspeakers. Number of directions must be less than or equal to 16. In two-dimensional loudspeaker positioning, _idir_n is the azimuth angle respective to _n_th channel.  In three-dimensional loudspeaker positioning, fields are the azimuth and elevation angles of each loudspeaker consequently (_azi1_, _ele1_, _azi2_, _ele2_, etc.).

_ilsarray_ -- a one dimesional array of the data as described above.

> :memo: **Note**
>
> In 2 dimensions the angle between two adjacent speakers must be less than 179 degrees (170 degrees in earlier versions). This is a restriction of the algorithm.

### Performance

VBAP distributes the signal using loudspeaker data configured with _vbaplsinit_. The signal is applied to, at most, two loudspeakers in 2-D loudspeaker configurations, and three loudspeakers in 3-D loudspeaker configurations. If the virtual source is panned outside the region spanned by loudspeakers, the nearest loudspeakers are used in panning.

### Reference

Ville Pulkki: &#8220;Virtual Sound Source Positioning Using Vector Base Amplitude Panning&#8221; _Journal of the Audio Engineering Society_, 1997 June, Vol. 45/6, p. 456.

## Examples

Here is an example of the vbaplsinit opcode. It uses the file [vbaplsinit.csd](../examples/vbaplsinit.csd).

``` csound-csd title="Example of the vbaplsinit opcode." linenums="1"
--8<-- "examples/vbaplsinit.csd"
```

See the other entries of the vbap opcodes for different examples.

## See also

[Panning and Spatialization: Vector Base Amplitude Panning](../sigmod/panspatl.md)

## Credits

Author: Ville Pulkki<br>
Sibelius Academy Computer Music Studio<br>
Laboratory of Acoustics and Audio Signal Processing<br>
Helsinki University of Technology<br>
Helsinki, Finland<br>
May 2000<br>

New in Csound Version 4.07

Multiple layouts new ib version 5.17.14
