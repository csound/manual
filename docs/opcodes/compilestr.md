<!--
id:compilestr
category:Instrument Control:Compilation
-->
# compilestr
Compiles a new orchestra passed in as an ASCII string.

Compilestr will compile one or more instruments at init time, which will be added to the running engine. In case of existing instrument numbers or names, these will be replaced, but any instance still running of the old instrument definition will still perform until it terminates. Only new instances will use the new definition. Multi-line strings are accepted, using {{  }} to enclose the string.

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
