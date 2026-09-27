<!--
id:copy2ttab
category:Array Opcodes
status:deprecated
-->
# copy2ttab
Copies values from a function table to an array at performance time.

This opcode is deprecated. Use [copyf2array](copyf2array.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    copy2ttab(kDestination[], kTable)
    ```

=== "Classic"
    ``` csound-orc
    copy2ttab kDestination[], kTable
    ```

### Performance

The first argument is the destination k-rate array. The second is the source function table number. Initialize a one-dimensional destination array before use. The copy starts at index 0 and stops at the end of the array or table, whichever comes first. Any remaining array values stay unchanged.

The opcode copies on every control cycle. It has no output arguments and does not copy at initialization. It accepts only the two-argument k-rate form.

## Replacement

Keep the array first and the table number second when changing the name.

``` csound-orc
// Old name
copy2ttab(kDestination, kTable)
// Supported name
copyf2array(kDestination, kTable)
```

`copyf2array(kDestination, kTable)` also copies at initialization. Make sure the source table exists and its number is set then. The replacement can allocate the destination array at initialization if it has no storage yet. Account for this earlier copy if other initialization code reads or changes the array.

See [copyf2array](copyf2array.md) for its initialization-rate form and examples.

## See also

[copyf2array](copyf2array.md), [Array opcodes](../math/array.md)

## Credits

Author John ffitch, October 2011.
