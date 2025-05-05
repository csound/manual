<!--
id:loop_ge
category:Instrument Control:Program Flow Control
-->
# loop_ge
Construction of looping operations.

## Syntax
=== "Modern"
    ``` csound-orc
    loop_ge(indx, idecr, imin, label)
    loop_ge(kndx, kdecr, kmin, label)
    ```

=== "Classic"
    ``` csound-orc
    loop_ge indx, idecr, imin, label
    loop_ge kndx, kdecr, kmin, label
    ```

### Initialization

_indx_ -- i-rate variable to count loop.

_idecr_ -- value to decrement the loop.

_imin_ -- minimum value of loop index.

### Performance

_kndx_ -- k-rate variable to count loop.

_kdecr_ -- value to decrement the loop.

_kmin_ -- minimum value of loop index.

The actions of _loop\_ge_ are equivalent to the code

``` csound-orc
indx  =  indx - idecr
if (indx >= imin) igoto label
```

or

``` csound-orc
kndx  =  kndx - kdecr
if (kndx >= kmin) kgoto label
```

> :memo: **Note**
>
> Adviced is to use the 'modern' while or until opcodes for looping constructions.

## Examples

=== "Modern"
    Here is a group example for all loop_xx opcodes, comparing the different loop_ opcodes. It uses the file [loop_-group-modern.csd](../examples/loop_-group-modern.csd).
    ``` csound-csd title="Group example of the loop_xx opcodes." linenums="1"
    --8<-- "examples/loop_-group-modern.csd"
    ```

=== "Classic"
    Here is a group example for all loop_xx opcodes, comparing the different loop_ opcodes. It uses the file [loop_-group.csd](../examples/loop_-group.csd).
    ``` csound-csd title="Group example of the loop_xx opcodes." linenums="1"
    --8<-- "examples/loop_-group.csd"
    ```

## See also

[Program Flow Control: Looping Constructions](../control/pgmctl.md)

More information on this opcode: [http://www.csoundjournal.com/2006summer/controlFlow_part2.html](http://www.csoundjournal.com/2006summer/controlFlow_part2.html) written by Steven Yi, and in the Floss Manuals: [ https://flossmanual.csound.com/csound-language/control-structures](https://flossmanual.csound.com/csound-language/control-structures)

## Credits

Istvan Varga. 2006

New in Csound version 5.01
