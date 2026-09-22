<!--
id:create
category:Instrument Control:Initialization and Reinitialization
-->

# create
Creates a new instrument definition, instrument instance, or opcode object.

## Syntax
=== "Modern"
    ``` csound-orc
    var:InstrDef = create(code:S)
    var:Instr = create(instr:InstrDef)
    var:Opcode = create(opc:OpcodeDef[,overload:i])
    var:Opcode[] = create(opc:OpcodeDef,len:i[,overload:i])
    ```

=== "Classic"
    ``` csound-orc
    var:InstrDef create Scode
    var:Instr create instr:InstrDef
    var:Opcode create opc:OpcodeDef[,ioverload] 
    var:Opcode[]  create opc:OpcodeDef,ilen[,ioverload] 
    ```

### Initialization

_code_ -- String containing Csound language code for an instrument.

_instr_ -- compiled instrument definition.

_opc_ -- opcode definition, supplied directly or looked up by name with [opcoderef](opcoderef.md)

_overload_ -- (optional, defaults to 0) opcode overload (version) (see
[opcodeinfo](../opcodes/opcodeinfo.md))

_len_ -- opcode object array length.

All forms run at initialization. The string form takes an instrument body without `instr` or `endin`, compiles it and returns an `InstrDef`. [createinstr](createinstr.md) is another name for this form.

`create(definition)` allocates an `Instr` instance without scheduling it. Use [init](init.md) to initialize it, then [perf](perf.md) to run it from the calling instrument. For an instance that Csound performs automatically, use [play](play.md) or [schedule](schedule.md).

The `Opcode` form creates one object from the chosen overload. The array form creates a one-dimensional `Opcode[]` with `len` independent objects. Use a nonnegative integer for `len`. Creating an opcode object does not run its initialization or performance code. Use [run](run.md), or separate [init](init.md) and [perf](perf.md) calls, to execute it.

Arrange [delete](delete.md) in the owning instrument for cleanup. The [object guide](../orch/instrument-and-opcode-objects.md) explains lifetimes and gives examples of each form.

## Examples

Here is an example of the create opcode. It uses the file [create.csd](../examples/create.csd).

``` csound-csd title="Examples of the create opcode." linenums="1"
--8<-- "examples/create.csd"
```

## See also

[Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md), [delete](delete.md), [init](init.md), [perf](perf.md)

## Credits


Author: Victor Lazzarini<br>
Maynooth University<br>
Ireland<br>
Csound 7, 2024<br>
