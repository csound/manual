<!--
id:hvs1
category:Signal Generators:Hyper Vectorial Synthesis
-->
# hvs1
Allows one-dimensional Hyper Vectorial Synthesis (HVS) controlled by externally-updated k-variables.

## Syntax
=== "Modern"
    ``` csound-orc
    hvs1(kx, inumParms, inumPointsX, iOutTab, iPositionsTab, iSnapTab [, iConfigTab])
    ```

=== "Classic"
    ``` csound-orc
    hvs1 kx, inumParms, inumPointsX, iOutTab, iPositionsTab, iSnapTab [, iConfigTab]
    ```

### Initialization

_inumParms_ - number of parameters controlled by the HVS. Each HVS snapshot is made up of inumParms elements.

_inumPointsX_ - number of points that each dimension of the HVS cube (or square in case of two-dimensional HVS; or line in case of one-dimensional HVS) is made up.

_iOutTab_ - number of the table receiving the set of output-parameter instant values of the HVS. The total amount of parameters is defined by the _inumParms_ argument.

_iPositionsTab_ – a table filled with the individual positions of snapshots in the HVS matrix (see below for more information).

_iSnapTab_ – a table filled with all the snapshots. Each snapshot is made up of a set of parameter values. The amount of elements contained in each snapshots is specified by the _inumParms_ argument. The set of elements of each snapshot follows (and is adjacent) to the previous one in this table. So the total size of this table should be >= to _inumParms_ multiplied the number of snapshots you intend to store for the HVS.

_iConfigTab_ – (optional) a table containing the behavior of the HVS for each parameter. If the value of _iConfigTab_ is zero (default), this argument is ignored, meaning that each parameter is treated with linear interpolation by the HVS. If _iConfigTab_ is different than zero, then it must refer to an existing table whose contents are in its turn referring to a particolar kind of interpolation. In this table, a value of -1 indicates that corresponding parameter is leaved unchanged (ignored) by the HVS; a value of zero indicates that corresponding parameter is treated with linear-interpolation; each other values must be integer numbers indicating an existing table filled with a shape which will determine the kind of special interpolation to be used (table-based interpolation).

### Performance

_kx_ -  these are externally-modified variables which controls the motion of the pointer in the HVS matrix cube (or square or line in case of HVS matrices made up of less than 3 dimensions). The range of these input arguments must be 0 to 1.

Hyper Vectorial Synthesis is a technique that allows control of a huge set of parameters by using a simple and global approach. The key concepts of the HVS are:

The set of HVS parameters, whose amount is fixed and defined by the _inumParms_ argument. During the HVS performance, all these parameters are variant and can be applied to any sound synthesis technique, as well as to any global control for algorithmic composition and any other kind of level. The user must previously define several sets of fixed values for each HVS parameter, each set corresponding to a determinate synthesis configuration. Each set of values is called snapshot, and can be considered as the coordinates of a bound of a multi-dimensional space. The HVS consists on moving a point in this multi-dimensional space (by using a special motion pointer, see below), according and inside the bounds defined by the snapshots. You can fix any amount of HVS parameters (each parameter being a dimension of the multi-dimensional space), even a huge number, the limit only depends on the processing power (and the memory) of your computer and on the complexity of the sound-synthesis you will use.

The HVS cube (or square or line). This is the matrix (of 3, 2 or 1 dimensions, according to the hvs opcode you intend to use) of “mainstays” (or pivot) points of HVS. The total amount of pivot-points depends on the value of the _inumPointsX_, _inumPointsY_ and _inumPointsZ_ arguments. In the case of a 3-dimensional HVS matrix you can define, for instance, 3 points for the X dimension, 5 for the Y dimension and 2 for the Z dimension. In this case, the total number of pivot-points is 3 * 5 * 2 = 30. With this set of pivot points, the cube Is divided into smaller cubed zones each one bounded by eight nearby points. Each point is numbered. The numeral order of these points is enstabilished in the following way: number zero is the first point, number 1 the second and so on. Assuming you are using a 3-dimensional HVS cube having the number of points above mentioned (i.e. 3, 5 and 2 respectively for the X, Y and Z axis), the first point (point zero) is the upper-left-front vertex of the cube, by facing the XY plane of the cube. The second point is the middle point of the upper front edge of the cube and so on. You can refer to the figure below in order to understand how the numeral order of the pivot-points proceeds:

