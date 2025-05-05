<!--
id:ftset
category:Table Control:Read/Write Operations
-->
# ftset
Sets multiple elements of a table to a given value.

All elements of the table, or a slice (start\:end\:step) can be set at once. If all parameters are i-time variables, ftset will run only at init-time. Otherwise ftset is executed at each cycle.

Plugin opcode in emugens

## Syntax
=== "Modern"
    ``` csound-orc
    ftset(ktablenum, kvalue [, kstart=0, kend=0, kstep=1 ])
    ftset(itablenum, ivalue [, istart=0, iend=0, istep=1 ])
    ```

=== "Classic"
    ``` csound-orc
    ftset ktablenum, kvalue [, kstart=0, kend=0, kstep=1 ]
    ftset itablenum, ivalue [, istart=0, iend=0, istep=1 ]
    ```

### Performance

_ktablenum_ -- the number of the table to be modified

_kvalue_ -- the value to write to the table

_kstart_ -- the start index to modify (defaults to 0)

_kend_ -- the end index to modify. Defaults to 0, which indicates the end of the table. A negative index can be used to count from the end, so for example -1 will modifiy the table without changing the last element.

_kstep_ -- the increment to use between modified indexes. Defaults to 1, which means to modify every element between start and end

## Examples

Here is an example of the ftset opcode. It uses the file [ftset.csd](../examples/ftset.csd).

``` csound-csd title="Example of the ftset opcode." linenums="1"
--8<-- "examples/ftset.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

By: Eduardo Moguillansky 2020
