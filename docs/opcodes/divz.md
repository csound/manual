<!--
id:divz
category:Mathematical Operations:Opcode Equivalents of Functions
-->
# divz
Safely divides two numbers.

## Syntax
``` csound-orc
ares divz xa, xb, ksubst
ires divz ia, ib, isubst
kres divz ka, kb, ksubst
 ... divz(ka, kb, ksubst)... (no rate restriction)
```

### Initialization

Whenever _b_ is not zero, set the result to the value _a / b_; when _b_ is zero, set it to the value of _subst_ instead.

## Examples

Here is an example of the divz opcode. It uses the file [divz.csd](../examples/divz.csd).

``` csound-csd title="Example of the divz opcode." linenums="1"
--8<-- "examples/divz.csd"
```

Its output should include lines like:

```
200.000000 / 0.000000 = -1.000000
200.000000 / 66.757370 = 2.995924
200.000000 / 133.514739 = 1.497962
```

## See also

[Opcode Equivalents of Functions](../math/opeqfunc.md)

## Credits

Author: John ffitch after an idea by Barry L. Vercoe

Example written by Kevin Conder.

Functional form available in csound Version 6.00
