<!--
id:GEN28
category:
-->
# GEN28
Reads a text file which contains a time-tagged trajectory.

The text file contains sets of three values representing the xy coordinates and a time-tag for when the signal should be placed at that location, allowing the user to define a time-tagged trajectory. The file format is in the form:

```
time1    X1      Y1
time2    X2      Y2
time3    X3      Y3
```

The configuration of the xy coordinates in space places the signal in the following way:

*  a1 is -1, 1
*  a2 is 1, 1
*  a3 is -1, -1
*  a4 is 1, -1

This assumes a loudspeaker set up as a1 is left front, a2 is right front, a3 is left back, a4 is right back. Values greater than 1 will result in sounds being attenuated as if in the distance. _GEN28_ creates values to 10 milliseconds of resolution.

## Syntax
``` csound-orc
f # time size 28 ifilcod
```

### Initialization

_size_ -- number of points in the table. Must be 0. _GEN28_ takes 0 as the size and automatically allocates memory.

_ifilcod_ -- character-string denoting the source file name. A character-string (in double quotes, spaces permitted) gives the filename itself, optionally a full pathname. If not a full path, the named file is sought in the current directory.

## Examples

``` csound-orc
f_1 0 0 28 &quot;move&quot;
```

The file &quot;move&quot; should look like:

```
0       -1       1
1        1       1
2        4       4
2.1     -4      -4
3        10     -10
5       -40      0
```

Since _GEN28_ creates values to 10 milliseconds of resolution, there will be 500 values created by interpolating X1 to X2 to X3 and so on, and Y1 to Y2 to Y3 and so on, over the appropriate number of values that are stored in the function table. The sound will begin in the left front, over 1 second it will move to the right front, over another second it move further into the distance but still in the right front, then in just 1/10th of a second it moves to the left rear, a bit distant. Finally over the last .9 seconds the sound will move to the right rear, moderately distant, and it comes to rest between the two left channels (due west!), quite distant.

Here is an example of the GEN28 routine. It uses the file [gen28.csd](../examples/gen28.csd).

``` csound-csd title="Example of the gen28 generator." linenums="1"
--8<-- "examples/gen28.csd"
```

## Credits

Author: Richard Karpen<br>
Seattle, Wash<br>
1998<br>

New in Csound version 3.48
