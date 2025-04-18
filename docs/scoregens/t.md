<!--
id:t
category:
-->
# t Statement (Tempo Statement)
Sets the tempo.

This statement sets the tempo and specifies the accelerations and decelerations for the current section. This is done by converting beats into seconds.

## Syntax
``` csound-orc
t  p1  p2  p3  p4 ... (unlimited)
```

### Initialization

_p1_ -- Must be zero.

_p2_ -- Initial tempo on beats per minute.

_p3, p5, p7,..._ -- Times in beats (in non-decreasing order).

_p4, p6, p8,..._ -- Tempi for the referenced beat times.

### Performance

Time and Tempo-for-that-time are given as ordered couples that define points on a &quot;tempo vs. time&quot; graph. (The time-axis here is in beats so is not necessarily linear.) The beat-rate of a Section can be thought of as a movement from point to point on that graph: motion between two points of equal height signifies constant tempo, while motion between two points of unequal height will cause an accelarando or ritardando accordingly. The graph can contain discontinuities: two points given equal times but different tempi will cause an immediate tempo change.

Motion between different tempos over non-zero time is inverse linear. That is, an accelerando between two tempos M1 and M2 proceeds by linear interpolation of the single-beat durations from 60/M1 to 60/M2.

The first tempo given must be for beat 0.

A tempo, once assigned, will remain in effect from that time-point unless influenced by a succeeding tempo, i.e. the last specified tempo will be held to the end of the section.

A _t statement_ applies only to the score section in which it appears. Only one _t statement_ is meaningful in a section; it can be placed anywhere within that section. If a score section contains no _t statement_, then beats are interpreted as seconds (i.e. with an implicit _t 0 60_ statement).

N.B. If the CSound command includes a [-t flag](../invoke/cs-options-by-category.md#-t-num-temponum), the interpreted tempo of all score _t statements_ will be overridden by the command-line tempo.

## Examples

Here is an example of the t statement. It uses the file [t.csd](../examples/t.csd).

``` csound-csd title="Example of the t statement." linenums="1"
--8<-- "examples/t.csd"
```

## See Also

[Score Statements](../score/statemnt.md)
