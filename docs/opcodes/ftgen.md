<!--
id:ftgen
category:Table Control
-->
# ftgen
Generate a score function table from within the orchestra.

## Syntax
=== "Modern"
    ``` csound-orc
    gir = ftgen(ifn, itime, isize, igen, iarga [, iargb ] [...])
    gir = ftgen(ifn, itime, isize, igen, iarray)
    ```

=== "Classic"
    ``` csound-orc
    gir ftgen ifn, itime, isize, igen, iarga [, iargb ] [...]
    gir ftgen ifn, itime, isize, igen, iarray
    ```

### Initialization

_gir_ -- either a requested or automatically assigned table number above 100.

_ifn_ -- requested table number If _ifn_ is zero, the number is assigned automatically and the value placed in _gir_. Any other value is used as the table number

_itime_ -- is ignored, but otherwise corresponds to p2 in the score _f statement_.

_isize_ -- table size. Corresponds to p3 of the score _f statement_.

_igen_ -- function table _GEN_ routine. Corresponds to p4 of the score _f statement_.

_iarga, iargb, ..._ -- function table arguments. Correspond to p5 through p_n_ of the score _f statement_.

_iarray_ -- ane dimensionl array holding the function table arguments. Correspond to p5 through pn of the score _f statement_.

### Performance

This is equivalent to table generation in the score with the _f statement_.

> :memo: **Note**
>
> Csound was originally designed to support tables with power of two sizes only. Though this has changed in recent versions (you can use any size by using a negative number), many opcodes will not accept them.

> :warning: **Warning**
>
> Although Csound will not protest if ftgen is used inside instr-endin statements, this is not the intended or supported use, and must be handled with care as it has global effects. (In particular, a different size usually leads to relocation of the table, which may cause a crash or otherwise erratic behaviour).

## Examples

Here is an example of the ftgen opcode. It uses the file [ftgen.csd](../examples/ftgen.csd).

``` csound-csd title="Example of the ftgen opcode." linenums="1"
--8<-- "examples/ftgen.csd"
```

Here is another example of the ftgen opcode. It uses the file [ftgen-2.csd](../examples/ftgen-2.csd).

``` csound-csd title="Example of the ftgen opcode." linenums="1"
--8<-- "examples/ftgen-2.csd"
```

## See also

[GEN routine overview](../score/genroutines.md)

[Orchestra Header Statements](../orch/header.md)

## Credits

Author: Barry L. Vercoe<br>
M.I.T., Cambridge, Mass<br>
1997<br>

Added warning April 2002 by Rasmus Ekman
