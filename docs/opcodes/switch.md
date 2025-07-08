<!--
id:switch
category:Instrument Control:Program Flow Control
-->
# switch
Branches conditionally at initialization or during performance time.

## Syntax
``` csound-orc
switch expr
case case-const
...
case case-const
...
default
...
endsw
```

where _expr_ is evaluated at init or perf-time and if its result is
matched by a _case-const_, then the code between this case and the
next is executed. The _default_ section is executed if no case 
is selected.

## Examples

Here is an example of _switch_. It uses the file [switch.csd](../examples/switch.csd).

``` csound-csd title="Examples of switch-case expressions." linenums="1"
--8<-- "examples/switch.csd"
```

## See also

[Program Flow Control](../control/pgmctl.md)

## Credits

Author: Hlodver Sigurdsson
New in Csound 7
