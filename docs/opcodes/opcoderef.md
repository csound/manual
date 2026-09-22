<!--
id:opcoderef
category:Instrument Control:Initialization and Reinitialization
-->
# opcoderef
Gets an opcode definition by name.

Use `opcoderef` when an opcode name comes from a string, such as a score parameter or a configuration choice. It returns an `OpcodeDef` that you can pass to [create](create.md).

## Syntax

=== "Modern"
    ``` csound-orc
    definition:OpcodeDef = opcoderef(Sname)
    ```

=== "Classic"
    ``` csound-orc
    definition:OpcodeDef opcoderef Sname
    ```

### Initialization

`Sname` is the name of an available opcode, such as `"oscili"`. Names are case-sensitive. A user-defined opcode can also be looked up once its definition has been compiled. An unknown name causes an initialization error.

`definition` holds the opcode definition and its available overloads. The lookup runs at initialization. Changing `Sname` during performance does not change the result.

`opcoderef` does not create or run an opcode object. Pass the definition to [create](create.md) to make an `Opcode`, then use `run` or separate [init](init.md) and [perf](perf.md) calls to execute it. Arrange [delete](delete.md) for the created object when its containing instrument ends.

An overload is a version of an opcode with a particular set of input and output types. Use [opcodeinfo](opcodeinfo.md) to list the definition's overloads, then choose one with the zero-based overload argument to `create`. The default is 0.

A suffix after a dot does not select an overload in this lookup. For example, `opcoderef("oscili.kk")` returns the same set of overloads as `opcoderef("oscili")`.

When the name is fixed in the orchestra, you can use its `OpcodeDef` directly, as in `create(oscili)`. Initializing an `OpcodeDef` from a string also uses the same lookup.

``` csound-orc
 definition:OpcodeDef init "oscili"
```

## Examples

This example chooses an oscillator from a name in score field p4. The same instrument plays a sine wave with `oscili`, then a sawtooth wave with `vco2`. Both use overload 0 with amplitude and frequency inputs. Other opcode choices may need different arguments or an explicit overload number.

It uses [opcoderef.csd](../examples/opcoderef.csd).

``` csound-csd title="Choose an oscillator by its name" linenums="1"
--8<-- "examples/opcoderef.csd"
```

## See also

[opcodeinfo](opcodeinfo.md), [create](create.md), [init](init.md), [perf](perf.md), [delete](delete.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini, 2024.

New in Csound 7.
