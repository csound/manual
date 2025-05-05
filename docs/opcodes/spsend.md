<!--
id:spsend
category:Signal Modifiers:Panning and Spatialization
-->
# spsend
Generates output signals based on a previously defined [space](../opcodes/space.md) opcode.

The output signals from _spsend_ are derived from the values given for xy and reverb in the _space_ and are ready to be sent to local or global reverb units (see example below).

## Syntax
=== "Modern"
    ``` csound-orc
    a1, a2, a3, a4 = spsend()
    ```

=== "Classic"
    ``` csound-orc
    a1, a2, a3, a4 spsend
    ```

### Performance

The configuration of the xy coordinates in space places the signal in the following way:

*  a1 is -1, 1
*  a2 is 1, 1
*  a3 is -1, -1
*  a4 is 1, -1

This assumes a loudspeaker set up as a1 is left front, a2 is right front, a3 is left back, a4 is right back. Values greater than 1 will result in sounds being attenuated, as if in the distance. _space_ considers the speakers to be at a distance of 1; smaller values of xy can be used, but _space_ will not amplify the signal in this case. It will, however balance the signal so that it can sound as if it were within the 4 speaker _space_.  x=0, y=1, will place the signal equally balanced between left and right front channels, x=y=0 will place the signal equally in all 4 channels, and so on. Although there must be 4 output signals from _space_, it can be used in a 2 channel orchestra. If the xy's are kept so that Y&gt;=1, it should work well to do panning and fixed localization in a stereo field.

## Examples

Here is a stereo example of the spsend opcode. It uses the file [spsend.csd](../examples/spsend.csd).

``` csound-csd title="Example of the spsend opcode." linenums="1"
--8<-- "examples/spsend.csd"
```

## See also

[Panning and Spatialization: Amplitude spatialization](../sigmod/panspatl.md)

## Credits

Author: Richard Karpen<br>
Seattle, WA USA<br>
1998<br>

New in Csound version 3.48
