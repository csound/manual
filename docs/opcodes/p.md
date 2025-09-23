<!--
id:p
category:Instrument Control:Initialization and Reinitialization
-->
# p
Show the value in a given p-field.

## Syntax
``` csound-orc
p(x)
```

This function works at i-rate and k-rate.

### Initialization

_x_ -- the number of the p-field.

### Performance

The value returned by the _p_ function is the value in a p-field.

## Examples

Here is an example of the p opcode. It uses the file [p.csd](../examples/p.csd).

``` csound-csd title="Example of the p opcode." linenums="1"
--8<-- "examples/p.csd"
```

Its output should include lines like:

```
random number is now 105.248963
random number is now 32.504969
random number is now 139.496898
```

## See also

[Initialization and Reinitialization](../control/reinitn.md)
