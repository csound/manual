<!--
id:plusbecomes
category:Instrument Control:Initialization and Reinitialization
-->
# +=
Performs add and assignment.

## Syntax
``` csound-orc
ares += xarg
ires += iarg
kres += karg
table [ kval] += karg
```

Performs an add and assign.

### Initialization

_+=_ - Adds the value of the expression _iarg_ (_karg, xarg_) into the named result. This provides a means of saving an evaluated result for later use.

## Examples

Here is an example of the plusbecomes opcode. It uses the file [reverb.csd](../examples/reverb.csd).

``` csound-csd title="Example of the plusbecomes opcode." linenums="1"
--8<-- "examples/reverb.csd"
```

## See also

[Initialization and Reinitialization](../control/reinitn.md)

## Credits

Author: John ffitch<br>
University of Bath, and Codemist Ltd.<br>
Bath, UK<br>
2013<br>

New in version 6.00
