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
    var:Opcode = create(opc:OpcodeDef[,overload:i]
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

_opc_ -- opcode definition

_overload_ -- (optional, defaults to 0) opcode overload (version) (see
[opcodeinfo](../opcodes/opcodeinfo.md))

_len_ -- opcode object array length.

The first version takes Csound code on a string, compiles it, and returns an instrument definition. The
second takes an instrument definition and instantiates it, returning
the instrument instance. The third creates an opcode object from one
of the predefined opcode overloads. The final version creates an array
of opcode objects of the same OpcodeDef type and overload.

## Examples

Here is an example of the create opcode. It uses the file [create.csd](../examples/create.csd).

``` csound-csd title="Examples of the create opcode." linenums="1"
--8<-- "examples/create.csd"
```

## Credits


Author: Victor Lazzarini<br>
Maynooth University<br>
Ireland<br>
Csound 7, 2024<br>
