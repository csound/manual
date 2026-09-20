<!--
id:setp
category:Instrument Control:Realtime Performance Control
-->

# setp

Set the value of an instrument parameter.

## Syntax
=== "Modern"
    ``` csound-orc
    setp(ins:Instr,num:k,val:k)
    ```

=== "Classic"
    ``` csound-orc
    setp ins:Instr,knum,kval
    ```

### Performance

_ins_ -- instrument instance

_num_ -- positive integer p-field number, such as 4 for p4 or 5 for p5

_val_ -- parameter value


The opcode sets the value of a parameter (pfield) defined by an instrument at
performance time. If the parameter has not been defined, the opcode is a non-op.
This opcode can modify the value of a parameter during an instrument performance.
If the parameter is only used at i-time (e.g. p3 setting duration), then there will be no effect at performance time.

## Examples


The controller changes p5 during performance. The `poscil` inside `Tone` reads p5 for its frequency on each control cycle. It uses [instance-controls.csd](../examples/instance-controls.csd).

``` csound-csd title="Change the pitch of an existing voice" linenums="1"
--8<-- "examples/instance-controls.csd"
```


## See also

[play](play.md), [pause](pause.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)


