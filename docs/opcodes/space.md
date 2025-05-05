<!--
id:space
category:Signal Modifiers:Panning and Spatialization
-->
# space
Distributes an input signal among 4 channels using cartesian coordinates.

It uses Cartesian xy coordinates to calculate the balance of the outputs. The xy coordinates can be defined in a separate text file and accessed through a Function statement in the score using [Gen28](../scoregens/gen28.md), or they can be specified using the optional _kx, ky_ arguments. The advantages to the former are:

1.  A graphic user interface can be used to draw and edit the trajectory through the Cartesian plane
2.  The file format is in the form time1 X1 Y1 time2 X2 Y2 time3 X3 Y3 allowing the user to define a time-tagged trajectory

_space_ then allows the user to specify a time pointer (much as is used for [pvoc](../opcodes/pvoc.md), [lpread](../opcodes/lpread.md) and some other units) to have detailed control over the final speed of movement.

## Syntax
=== "Modern"
    ``` csound-orc
    a1, a2, a3, a4  = space(asig, ifn, ktime, kreverbsend, kx, ky)
    ```

=== "Classic"
    ``` csound-orc
    a1, a2, a3, a4  space asig, ifn, ktime, kreverbsend, kx, ky
    ```

### Initialization

_ifn_ -- number of the stored function created using [Gen28](../scoregens/gen28.md). This function generator reads a text file which contains sets of three values representing the xy coordinates and a time-tag for when the signal should be placed at that location. The file should look like:

```
0       -1       1
1        1       1
2        4       4
2.1     -4      -4
3       10     -10
5      -40       0
```

If that file were named &#8220;move&#8221; then the _Gen28_ call in the score would like:

``` csound-sco
f1 0 0 28 "move"
```

_Gen28_ takes 0 as the size and automatically allocates memory. It creates values to 10 milliseconds of resolution. So in this case there will be 500 values created by interpolating X1 to X2 to X3 and so on, and Y1 to Y2 to Y3 and so on, over the appropriate number of values that are stored in the function table. In the above example, the sound will begin in the left front, over 1 second it will move to the right front, over another second it move further into the distance but still in the right front, then in just 1/10th of a second it moves to the left rear, a bit distant. Finally over the last .9 seconds the sound will move to the right rear, moderately distant, and it comes to rest between the two left channels (due west!), quite distant. Since the values in the table are accessed through the use of a time-pointer in the _space_ unit, the actual timing can be made to follow the file's timing exactly or it can be made to go faster or slower through the same trajectory. If you have access to the GUI that allows one to draw and edit the files, there is no need to create the text files manually. But as long as the file is ASCII and in the format shown above, it doesn't matter how it is made!

> :memo: **Important**
>
> If _ifn_ is 0, then _space_ will take its values for the xy coordinates from _kx_ and _ky_.

### Performance

The configuration of the xy coordinates in space places the signal in the following way:

*  a1 is -1, 1
*  a2 is 1, 1
*  a3 is -1, -1
*  a4 is 1, -1

This assumes a loudspeaker set up as a1 is left front, a2 is right front, a3 is left back, a4 is right back. Values greater than 1 will result in sounds being attenuated, as if in the distance. _space_ considers the speakers to be at a distance of 1; smaller values of xy can be used, but _space_ will not amplify the signal in this case. It will, however balance the signal so that it can sound as if it were within the 4 speaker space. x=0, y=1, will place the signal equally balanced between left and right front channels, x=y=0 will place the signal equally in all 4 channels, and so on. Although there must be 4 output signals from _space_, it can be used in a 2 channel orchestra. If the xy's are kept so that y&gt;=1, it should work well to do panning and fixed localization in a stereo field.

_asig_ -- input audio signal.

_ktime_ -- index into the table containing the xy coordinates. If used like:

``` csound-orc
ktime           line  0, 5, 5
a1, a2, a3, a4  space asig, 1, ktime, ...
```

with the file &#8220;move&#8221; described above, the speed of the signal's movement will be exactly as described in that file. However:

```  csound-orc
ktime           line  0, 10, 5
```

the signal will move at half the speed specified. Or in the case of:

``` csound-orc
ktime           line  5, 15, 0
```

the signal will move in the reverse direction as specified and 3 times slower! Finally:

``` csound-orc
ktime           line  2, 10, 3
```

will cause the signal to move only from the place specified in line 3 of the text file to the place specified in line 5 of the text file, and it will take 10 seconds to do it.

_kreverbsend_ -- the percentage of the direct signal that will be factored along with the distance as derived from the xy coordinates to calculate signal amounts that can be sent to reverb units such as _reverb_, or _reverb2_.

_kx, ky_ -- when _ifn_ is 0, _space_ and _spdist_ will use these values as the xy coordinates to localize the signal.

## Examples

Here is an example of the space opcode. It uses the file [space_quad.csd](../examples/space_quad.csd).

``` csound-csd title="Example of the space opcode." linenums="1"
--8<-- "examples/space_quad.csd"
```
In the above example, the signal, _asig_, is moved according to the data in Function #1 indexed by _ktime_. _space_ sends the appropriate amount of the signal internally to _spsend_. The outputs of the _spsend_ are added to global accumulators in a common Csound style and the global signals are used as inputs to the reverb units in a separate instrument.

_space_ can be useful for quad and stereo panning as well as fixed placed of sounds anywhere between two loudspeakers. Below is an example of the fixed placement of sounds in a stereo field using xy values from the score instead of a function table. It uses the file [space_stereo.csd](../examples/space_stereo.csd).

``` csound-csd title="Second example of the space opcode." linenums="1"
--8<-- "examples/space_stereo.csd"
```

[spdist](../opcodes/spdist.md) demonstrates an example of a simple intuitive use of the distance values to simulate Doppler shift.

## See also

[Panning and Spatialization: Amplitude spatialization](../sigmod/panspatl.md)

## Credits

Author: Richard Karpen<br>
Seattle, WA USA<br>
1998<br>

New in Csound version 3.48
