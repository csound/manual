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
    ```

=== "Classic"
    ``` csound-orc
    turnoff
    turnoff inst
    turnoff knst
    ```

### Initialization

_inst_ -- when used with an i-time parameter, this is the instance handle of an instrument to be turned off (obtained from the nstance opcode).

### Performance

_turnoff_ -- with no parameters this p-time statement enables an instrument to turn itself off. Whether of finite duration or &#8220;held&#8221;, the note currently being performed by this instrument is immediately removed from the active note list. No other notes are affected.

_kinst_ -- when used with an k-time parameter, this is the instance handle of an instrument to be turned off (obtained from the nstance opcode).

## Examples

The following example uses the turnoff opcode. It will cause a note to terminate when a control signal passes a certain threshold (here the Nyquist frequency). It uses the file [turnoff.csd](../examples/turnoff.csd).

``` csound-csd title="Example of the turnoff opcode." linenums="1"
--8<-- "examples/turnoff.csd"
```

## See also

[Duration Control Statements](../control/durctl.md)
