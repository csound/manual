<!--
id:q
category:
-->
# q Statement
This statement may be used to quiet an instrument.

## Syntax
``` csound-orc
q p1  p2  p3
```

### Performance

_p1_ -- Instrument number to mute/unmute.

_p2_ -- Action time in beats.

_p3_ -- determines whether the instrument is muted/unmuted. The value of 0 means the instrument is muted, other values mean it is unmuted.

Note that this does not affect instruments that are already running at time _p2_. It blocks any attempt to start one afterwards.

## Examples

Here is an example of the q statement. It uses the file [q.csd](../examples/q.csd).

``` csound-csd title="Example of the q statement." linenums="1"
--8<-- "examples/q.csd"
```

## See Also

[Score Statements](../score/statemnt.md)
