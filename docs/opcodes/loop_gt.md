<!--
id:loop_gt
category:Instrument Control:Program Flow Control
-->
# loop_gt
Construction of looping operations.

## Syntax
=== "Modern"
    ``` csound-orc
    loop_gt(indx, idecr, imin, label)
    loop_gt(kndx, kdecr, kmin, label)
    ```

=== "Classic"
    ``` csound-orc
    loop_gt indx, idecr, imin, label
    loop_gt kndx, kdecr, kmin, label
    ```

### Initialization

_indx_ -- i-rate variable to count loop.

_idecr_ -- value to decrement the loop.

_imin_ -- minimum value of loop index.

### Performance

_kndx_ -- k-rate variable to count loop.

_kdecr_ -- value to decrement the loop.

_kmin_ -- minimum value of loop index.

The actions of _loop\_gt_ are equivalent to the code

``` csound-orc
indx  =  indx - idecr
if (indx > imin) igoto label
```

or

``` csound-orc
kndx  =  kndx - kdecr
if (kndx > kmin) kgoto label
```

> :memo: **Note**
> 
> Adviced is to use the 'modern' while or until opcodes for looping constructions.

## Examples

Here is an example of the loop_gt opcode. It uses the file [loop_gt.csd](../examples/loop_gt.csd).

``` csound-csd title="Example of the loop_gt opcode." linenums="1"
--8<-- "examples/loop_gt.csd"
```

## See also

[Program Flow Control: Looping Constructions](../control/pgmctl.md)

More information on this opcode: [http://www.csoundjournal.com/2006summer/controlFlow_part2.html](http://www.csoundjournal.com/2006summer/controlFlow_part2.html) written by Steven Yi, and in the Floss Manuals: [ https://flossmanual.csound.com/csound-language/control-structures](https://flossmanual.csound.com/csound-language/control-structures)

## Credits

Istvan Varga.

New in Csound version 5.01
