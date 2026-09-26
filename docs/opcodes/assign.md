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
fres = farg
ires, ... = iarg, ...
kres, ... = karg, ...
table [ kval] = karg
```

### Initialization

_=_ (simple assignment) - Put the value of the expression _iarg_ (_karg, xarg_) into the named result. This provides a means of saving an evaluated result for later use.

From version 5.13 onwards the i- and k-rate versions of assignment can take a number of outputs, and an equal or less number of inputs.  If there are less the last value is repeated as necessary.

From version 5.14 values can be assigned to elements of a vector with the square bracket form.

For an f-signal, assignment copies the source's properties and current data at initialization. The destination has its own data, including for sliding signals and partial tracks. Assigning an f-signal to itself leaves it unchanged.

### Performance

F-signal assignment copies new source frames whenever the statement runs. If a conditional skips the statement, the destination keeps its last copy. When assignment resumes, it copies the current source frame; it does not replay missed frames. Sliding signals copy the current block of sample frames each time the statement runs.

When several statements assign to the same f-signal, their sources must have the same FFT size, hop size, window size, window type, format and sliding mode. Assignment does not convert between these properties. To change them, reinitialize the source, destination and any opcodes that use the destination.

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
