<!--
id:lastcycle
category:Real-time MIDI:Event Extenders
-->
# lastcycle
Indicates whether an event is in its last performance cycle.

Whether an event has a finite duration (p3 > 0) or a note is extended via a time extending opcode (like _linsegr_ or _xtratim_), this opcode returns 1 if the event is currently at its last k-cycle. The only sitatuation where _lastcycle_ does not detect that the event will not run for another cycle is when the note is turned off by another event (using _turnoff2_) and is not given the possibility of running through its release stage (using _turnoff2 instrnum, imode, 0_)

## Syntax
=== "Modern"
    ``` csound-orc
    kflag = lastcycle()
    ```

=== "Classic"
    ``` csound-orc
    kflag lastcycle
    ```

### Performance

_kflag_ -- indicates whether the note is in its _last cycle_. (1 if this the last cycle, otherwise 0)

This opcode is useful for performing cleanup actions, signaling to other events that this event is finishing, etc. It works only at performance time.

### Extra release cycle

During initialization, _lastcycle_ reserves one control cycle of release time if
the instrument has no release time set. This extends the note by `ksmps / sr`
seconds without changing `p3`. It does not add another cycle if release time is
already set. A longer release requested by another opcode takes precedence.

Calling [xtratim](../opcodes/xtratim.md) with 0 does not cancel this extra cycle:
_xtratim_ only increases the release time.

For example, with `sr = 1024`, `ksmps = 16`, and `p3 = 0.0625`, the score duration
covers four control cycles. With _lastcycle_ and no other release extension, the
instrument runs for five cycles in total. [eventcycles](../opcodes/eventcycles.md)
returns indices 0 through 4, and _lastcycle_ returns 1 at index 4, during the extra
release cycle.

## Examples

Here is an example of the lastcycle opcode. It uses the file [lastcycle.csd](../examples/lastcycle.csd).

``` csound-csd title="Example of the lastcycle opcode." linenums="1"
--8<-- "examples/lastcycle.csd"
```

## See also

[Event Extenders](../midi/extender.md)

## Credits

By: Eduardo Moguillansky 2020

New in Csound version 6.14 (2020)
