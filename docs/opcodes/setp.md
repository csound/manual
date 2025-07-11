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

_num_ -- parameter number

_val_ -- parameter value


The opcode sets the value of a parameter (pfield) defined by an instrument at
performance time. If the parameter has not been defined, the opcode is a non-op.
This opcode can modify the value of a parameter during an instrument performance.
If the parameter is only used at i-time (e.g. p3 setting duration), then there will be no effect at performance time.

## Examples

``` csound-csd title="Example of setp." linenums="1"
--8<-- "examples/create.csd"
```

## See also

[Initialization and Reinitialization](../control/reinitn.md)


