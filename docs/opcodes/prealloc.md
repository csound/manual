<!--
id:prealloc
category:Instrument Control:Realtime Performance Control
-->
# prealloc
Creates space for instruments but does not run them.

## Syntax
=== "Modern"
    ``` csound-orc
    prealloc(insnum, icount)
    prealloc("insname", icount)
    ```

=== "Classic"
    ``` csound-orc
    prealloc insnum, icount
    prealloc "insname", icount
    ```

### Initialization

_insnum_ -- instrument number

_icount_ -- number of instrument allocations

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

### Performance

All instances of _prealloc_ must be defined in the header section, not in the instrument body.

## Examples

Here is an example of the prealloc opcode. It uses the file [prealloc.csd](../examples/prealloc.csd).

``` csound-csd title="Example of the prealloc opcode." linenums="1"
--8<-- "examples/prealloc.csd"
```

## See also

[Real-time Performance Control](../control/realtime.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
July 1999<br>

Example written by Kevin Conder.

New in Csound version 3.57