For the 2-dimensional HVS, it is the same, by only omitting the rear cube face, so each zone is bounded by 4 pivot-points instead of 8. For the 1-dimensional HVS, the whole thing is even simpler because it is a line with the pivot-points proceeding from left to right. Each point is coupled with a snapshot.

Snapshot order, as stored into the _iSnapTab_, can or cannot follow the order of the pivot-points numbers. In fact it is possible to alter this order by means the _iPositionsTab_, a table that remaps the position of each snapshot in relation to the pivot points. The _iPositionsTab_ is made up of the positions of the snapshots (contained in the _iSnapTab_) in the two-dimensional grid. Each subsequent element is actually a pointer representing the position in the _iSnapTab_. For example, in a 2-dimensional HVS matrix such as the following (in this case having _inumPointsX_ = 3 and _inumPointsY_ = 5:

|   |   |   |
|---|---|---|
| 5 | 7 | 1 |
| 3 | 4 | 9 |
| 6 | 2 | 0 |
| 4 | 1 | 3 |
| 8 | 2 | 7 |

These numbers (to be stored in the _iSnapTab_ table by using, for instance, the GEN02 function generator) represents the snapshot position within the grid (in this case a 3x5 matrix). So, the first element 5, has index zero and represents the 6th (element zero is the first) snapshot contained in the iSnapTab, the second element 7 represents the 8th element of _iSnapTab_ and so on. Summing up, the vertices of each zone (a cubed zone is delimited by 8 vertices; a squared zone by 4 vertices and a linear zone by 2 points) are coupled with a determinate snapshot, whose number is remapped by the _iSnapTab_.

Output values of the HVS are influenced by the motion pointer, a point whose position, in the HVS cube (or square or segment) is determined by the _kx_, _ky_ and _kz_ arguments. The values of these arguments, which must be in the 0 to 1 range, are externally set by the user. The output values, whose amount is equal to the _inumParms_ argument, are stored in the _iOutTab_, a table that must be already allocated by the user, and must be at least _inumParms_ size. In what way the motion pointer influences the output? Well, when the motion pointer falls in a determinate cubed zone, delimited, for instance, by 8 vertices (or pivot points), we assume that each vertex has associated a different snapshot (i.e. a set of _inumParms_ values), well, the output will be the weighted average value of the 8 vertices, calculated according on the distance of the motion pointer from each of the 8 vertices. In the case of a default behavior, when the _iConfigTab_ argument is not set, the exact output is calculated by using linear interpolation which is applied to each different parameter of the HVS. Anyway, it is possible to influence this behavior by setting the _iConfigTab_ argument to a number of a table whose contents can affect one or more HVS parameters. The _iConfigTab_ table elements are associated to each HVS parameter and their values affect the HVS output in the following way:

*   If _iConfigTab_ is equal to -1, corresponding output is skipped, i.e. the element is not calculated, leaving corresponding element value in the _iOutTab_ unchanged;
*   If _iConfigTab_ is equal to zero, then the normal HVS output is calculated (by using weighted average of the nearest vertex of current zone where it falls the motion pointer);
*   If _iConfigTab_ element is equal to an integer number > zero, then the contents of a table having that number is used as a shape of a table-based interpolation.

## Examples

Here is an example of the hvs1 opcode. It uses the file [hvs1.csd](../examples/hvs1.csd).

``` csound-orc title="Example of the hvs1 opcode." linenums="1"
--8<-- "examples/hvs1.csd"
```

## See also

[Hyper Vectorial Synthesis](../siggen/hvs.md)

## Credits

Author: Gabriel Maldonado

New in version 5.06
