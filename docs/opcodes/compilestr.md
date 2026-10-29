<!--
id:compilestr
category:Instrument Control:Compilation
-->
# compilestr
Compiles a new orchestra passed in as an ASCII string.

Compilestr will compile one or more instruments at init time, which will be added to the running engine. In case of existing instrument numbers or names, these will be replaced, but any instance still running of the old instrument definition will still perform until it terminates. Only new instances will use the new definition. Multi-line strings are accepted, using {{  }} to enclose the string.

Use `compilestr` with the existing instrument number or name to replace a definition while keeping its number. Include the `instr` and `endin` statements in the string. By contrast, [create](create.md) and [createinstr](createinstr.md) compile an instrument body into a new definition in a free number slot; assigning that result to an existing `InstrDef` variable does not replace its previous definition.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = compilestr(Sorch)
    ```

=== "Classic"
    ``` csound-orc
    ires compilestr Sorch
    ```

### Initialization

_&#8220;Sorch&#8221;_ --  a string (in double-quotes or enclosed by {{ }}) containing one or more instruments.

_ires_ --  returns 0 if compilation was successful, or -1 if not.

## Examples

=== "Modern"
    Here is an example of the compilestr opcode. It uses the file [compilestr-modern.csd](../examples/compilestr-modern.csd).

    ``` csound-csd title="Example of the compilestr opcode." linenums="1"
    --8<-- "examples/compilestr-modern.csd"
    ```

=== "Classic"
    Here is an example of the compilestr opcode. It uses the file [compilestr.csd](../examples/compilestr.csd).

    ``` csound-csd title="Example of the compilestr opcode." linenums="1"
    --8<-- "examples/compilestr.csd"
    ```

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

Author: Victor Lazzarini, 2013
