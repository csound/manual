<!--
id:unschedule
category:Instrument Control:Invocation
-->
# unschedule
Removes the first matching queued note event.

Use it to cancel a note queued by [schedule](schedule.md) before the note starts.

## Syntax

=== "Modern"
    ``` csound-orc
    unschedule(instrument, iStart, iDuration[, ip4, ip5, ...])
    ```

=== "Classic"
    ``` csound-orc
    unschedule instrument, iStart, iDuration[, ip4, ip5, ...]
    ```

### Initialization

`instrument` is an instrument number, a name string or an `InstrDef` reference.

`iStart` is the queued event's stored start position in beats from the start of the current score section. It is not a delay from this call.

`iDuration` must match the event's stored duration. Positive durations use beats. At the default tempo of 60 beats per minute, beats and seconds have the same length.

`ip4, ip5, ...` must match the event's remaining p-fields, including strings. Supply every p-field in order. The number of arguments must also match.

`unschedule` runs once at initialization and returns no value. Numeric values must match exactly. If nothing matches, nothing happens.

Use [unscheduleall](unscheduleall.md) to remove every matching event.

Only pending orchestra-generated note events are eligible. Active notes keep playing, and future notes written in the score stay in the score. Use [turnoff2](turnoff2.md) to stop active notes.

When you queue a note at the start of a section at tempo 60, you can use the same start and duration values for both calls, as the example does. For notes queued later, repeating the original delay may fail to match the stored start position. Time conversions and rounding can also prevent an exact match.

## Examples

The example queues duplicate notes, then cancels one copy of the 440 Hz note and both copies of the 660 Hz note. The 880 Hz note has a different p4, so it stays in the queue. You hear 440 Hz followed by 880 Hz.

It uses [unschedule.csd](../examples/unschedule.csd).

``` csound-csd title="Cancel matching queued notes" linenums="1"
--8<-- "examples/unschedule.csd"
```

## See also

[unscheduleall](unscheduleall.md), [schedule](schedule.md), [turnoff2](turnoff2.md), [Instrument Invocation](../control/invocat.md)

## Credits

Author Victor Lazzarini.

New in Csound 7.
