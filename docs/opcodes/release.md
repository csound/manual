<!--
id:release
category:Real-time MIDI:Event Extenders
-->
# release
Indicates whether a note is in its _release_ stage.

Provides a way of knowing when a note off message for the current note is received. Only a noteoff message with the same MIDI note number as the one which triggered the note will be reported by _release_.

## Syntax
=== "Modern"
    ``` csound-orc
    kflag = release()
    ```

=== "Classic"
    ``` csound-orc
    kflag release
    ```

### Performance

_kflag_ -- indicates whether the note is in its _release_ stage. (1 if a note off is received, otherwise 0)

_release_ outputs current note state. If current note is in the _release_ stage (i.e. if its duration has been extended with [xtratim](../opcodes/xtratim.md) opcode and if it has only just deactivated), then the _kflag_ output argument is set to 1. Otherwise (in sustain stage of current note), _kflag_ is set to 0.

This opcode is useful for implementing complex release-oriented envelopes. When used in conjunction with [xtratim](../opcodes/xtratim.md) it can provide an alternative to the hard-coded behaviour of the "r" opcodes ([linsegr](../opcodes/linsegr.md), [expsegr](../opcodes/expsegr.md) et al), where release time is set to the longest time specified in the active instrument.

## Examples

See the examples for [xtratim](../opcodes/xtratim.md).

## See also

[Event Extenders](../midi/extender.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47
