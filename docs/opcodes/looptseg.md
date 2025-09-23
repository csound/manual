<!--
id:looptseg
category:Signal Generators:Linear and Exponential Generators
-->
# looptseg
Generate control signal consisting of exponential or linear segments delimited by two or more specified points.

The entire envelope is looped at _kfreq_ rate. Each parameter can be varied at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    ksig = looptseg(kfreq, ktrig, iphase, kvalue0, ktype0, ktime0, [, kvalue1] \
                    [,ktype1] [, ktime1] [, kvalue2] [,ktype2] [, ktime2] [...] \
                    [, kvalueN] [,ktypeN] [, ktimeN])
    ```

=== "Classic"
    ``` csound-orc
    ksig looptseg kfreq, ktrig, iphase, kvalue0, ktype0, ktime0, [, kvalue1] \
                  [,ktype1] [, ktime1] [, kvalue2] [,ktype2] [, ktime2] [...] \
                  [, kvalueN] [,ktypeN] [, ktimeN]
    ```

### Initialization

_iphase_ -- A value between 0 and 1 to say where to start the loop.  Zero, the commonest value, indicates the beginning.

### Performance

_ksig_ -- Output signal.

_kfreq_ -- Repeat rate in Hz or fraction of Hz.

_ktrig_ -- If non-zero, retriggers the envelope from start (see [trigger opcode](../opcodes/trigger.md)), before the envelope cycle is completed.

_kvalue0...kvalueN_ -- Values of points

_ktime0...ktimeN_ -- Times between points; expressed in fractions of a cycle (see below). The final time designates a ramp between the final value and the first value.

_ktype0...ktypeN_ -- shape of the envelope.  If the value is 0 then the shap eis linear; otherwise it is an concave exponential (positive type) or a convex exponential (negative type).

_looptseg_ opcode is similar to [transeg](../opcodes/transeg.md), but the entire envelope is looped at _kfreq_ rate. Notice that times are not expressed in seconds but in fraction of a cycle. Actually each duration represent is proportional to the other, and the entire cycle duration is proportional to the sum of all duration values.

The sum of all duration is then rescaled according to _kfreq_ argument. For example, considering an envelope made up of 3 segments, each segment having 100 as duration value, their sum will be 300. This value represents the total duration of the envelope, and is actually divided into 3 equal parts, a part for each segment.

Actually, the real envelope duration in seconds is determined by _kfreq_. Again, if the envelope is made up of 3 segments, but this time the first and last segments have a duration of 50, whereas the central segment has a duration of 100 again, their sum will be 200. This time 200 represent the total duration of the 3 segments, so the central segment will be twice as long as the other segments.

All parameters can be varied at k-rate.  Negative frequency values are allowed, reading the envelope backward.  _ktime0_ should always be set to 0, except if the user wants some special effect.

## Examples

Here is an example of the looptseg opcode. It uses the file [looptseg.csd](../examples/looptseg.csd).

``` csound-orc title="Example of the looptseg opcode." linenums="1"
--8<-- "examples/looptseg.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch

New in Version 5.12
