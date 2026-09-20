<!--
id:str
category:Instrument Control:Initialization and Reinitialization
-->
# str
Returns the name of an instrument definition.

## Syntax

=== "Modern"
    ``` csound-orc
    Sname = str(definition)
    ```

=== "Classic"
    ``` csound-orc
    Sname str definition
    ```

### Initialization

`definition` is an `InstrDef` for a named instrument. `Sname` receives its name as a string. The conversion runs once at initialization.

Use this when you have a typed definition and need its name for a message or another opcode that takes a string. For example, `str(Tone)` returns `"Tone"`.

Use `str` with named definitions. An unnamed definition, such as one compiled from an instrument body with [create](create.md), has no name to return. Use [instrnum](instrnum.md) to obtain its number instead. To look up a name from a number, use [instrstr](instrstr.md).

## Examples

The example prints the name from an `InstrDef`, then looks up the same name from its instrument number. It uses [instrument-names.csd](../examples/instrument-names.csd).

``` csound-csd title="Convert an instrument definition to a name" linenums="1"
--8<-- "examples/instrument-names.csd"
```

## See also

[instrnum](instrnum.md), [instrstr](instrstr.md), [create](create.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini.

New in Csound 7.
