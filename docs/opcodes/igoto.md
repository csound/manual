<!--
id:igoto
category:Instrument Control:Program Flow Control
-->
# igoto
During the i-time pass only, unconditionally transfer control to the statement labeled by _label_.

## Syntax
``` csound-orc
igoto label
```

where _label_ is in the same instrument block and is not an expression.

## Examples

Here is an example of the igoto opcode. It uses the file [igoto.csd](../../examples/igoto.csd).

``` csound-csd title="Example of the igoto opcode." linenums="1"
--8<-- "examples/igoto.csd"
```

Its output should include lines like this:

```
instr 1:  iparam = 0.000
instr 1:  ifreq = 440.000
instr 1:  iparam = 1.000
instr 1:  ifreq = 880.000
```

## See also

[Program Flow Control](../../control/pgmctl)

## Credits

Example written by Kevin Conder.
