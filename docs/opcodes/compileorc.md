<!--
id:compileorc
category:Instrument Control:Compilation
-->
# compileorc
Compiles a new orchestra from an ASCII file.

Compileorc will compile one or more instruments at init time, which will be added to the running engine. In case of existing instrument numbers or names, these will be replaced, but any instance still running of the old instrument definition will still perform until it terminates.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = compileorc(Sfilename)
    ```

=== "Classic"
    ``` csound-orc
    ires compileorc Sfilename
    ```

### Initialization

_&#8220;Sfilename&#8221;_ --  a string containing the name of the file containing the orchestra.

_ires_ --  returns 0 if compilation was successful, or -1 if not.

## Examples

=== "Modern"
    Here is an example of the compileorc opcode. It uses the file [compileorc-modern.csd](../examples/compileorc-modern.csd).
    ``` csound-csd title="Example of the compileorc opcode." linenums="1"
    --8<-- "examples/compileorc-modern.csd"
    ```

=== "Classic"
    Here is an example of the compileorc opcode. It uses the file [compileorc.csd](../examples/compileorc.csd).
    ``` csound-csd title="Example of the compileorc opcode." linenums="1"
    --8<-- "examples/compileorc.csd"
    ```

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

Author: Victor Lazzarini, 2013
