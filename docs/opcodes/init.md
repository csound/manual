<!--
id:init
category:Instrument Control:Initialization and Reinitialization
-->
# init
Puts the value of the i-time expression into a k-, a-rate or t- variable.

## Syntax
``` csound-orc
ares init iarg
ires init iarg
kres init iarg
ares, ... init iarg, ...
ires, ... init iarg, ...
kres, ... init iarg, ...
tab init isize[, ival]
```

### Initialization

Puts the value of the i-time expression _iarg_ into a k-, a-rate or t- variable, i.e., initialize the result. Note that _init_ provides the only case of an init-time statement being permitted to write into a perf-time (k- or a-rate) result cell; the statement has no effect at perf-time.

Since version 5.13 it is possible to initialise upto 24 variables of the same class in one statement.  If there are more output variables than input expressions then the last one is repeated.  It is an error to have more inputs than outputs.

The t-variable form was introduced in 5.14 and allocated space for a vector or the given size, initialised to the given value (default value is zero).

## Examples

Here is an example of the init opcode. It uses the file [init.csd](../../examples/init.csd).

``` csound-csd title="Example of the init opcode." linenums="1"
--8<-- "examples/init.csd"
```

Its output should include lines like these:

```
i   1 time     0.00073:     1.00000
i   1 time     0.10014:   138.00000
i   1 time     0.20027:   276.00000
i   1 time     0.30041:   414.00000
i   1 time     0.40054:   552.00000
i   1 time     0.50068:   690.00000
i   1 time     0.60009:   827.00000
i   1 time     0.70023:   965.00000
i   1 time     0.80036:  1103.00000
i   1 time     0.90050:  1241.00000

i   2 time     2.00054:     1.00000
i   2 time     2.09995:     1.00000
i   2 time     2.20009:     1.00000
i   2 time     2.30023:     1.00000
i   2 time     2.40036:     1.00000
i   2 time     2.50050:     1.00000
i   2 time     2.59991:     1.00000
i   2 time     2.70005:     1.00000
i   2 time     2.80018:     1.00000
i   2 time     2.90032:     1.00000
```

## See also

[Initialization and Reinitialization](../../control/reinitn)

[Array opcodes](../../math/array)

## Credits

Init first appeared in the original Csound, but the extension to multiple values is by

Author: John ffitch<br>
University of Bath, and Codemist Ltd.<br>
Bath, UK<br>
February 2010<br>

Multiple form new in version 5.13; t-variable form new in 5.14.
