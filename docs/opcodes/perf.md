<!--
id:perf
category:Instrument Control:Realtime Performance Control
-->

# perf

Execute a performance pass on an instrument or opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    err:k = perf(ins:Instr[, p4:k, ...])
    [var:*,... =] perf(opc:Opcode[,arg1:*,...])
    ```


=== "Classic"
    ``` csound-orc
    kerr perf ins:Instr[, kp4, ...]
    [xvar,...] init op:Opcode[,arg1:*,...]
    ```

### Performance

_p4, ..._ -- instrument parameters (k-rate, or a-rate, which is truncated to a scalar)

_err_ -- error code (0 if successful)

_arg1, ..._ -- opcode arguments

_var,..._ -- opcode outputs

These three versions of perf execute a performance pass of a complete instrument or a single opcode.
Some opcodes and all instruments are required to be initialised first (see [init](../opcodes/init.md)).

Optionally, parameters(pfields) are passed to an instrument `perf()` and are picked up at perf-time. They are normally
k-sig variables but can also be a-sigs in which case the vector is truncated to the first element. 

For the opcode `perf()`, inputs and outputs are checked and should match the opcode object signature. 

## Examples

The following example shows the perf opcode in the context of
instrument and opcode objects,

``` csound-csd title="Examples of instance and opcode perf." linenums="1"
--8<-- "examples/create.csd"
```

## See also

[Initialization and Reinitialization](../control/reinitn.md)


