<!--
id:ftresizei
category:Table Control
-->
# ftresizei
Changes a function table's size at initialization.

This is the initialization-time form of [ftresize](ftresize.md). Both use the same experimental implementation and have the same [current limits](ftresize.md#current-limits). For new code, prefer creating a separate table with [ftgen](ftgen.md) and copying the wanted range with [ftslicei](ftslicei.md).

## Syntax

=== "Modern"
    ``` csound-orc
    iunused = ftresizei(ifn, isize)
    ```

=== "Classic"
    ``` csound-orc
    iunused ftresizei ifn, isize
    ```

### Initialization

`ifn` is the number of an existing function table.

`isize` is the requested size in sample points. Use a positive whole number. The negative-size convention used by `ftgen` does not apply here.

`iunused` is required by the opcode's syntax, but the current implementation does not assign it. Do not use it as a table length or a success code.

The resize runs when initialization reaches the call. It keeps the table number and does not resample the contents. Shrinking keeps the allocated storage, and growing does not zero the added memory.

The current implementation records a length one point larger than requested and does not rebuild the guard point or table lookup information. Running at initialization does not remove those limits. Other active instruments may also be using the table, so avoid resizing a shared table while they are running.

## Examples

The first instrument in [ftresize.csd](../examples/ftresize.csd) requests a smaller size for an unused scratch table, then prints its recorded length. The second instrument shows the performance-time form. The current implementation reports 9 after a request for 8.

``` csound-csd title="Inspect initialization and performance-time resize behavior" linenums="1"
--8<-- "examples/ftresize.csd"
```

## See also

[ftresize](ftresize.md), [ftgen](ftgen.md), [ftlen](ftlen.md), [ftslicei](ftslicei.md), [ftfree](ftfree.md), [Function Table Control](../table/top.md)

## Credits

Author John ffitch, 2011.
