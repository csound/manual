<!--
id:mute
category:Instrument Control:Invocation
-->
# mute
Mutes/unmutes new instances of a given instrument.

## Syntax
=== "Modern"
    ``` csound-orc
    mute(insnum [, iswitch])
    mute("insname" [, iswitch])
    ```

=== "Classic"
    ``` csound-orc
    mute insnum [, iswitch]
    mute "insname" [, iswitch]
    ```

### Initialization

_insnum_ -- instrument number. Equivalent to _p1_ in a score [i statement](../scoregens/i.md).

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

_iswitch_ (optional, default=0) -- represents a switch to mute/unmute an instrument. A value of 0 will mute new instances of an instrument, other values will unmute them. The default value is 0.

### Performance

All new instances of instrument inst will me muted (iswitch = 0) or unmuted (iswitch not equal to 0). There is no difficulty with muting muted instruments or unmuting unmuted instruments. The mechanism is the same as used by the score [q statement](../scoregens/q.md). For example, it is possible to mute in the score and unmute in some instrument.

Muting/Unmuting is indicated by a message (depending on message level).

## Examples

Here is an example of the mute opcode. It uses the file [mute.csd](../examples/mute.csd).

``` csound-csd title="Example of the mute opcode." linenums="1"
--8<-- "examples/mute.csd"
```

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

New in version 4.22
