<!--
id:systime
category:Instrument Control:Time Reading
-->
# systime
Returns a monotonic system clock reading rounded to milliseconds.

Subtract two readings to measure elapsed real time. The clock's starting point is set by the operating system, so the absolute value is not a calendar date or the time since Csound started.

## Syntax

=== "Modern"
    ``` csound-orc
    itime = systime()
    ktime = systime()
    ```

=== "Classic"
    ``` csound-orc
    itime systime
    ktime systime
    ```

### Initialization and performance

There are no input arguments. The i-rate form reads the clock once during initialization. The k-rate form reads it at initialization and on every control cycle.

`itime` and `ktime` are in milliseconds. Divide a difference by 1000 to obtain seconds. With clock support enabled, the opcode reads `CLOCK_MONOTONIC` and rounds the result to the nearest whole millisecond. Changing the calendar clock does not reset this clock.

Several control cycles can return the same value. Rounding to milliseconds does not guarantee that the underlying clock has millisecond resolution. Single-precision Csound builds can also lose small differences when the absolute clock reading is large.

This measures real time passing, including time spent waiting. It does not measure CPU use or the number of audio samples processed. An offline render can advance several seconds of score time while `systime` advances by only a few milliseconds. Use [elapsedtime](elapsedtime.md) for time within the performance or [eventtime](eventtime.md) for time within a note.

### Platform availability and fallback

The opcode is included in the non-Windows `cpumeter` module. Windows builds exclude this module and do not provide `systime`.

On other platforms, a working clock reading requires the build setting `HAVE_CLOCK_GETTIME`. The macOS CMake build enables it when it finds `clock_gettime`. Linux and other non-Windows builds also need this setting enabled, even if the operating system provides the function.

Without that setting, both forms return 0 on every call. This is a compile-time fallback, not a measurement of zero elapsed time. The opcode does not switch to another clock or report an error for this fallback. A single zero reading cannot establish whether clock support is present.

## Examples

The example takes an initial clock reading, then prints the difference in milliseconds beside the elapsed performance time in seconds. Silent audio output keeps the performance running at real-time speed for two seconds.

Run it with `-n` instead of audio output to compare an offline render. The performance time still advances through the score, while the measured clock difference reflects how long the render takes. A build using the fallback prints zero clock differences throughout.

It uses [systime.csd](../examples/systime.csd).

``` csound-csd title="Compare elapsed real time with performance time" linenums="1"
--8<-- "examples/systime.csd"
```

## See also

[elapsedtime](elapsedtime.md), [eventtime](eventtime.md), [rtclock](rtclock.md), [date](date.md), [Time Reading](../control/timeread.md)

## Credits

Author Victor Lazzarini, 2015.
