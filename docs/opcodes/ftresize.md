<!--
id:ftresize
category:Table Control
-->
# ftresize
Changes a function table's size at performance time.

This opcode is experimental. Its current implementation does not maintain all the information that table-reading opcodes need. For new code, prefer creating a separate table of the required size with [ftgen](ftgen.md), then copying the wanted range with [ftslice](ftslice.md) or [ftslicei](ftslicei.md).

## Syntax

=== "Modern"
    ``` csound-orc
    kunused = ftresize(kfn, ksize)
    ```

=== "Classic"
    ``` csound-orc
    kunused ftresize kfn, ksize
    ```

### Performance

`kfn` is the number of an existing function table.

`ksize` is the requested size in sample points. Use a positive whole number. The negative-size convention used by `ftgen` does not apply here.

`kunused` is required by the opcode's syntax, but the current implementation does not assign it. Do not use it as a table length or a success code.

`ftresize` runs on every control cycle where the call executes. It has no trigger input. Put it inside a k-rate condition when you want a single resize. It does not resize during initialization. Use [ftresizei](ftresizei.md) for that phase.

The operation changes the existing table and keeps its table number. It does not resample or regenerate the data. Existing sample values remain at their indexes where storage is retained. Shrinking does not release the underlying storage, and growing does not initialize the added memory to zero.

### Current limits

The implementation prints `WARNING: EXPERIMENTAL CODE` on its first use in the process. It records a length one point larger than the requested size, and it does not rebuild the table's guard point or lookup information. Do not interpret the reported length as a guarantee that all table readers can use the resized table correctly.

Growing can move the table's storage and allocate memory during performance. Active opcodes may still hold the old address or size. These limits make the opcode unsuitable for resizing tables that a live instrument is using. Input and allocation checks are also incomplete.

## Examples

The shared example uses unused scratch tables to show when each form runs. It requests a smaller size and prints the recorded length. It does not use the resized tables for synthesis.

For the performance-time form, a second instrument reads the length after the resize because [ftlen](ftlen.md) runs at initialization. The current implementation reports 9 after a request for 8.

It uses [ftresize.csd](../examples/ftresize.csd).

``` csound-csd title="Inspect initialization and performance-time resize behavior" linenums="1"
--8<-- "examples/ftresize.csd"
```

## See also

[ftresizei](ftresizei.md), [ftgen](ftgen.md), [ftlen](ftlen.md), [ftslice](ftslice.md), [ftslicei](ftslicei.md), [ftfree](ftfree.md), [Function Table Control](../table/top.md)

## Credits

Author John ffitch, 2011.
