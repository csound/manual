<!--
id:exitnowk
category:Instrument Control:Realtime Performance Control
-->
# exitnowk
Stops the whole Csound performance at k-rate with an exit status.

## Syntax

=== "Modern"
    ``` csound-orc
    exitnowk(kStatus)
    ```

=== "Classic"
    ``` csound-orc
    exitnowk kStatus
    ```

### Performance

`kStatus` is the requested exit status. This argument is required. The opcode has no output.

Every call stops performance, including a call with a status of 0. To wait for a condition, put `exitnowk` inside a k-rate `if` statement. An unconditional call stops Csound on the first control cycle that reaches it.

The exit affects all instruments and pending events. It does not wait for release envelopes or add a fade. Fade the sound before calling it if you need a smooth ending. To stop one note while the rest of the piece continues, use [turnoff](turnoff.md).

Use [exitnow](exitnow.md) for an exit at initialization. `exitnowk` runs during performance, so it can respond directly to a control signal or a check made at k-rate.

### Exit status

Use a whole number from 0 to 255. Zero requests a successful exit. A nonzero value lets a calling script detect a failure.

Csound uses the magnitude of the status and keeps its lowest eight bits. For example, `exitnowk(-1)` and `exitnowk(1)` both give command-line status 1. Values outside the range wrap, so 256 requests the same status as 0. A request for status 0 does not clear errors that Csound has already recorded.

When Csound runs inside another program, this opcode returns control through Csound's performance API. The host decides whether its own process exits.

## Examples

A live patch can use `exitnowk` to stop when a control signal reaches a limit. This example uses elapsed time for that signal and fades a tone to silence before exiting after two seconds, even though the score requests ten seconds. It uses [exitnowk.csd](../examples/exitnowk.csd).

``` csound-csd title="Stop performance after a fade" linenums="1"
--8<-- "examples/exitnowk.csd"
```

The last score value, p4, selects the status. Leave it at 0 for a successful exit, or change it to 1 to report failure to a calling script. The example prints `Stopping after two seconds` in either case.

## See also

[exitnow](exitnow.md), [turnoff](turnoff.md), [Real-time Performance Control](../control/realtime.md)

## Credits

Original `exitnow` by Gabriel Maldonado. Steven Yi added the performance-time `exitnowk` form in March 2026.

New in Csound 7.
