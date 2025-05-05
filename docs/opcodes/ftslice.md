<!--
id:ftslice
category:Table Control:Read/Write Operations
-->
# ftslice
Copy a slice from an f-table to another f-table at performance.

Plugin opcode in emugens.

The _ftslice_ opcode takes an f-table and copies a slice to a second f-table (similar to tab2array, but between tables). This action is done at performance (every cycle), so that it can be placed inside a k-time if clause / loop / etc. For an init-only version, see [ftslicei](../opcodes/ftslicei.md)

## Syntax
=== "Modern"
    ``` csound-orc
    ftslice(ifnsource, ifndest [, kstart, kend, kstep ])
    ftslice(kfnsource, kfndest [, kstart, kend, kstep ])
    ```

=== "Classic"
    ``` csound-orc
    ftslice ifnsource, ifndest [, kstart, kend, kstep ]
    ftslice kfnsource, kfndest [, kstart, kend, kstep ]
    ```

### Initialization

_ifnsource_ -- The table number to copy data from

_ifndest_ -- The table number to copy data to

### Performance

_kstart_ -- The index to start copying from. _Defaults to 0_

_kend_ -- The end index to stop copying. This is NOT inclusive. 0 means copy to the end of the table. _Defaults to end of table_

_kstep_ -- How many elements to skip. _Defaults to 1_

## Examples

Here is an example of the ftslice opcode. It uses the file [ftslice.csd](../examples/ftslice.csd).

``` csound-csd title="Example of the ftslice opcode." linenums="1"
--8<-- "examples/ftslice.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

By: Eduardo Moguillansky 2018

New plugin in version 6.12
