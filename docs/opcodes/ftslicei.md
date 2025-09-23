<!--
id:ftslicei
category:Table Control:Read/Write Operations
-->
# ftslicei
Copy a slice from an f-table to another f-table at init.

Plugin opcode in emugens.

The _ftslicei_ opcode takes an f-table and copies a slice to a second f-table (similar to tab2array, but between tables). This action is done at init time. For a performance-time version, see [ftslice](../opcodes/ftslice.md)

## Syntax
=== "Modern"
    ``` csound-orc
    ftslicei(ifnsource, ifndest [, istart, iend, istep ])
    ```

=== "Classic"
    ``` csound-orc
    ftslicei ifnsource, ifndest [, istart, iend, istep ]
    ```

### Initialization

_ifnsource_ -- The table number to copy data from

_ifndest_ -- The table number to copy data to

_istart_ -- The index to start copying from. _Defaults to 0_

_iend_ -- The end index to stop copying. This is NOT inclusive. 0 means copy to the end of the table. _Defaults to end of table_

_istep_ -- How many elements to skip. _Defaults to 1_

## Examples

For an example, refer to the ftslice opcode: [ftslice.csd](../examples/ftslice.csd).

``` csound-csd title="Example of the ftslice opcode." linenums="1"
--8<-- "examples/ftslice.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

By: Eduardo Moguillansky 2018

New plugin in version 6.12
