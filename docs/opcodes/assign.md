<!--
id:assign
category:Instrument Control:Initialization and Reinitialization
-->
# =
Performs a simple assignment.

## Syntax
``` csound-orc
ares = xarg
ires = iarg
kres = karg
ires, ... = iarg, ...
kres, ... = karg, ...
table [ kval] = karg
```

### Initialization

_=_ (simple assignment) - Put the value of the expression _iarg_ (_karg, xarg_) into the named result. This provides a means of saving an evaluated result for later use.

From version 5.13 onwards the i- and k-rate versions of assignment can take a number of outputs, and an equal or less number of inputs.  If there are less the last value is repeated as necessary.

From version 5.14 values can be assigned to elements of a vector with the square bracket form.

## Examples

=== "Modern"
    Here is an example of the assign opcode. It uses the file [assign-modern.csd](../examples/assign-modern.csd).
    ``` csound-csd title="Example of the assign opcode." linenums="1"
    --8<-- "examples/assign-modern.csd"
    ```

=== "Classic"
    Here is an example of the assign opcode. It uses the file [assign.csd](../examples/assign.csd).
    ``` csound-csd title="Example of the assign opcode." linenums="1"
    --8<-- "examples/assign.csd"
    ```

Its output should include a line like this:

```
instr 1:  i1 = 1234.000
```

## See also

[Initialization and Reinitialization](../control/reinitn.md)

[Array opcodes](../math/array.md)

## Credits

Example written by Kevin Conder.

The extension to multiple values is by

Author: John ffitch<br>
University of Bath, and Codemist Ltd.<br>
Bath, UK<br>
February 2010<br>

New in version 5.13
