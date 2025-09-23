<!--
id:bformdec2
category:Signal Modifiers:Panning and Spatialization
-->
# bformdec2
Decodes an Ambisonics B format signal into loudspeaker specific signals, with dual--band decoding and near--field compensation.

## Syntax
=== "Modern"
    ``` csound-orc
    aout[] = bformdec2(isetup, abform[], [idecoder, idistance, ifreq, imix, \
                       ifilel, ifiler])
    ```

=== "Classic"
    ``` csound-orc
    aout[] bformdec2 isetup, abform[], [idecoder, idistance, ifreq, imix, \
                     ifilel, ifiler]
    ```

### Initialization

_isetup_ -- loudspeaker setup.
There are currently 8 supported setups, the first five are backwards compatible with [bformdec1](../opcodes/bformdec1.md):

(Note that horizontal angles are measured anticlockwise in this description.)

* 1: Stereo -- L(90), R(-90); this is an M+S style stereo decode.
* 2: Quad -- FL(45), BL(135), BR(-135), FR(-45). This is a first-order decode.
* 3: 5.0 -- L(30), R(-30), C(0), BL(110), BR(-110). This is the configuration suggested by the International Telecommunication Union for 5.1 surround systems for music listening. This is a first- or second- order decode.
* 4: Octagon -- FFL(22.5), FLL(67.5), BLL(112.5), BBL(157.5), BBR(-157.5), BRR(-112.5), FRR(-67.5), FFR(-22.5). This is a first-, second- or third-order decode, depending on the number of input channels.
* 5: Cube -- FLD(45,-35.26), FLU(45,35.26), BLD(135,-35.26), BLU(135,35.26), BRD(-135,-35.26), BRU(-135,35.26), FRD(-45,-35.26), FRU(-45,35.26). This is a first-order decode.
* 6: Hexagon -- FL(30), L(90) BL(150), BR(-150), R(-90), FR(-30). This is a first- or second- order decode.
* 21: 2D binaural configuration. This first decodes to a octagon configuration and then applies HRTF filters.
* 31: 3D binaural configuration. This first decodes to a dodecahedron configuration and then applies HRTF filters.

_idecoder_ -- optional (default 0), select the type of decoder

* 0: Dual decoder (velocity and energy decoders using dual-band splitting).
* 1: Velocity decoder.
* 2: Energy decoder.

_idistance_ -- optional (default 1 meter), select the distance (in meters) to the loudspeaker (radius if regular configuration)

_ifreq_ -- optional (default 400 Hz), frequency cut (Hz) of the band splitting filter (only has an effect if _idecoder_=0)* 

_imix_ -- optional (default 0), type of mix of the velocity and energy decoders' outputs

* 0: Energy
* 1: RMS
* 2: Amplitude

_ifilel_ -- left HRTF spectral data file

_ifiler_ -- right HRTF spectral data file

> :memo: **Note**
>
> Spectral datafiles (based on the MIT HRTF database) should be in the current directory or the SADIR (see the [hrtfstat documentation](../opcodes/hrtfstat.md)).

### Performance

_abform_ -- input signal array in the B format

_aout[]_ -- loudspeaker specific output signals

The opcode receives as input an audio type array with an Ambisonics signal, and outputs another array with a multichannel audio signal decoded according to the given setup.

## See also

[Panning and Spatialization: Ambisonics](../sigmod/panspatl.md)

## Credits

By: Pablo Zinemanas, Martín Rocamora and Luis Jure, 2019. Adapted by John ffitch

Based on code from the [Ambisonics Decoder Toolbox](https://bitbucket.org/ambidecodertoolbox/adt/) by Aaron J. Heller.

For more information about the opcode and technical details see: Pablo Zinemanas, Martín Rocamora and Luis Jure. Improving Csound's Ambisonics decoders. Fifth International Csound Conference -- ICSC2019. Italy, 2019 -- [PDF](https://csound.com/icsc2019/proceedings/7.pdf).

New in version 6.17
