<!--
id:compilecsd
category:Instrument Control:Compilation
-->
# compilecsd
Compiles a new orchestra from an ASCII file.

Compilecsd will read a CSD file and compile one or more instruments at init time, which will be added to the running engine. In case of existing instrument numbers or names, these will be replaced, but any instance still running of the old instrument definition will still perform until it terminates. In addition, it will read the score (if it exists) contained in the CSD file and add it to the list of events to be performed by Csound. The opcode ignores any section in the CSD file that is not the orchestra or the score.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = compilecsd(Sfilename)
    ```

=== "Classic"
    ``` csound-orc
    ires compilecsd Sfilename
    ```

### Initialization

_&#8220;Sfilename&#8221;_ --  a string containing the name of the file containing the orchestra.

_ires_ --  returns 0 if compilation was successful, or -1 if not.

## Examples

=== "Modern"
    Here is an example of the compilecsd opcode. It uses the file [compilecsd-modern.csd](../examples/compilecsd-modern.csd).
    ``` csound-csd title="Example of the compilecsd opcode." linenums="1"
    --8<-- "examples/compilecsd-modern.csd"
    ```

=== "Classic"
    Here is an example of the compilecsd opcode. It uses the file [compilecsd.csd](../examples/compilecsd.csd).
    ``` csound-csd title="Example of the compilecsd opcode." linenums="1"
    --8<-- "examples/compilecsd.csd"
    ```

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

Author: Victor Lazzarini, 2013
