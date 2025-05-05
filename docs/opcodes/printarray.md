<!--
id:printarray
category:Array Opcodes
-->
# printarray
Print the contents of an array.

Plugin opcode in emugens.

## Syntax
=== "Modern"
    ``` csound-orc
    printarray(ixs[] [, Smft, Slabel ])
    printarray(kxs[] [, ktrig, Sfmt, Slabel ])
    ```

=== "Classic"
    ``` csound-orc
    printarray ixs[] [, Smft, Slabel ]
    printarray kxs[] [, ktrig, Sfmt, Slabel ]
    ```

### Initialization

_Sfmt_ - If given, it is passed to printf for each element of the array. Otherwise a default format is used

_Slabel_ - If given, it is printed before the contents of the array, to easily identify the data

### Performance

_ktrig_ - The array will be printed whenever this value changes from 0 to possitive. Can be used together with metro to print at a given time interval. A value of -1 indicates to print at each k-cycle (default = 1)

## Examples

Here is an example of the printarray opcode. It uses the file [printarray.csd](../examples/printarray.csd).

``` csound-csd title="Example of the printarray opcode." linenums="1"
--8<-- "examples/printarray.csd"
```

## See also

[Printing and Display](../sigio/pdisplay.md)

[Array opcodes](../math/array.md)

## Credits

By: Eduardo Moguillansky 2018

New plugin in version 6.12
