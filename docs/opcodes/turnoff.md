<!--
id:turnoff
category:Instrument Control:Duration Control
-->
# turnoff
Enables an instrument to turn itself off or to turn an instance of another instrument off.

## Syntax
=== "Modern"
    ``` csound-orc
    turnoff()
    turnoff(inst)
    turnoff(knst)
    turnoff(voice)
    turnoff(voice, kStop)
    ```

=== "Classic"
    ``` csound-orc
    turnoff
    turnoff inst
    turnoff knst
    turnoff voice
    turnoff voice, kStop
    ```

### Initialization

_inst_ -- when used with an i-time parameter, this is the instance handle of an instrument to be turned off (obtained from the nstance opcode).

### Performance

_turnoff_ -- with no parameters this p-time statement enables an instrument to turn itself off. Whether of finite duration or &#8220;held&#8221;, the note currently being performed by this instrument is immediately removed from the active note list. No other notes are affected.

_kinst_ -- when used with an k-time parameter, this is the instance handle of an instrument to be turned off (obtained from the nstance opcode).

### Instrument references in Csound 7

`voice` is an `Instr` reference, obtained from [play](play.md), [getinstance](getinstance.md), or the instance-returning form of [schedule](schedule.md). Use the reference only while its instance is available.

`turnoff(voice)` requests turn-off at initialization. `turnoff(voice, kStop)` checks the trigger at performance time. Use 0 to leave the instance running and 1 to request turn-off. Any release extension still applies.

This affects only the referenced instance. It does not remove its `InstrDef`. Use [delete](delete.md) for cleanup of manually owned objects when the containing instrument ends.

## Examples

The following example uses the turnoff opcode. It will cause a note to terminate when a control signal passes a certain threshold (here the Nyquist frequency). It uses the file [turnoff.csd](../examples/turnoff.csd).

``` csound-csd title="Example of the turnoff opcode." linenums="1"
--8<-- "examples/turnoff.csd"
```

## See also

[play](play.md), [isreleasing](isreleasing.md), [delete](delete.md), [Duration Control Statements](../control/durctl.md)
