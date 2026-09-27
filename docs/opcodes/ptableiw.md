<!--
id:ptableiw
category:Table Control:Read/Write Operations
status:deprecated
-->
# ptableiw
Writes a value to a function table at initialization.

This opcode is deprecated. Use the i-rate form of [tablew](tablew.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    ptableiw(isig, indx, ifn [, ixmode] [, ixoff] [, iwgmode])
    ```

=== "Classic"
    ``` csound-orc
    ptableiw isig, indx, ifn [, ixmode] [, ixoff] [, iwgmode]
    ```

### Initialization

`isig` is the value to write. `indx` selects a location in the existing function table `ifn`. All arguments are i-rate. The opcode writes once when initialization reaches the call and has no output.

`ixmode` defaults to 0 for indices in table sample units. A nonzero value uses normalized indices, where 1 corresponds to the table length.

`ixoff` adds an offset to `indx` in the same units. It defaults to 0.

`iwgmode` defaults to 0. Mode 0 limits the index to the first or last sample. Mode 1 wraps the index within the table. Mode 2 rounds and wraps the index, and also updates the guard point when writing sample 0.

The table may have any length. These arguments use the same implementation as i-rate `tablew`.

## Replacement

Change the name and keep all arguments at i-rate to preserve initialization timing.

``` csound-orc
// Old name
ptableiw(0.5, 3, ifn)
// Supported name
tablew(0.5, 3, ifn)
```

This differs from [ptablew](ptablew.md), which writes during performance even when its value and index are constants. When replacing a performance-rate `ptablew` call, use k-rate or a-rate value and index arguments with `tablew`.

## Examples

The example writes to two tables using the old and supported names, then reads both during initialization. Both values print as 10.

``` csound-csd title="Replace an initialization-time table write" linenums="1"
--8<-- "examples/ptableiw.csd"
```

## See also

[tablew](tablew.md), [ptablew](ptablew.md), [tableiw](tableiw.md)

## Credits

Author John ffitch, based on work by Robin Whittle, February 2012.
