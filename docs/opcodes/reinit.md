<!--
id:reinit
category:Instrument Control:Initialization and Reinitialization
-->
# reinit
Suspends a performance while a special initialization pass is executed.

Whenever this statement is encountered during a p-time pass, performance is temporarily suspended while a special Initialization pass, beginning at _label_ and continuing to _rireturn_ or _endin_, is executed. Performance will then be resumed from where it left off.

## Syntax
``` csound-orc
reinit label
```

## Examples

The following statements will generate an exponential control signal whose value moves from 440 to 880 exactly ten times over the duration p3. They use the file [reinit.csd](../../examples/reinit.csd).

``` csound-csd title="Example of the reinit opcode." linenums="1"
--8<-- "examples/reinit.csd"
```

A musical example featuring the reinit opcode: [Reinit_Giordani.csd](../../examples/musical/Reinit_Giordani.csd) by Eugenio Giordani.

## See also

[Initialization and Reinitialization](../../control/reinitn)
