<!--
id:loop_le
category:Instrument Control:Program Flow Control
-->
# loop_le
Construction of looping operations.

## Syntax
=== "Modern"
    ``` csound-orc
    loop_le(indx, incr, imax, label)
    loop_le(kndx, kncr, kmax, label)
    ```

=== "Classic"
    ``` csound-orc
    loop_le indx, incr, imax, label
    loop_le kndx, kncr, kmax, label
    ```

### Initialization

_indx_ -- i-rate variable to count loop.

_incr_ -- value to increment the loop.

_imax_ -- maximum value of loop index.

### Performance

_kndx_ -- k-rate variable to count loop.

_kncr_ -- value to increment the loop.

_kmax_ -- maximum value of loop index.

The actions of _loop\_le_ are equivalent to the code

``` csound-orc
indx  =  indx + incr
if (indx <= imax) igoto label
```

or

``` csound-orc
kndx  =  kndx + kncr
if (kndx <= kmax) kgoto label
```

> :memo: **Note**
>
> Adviced is to use the 'modern' while or until opcodes for looping constructions.

## Examples

Here is an example of the loop_le opcode. It uses the file [loop_le.csd](../examples/loop_le.csd).

``` csound-csd title="Example of the loop_le opcode." linenums="1"
--8<-- "examples/loop_le.csd"
```

Its output should include a line like this:

```
play instance 0
play instance 1
play instance 2
play instance 3
play instance 4
play instance 5
```

## See also

[Program Flow Control: Looping Constructions](../control/pgmctl.md)

More information on this opcode: [http://www.csoundjournal.com/2006summer/controlFlow_part2.html](http://www.csoundjournal.com/2006summer/controlFlow_part2.html) written by Steven Yi, and in the Floss Manuals: [ https://flossmanual.csound.com/csound-language/control-structures](https://flossmanual.csound.com/csound-language/control-structures)

## Credits

Istvan Varga.

New in Csound version 5.01
