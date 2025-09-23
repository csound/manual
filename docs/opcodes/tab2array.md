<!--
id:tab2array
category:Array Opcodes
-->
# tab2array
Copy a slice from an f-table to an array.

Plugin opcode in emugens.

The _tab2array_ opcode takes an f-table and copies a slice to an array, possibly allocating it or changing its size

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = tab2array(ifn [, kstart, kend, kstep ])
    iout[] = tab2array(ifn [, istart, iend, istep ])
    ```

=== "Classic"
    ``` csound-orc
    kout[] tab2array ifn [, kstart, kend, kstep ]
    iout[] tab2array ifn [, istart, iend, istep ]
    ```

### Initialization

_ifn_ - The table index to copy data from

### Performance

_kstart / istart_ - The index to start copying from. _Defaults to 0_

_kend / iend_ - The end index to stop cpying. This is NOT inclusive. 0 means copy to the end of the table. _Defaults to length of table_

_kstep / istep_ - How many elements to skip. _Defaults to 1_

## Examples

Here is an example of the tab2array opcode. It uses the file [tab2array.csd](../examples/tab2array.csd).

``` csound-csd title="Example of the tab2array opcode." linenums="1"
--8<-- "examples/tab2array.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

By: Eduardo Moguillansky 2018

New plugin in version 6.12
