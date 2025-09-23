<!--
id:platerev
category:Signal Modifiers:Reverberation
-->
# platerev
Models the reverberation of a rectangular metal plate with settable physical characteristics when excited by audio signal(s).

## Syntax
=== "Modern"
    ``` csound-orc
    a1[, a2, ...] = platerev(itabexcite. itabouts, kbndry, iaspect, istiff, idecay, \
                             iloss, aexcite1[, aexcite2, ...])
    ```

=== "Classic"
    ``` csound-orc
    a1[, a2, ...] platerev itabexcite. itabouts, kbndry, iaspect, istiff, idecay, \
                           iloss, aexcite1[, aexcite2, ...]
    ```

### Initialization

_itabexcite_ -- number of a table that contains triplets for each excitation signal, (frequency, radius, initial phase in radians).  The radius should be less than 1. These control where the excitation happens.  The values in the table for frequency and radius may be changed in performance, with the proviso about clicking if the changes are too large.

_itabouts_ -- number of a table that contains triplets for each output signal, (frequency, radius, initial phase in radians).  See itabexcite description.

_kbndry_ -- boundary condition of the plate; 0 = free, 1 = clamped, 2 = pivoting.  Other values are undefined.  Thus parameter may be changed at k-rate but that might give rise to clicks.

_iaspect_ -- plate aspect ratio which should be less than or equal to 1.

_istiff_ -- plate stiffness parameter (set around 1 or less for plate reverb).

_idecay_ -- time taken for 30 dB decay

_iloss_ -- loss parameter for high-frequency damping (value about 0.001 suggested).

### Performance

A metal plate is excited by a stereo signal and the resulting reverberation captured.

_aexciten_ -- excitation signal to be inserted into the plate.

## Examples

Here is an example of the platerev opcode. It uses the file [plate.csd](../examples/plate.csd).

``` csound-csd title="Example of the platerev opcode." linenums="1"
--8<-- "examples/plate.csd"
```

## See also

[Reverberation](../sigmod/reverbtn.md)

## Credits

Author: Stefan Bilbao <br>
University of Edinburgh, UK<br>
Author: John ffitch <br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 5.17.12
