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
    [xvar,...] perf op:Opcode[,arg1:*,...]
    ```

### Performance

_p4, ..._ -- instrument parameters (k-rate, or a-rate, which is truncated to a scalar)

_err_ -- error code (0 if successful)

_arg1, ..._ -- opcode arguments

_var,..._ -- opcode outputs

These forms execute one performance pass of an instrument instance or opcode object.

For an `Instr` made with [create](create.md), call [init](init.md) before `perf` so its initialization takes place at a known point. If the instance has not been initialized, `perf` attempts to initialize it on its first call using the same p-field arguments.

Do not call `perf` on an instance that Csound already performs through `play`, `schedule` or `splice`. That would perform it twice. A paused instance skips its performance code. Keep the instance in a compatible performance context, with the same sample rate as its caller.

Initialize an opcode object before calling `perf` if that opcode has an initialization routine. Use [run](run.md) to combine initialization and performance in one call, including for an `Opcode[]`.

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

[create](create.md), [init](init.md), [pause](pause.md), [delete](delete.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)


