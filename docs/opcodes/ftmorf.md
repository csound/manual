<!--
id:ftmorf
category:Signal Modifiers:Convolution and Morphing
-->
# ftmorf
Uses an index into a table of ftable numbers to morph between adjacent tables in the list. This morphed function is written into the table referenced by _iresfn_ on every k-cycle.

## Syntax
=== "Modern"
    ``` csound-orc
    ftmorf(kftndx, iftfn, iresfn)
    ```

=== "Classic"
    ``` csound-orc
    ftmorf kftndx, iftfn, iresfn
    ```

### Initialization

_iftfn_ -- The table containing the numbers of any existing tables which are used for the morphing.

_iresfn_ -- Table number of the morphed function

The length of all the tables in _iftfn_ must equal the length of _iresfn_.

### Performance

_kftndx_ -- the index into the _iftfn_ table.

If _iftfn_ contains (6, 4, 6, 8, 7, 4):

*   _kftndx=4_ will write the contents of f7 into _iresfn_.
*   _kftndx=4.5_ will write the average of the contents of f7 and f4 into _iresfn_.

> :memo: **Note**
>
> _iresfn_ is only updated if the morfing index changes it's value, if _kftindx_ is static, no writing to _iresfn_ will occur.

## Examples

Here is an example of the ftmorf opcode. It uses the file [ftmorf.csd](../examples/ftmorf.csd).

``` csound-csd title="Example of the ftmorf opcode." linenums="1"
--8<-- "examples/ftmorf.csd"
```

Two musical examples featuring the ftmorf opcode: [FtmorfRandomh_Cucchi.csd](../examples/musical/FtmorfRandomh_Cucchi.csd) and [Ftmorf_Cucchi.csd](../examples/musical/Ftmorf_Cucchi.csd), both by Stefano Cucchi.

## See also

[Convolution and Morphing](../sigmod/conmorph.md)

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: William &#8220;Pete&#8221; Moss<br>
University of Texas at Austin<br>
Austin, Texas USA<br>
Jan. 2002<br>

New in version 4.18
