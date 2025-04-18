<!--
id:v
category:
-->
# v Statement
Provides for locally variable time warping of score events.

## Syntax
``` csound-orc
v p1
```

### Initialization

_p1_ -- Time warp factor (must be positive).

### Performance

The _v statement_ takes effect with the following [i statement](../scoregens/i.md), and remains in effect until the next [v statement](../scoregens/v.md), [s statement](../scoregens/s.md), or [e statement](../scoregens/e.md).

## Examples

The value of p1 is used as a multiplier for the start times (p2) of subsequent [i statements](../scoregens/i.md).

``` csound-sco
; note1
v2
; note2
```

In this example, the second note occurs two beats after the first note, and is twice as long.

Although the _v statement_ is similar to the [t statement](../scoregens/t.md), the _v statement_ is local in operation. That is, _v_ affects only the following notes, and its effect may be cancelled or changed by another _v statement_.

Carried values are unaffected by the _v statement_ (see [Carry](../score/preproc.md#carry)).

``` csound-sco
i1   0 1
v2
i.   + .
i.   . .
```

In this example, the _v statement_ has no effect.

## Examples

Here is an example of the v statement. It uses the file [v.csd](../examples/v.csd).

``` csound-csd title="Example of the v statement." linenums="1"
--8<-- "examples/v.csd"
```

In this example, note3 and note5 occur simultaneously, while note4 actually occurs before note3, that is, at its original place. Durations are unaffected.

## See Also

[Score Statements](../score/statemnt.md)
