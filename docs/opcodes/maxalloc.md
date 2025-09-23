<!--
id:maxalloc
category:Instrument Control:Realtime Performance Control
-->
# maxalloc
Limits the number of allocations of an instrument.

## Syntax
=== "Modern"
    ``` csound-orc
    maxalloc(insnum, icount)
    maxalloc(Sinsname, icount)
    ```

=== "Classic"
    ``` csound-orc
    maxalloc insnum, icount
    maxalloc Sinsname, icount
    ```

### Initialization

_insnum_ -- instrument number

_Sinsname_ -- instrument name

_icount_ -- number of instrument allocations

### Performance

_maxalloc_ limits the number of simultaneous instances (notes) of an instrument. Any score events after the maximum has been reached, are ignored.

All instances of _maxalloc_ must be defined in the header section, not in the instrument body.

## Examples

Here is an example of the maxalloc opcode. It uses the file [maxalloc.csd](../examples/maxalloc.csd).

``` csound-csd title="Example of the maxalloc opcode." linenums="1"
--8<-- "examples/maxalloc.csd"
```

Its output should contain messages like these:

```
WARNING: cannot allocate last note because it exceeds instr maxalloc
```

## See also

[Real-time Performance Control](../control/realtime.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
July 1999<br>

New in Csound version 3.57
