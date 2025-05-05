<!--
id:vphaseseg
category:FLTK:Other
-->
# vphaseseg
Allows one-dimensional HVS (Hyper-Vectorial Synthesis).

## Syntax
=== "Modern"
    ``` csound-orc
    vphaseseg(kphase, ioutab, ielems, itab1,idist1,itab2 \
              [,idist2,itab3, ... ,idistN-1,itabN])
    ```

=== "Classic"
    ``` csound-orc
    vphaseseg kphase, ioutab, ielems, itab1,idist1,itab2 \
              [,idist2,itab3, ... ,idistN-1,itabN]
    ```

### Initialization

_ioutab_ - number of output table.

_ielem_ - number of elements to process

_itab1,...,itabN_ - breakpoint table numbers

_idist1,...,idistN-1_ -  distances between breakpoints in percentage values

### Performance

_kphase_ - phase pointer

_vphaseseg_ returns the coordinates of section points of an N-dimensional space path. The coordinates of section points are stored into an output table. The number of dimensions of the N-dimensional space is determined by the _ielem_ argument that is equal to N and can be set to any number. To define the path, user have to provide a set of points of the N-dimensional space, called break-points. Coordinates of each break-point must be contained by a different table. The number of coordinates to insert in each break-point table must obviously equal to _ielem_ argument. There can be any number of break-point tables filled by the user.

Hyper-Vectorial Synthesis actually deals with two kinds of spaces. The first space is the N-dimensional space in which the path is defined, this space is called time-variant parameter space (or SPACE A). The path belonging to this space is covered by moving a point into the second space that normally has a number of dimensions smaller than the first. Actually, the point in motion is the projection of corresponding point of the N-dimensional space (could also be considered a section of the path). The second space is called user-pointer-motion space (or SPACE B) and, in the case of _vphaseseg_ opcode, has only ONE DIMENSION. Space B is covered by means of _kphase_ argument (that is a sort of path pointer), and its range is 0 to 1. The output corresponding to current pointer value is stored in _ioutab_ table, whose data can be afterwards used to control any syntesis parameters.

In _vphaseseg_, each break-point is separated from the other by a distance expressed in percentage, where all the path length is equal to the sum of all distances. So distances between breakpoints can be different, differently from kinds of HVS in which space B has more than one dimension, in these cases distance between break-points MUST be THE SAME for all intervals.

## See also

[Hyper Vectorial Synthesis](../siggen/hvs.md)

## Credits

Author: Gabriel Maldonado

New in version 5.06
