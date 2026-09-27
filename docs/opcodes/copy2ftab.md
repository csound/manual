<!--
id:copy2ftab
category:Array Opcodes
status:deprecated
-->
# copy2ftab
Copies values from an array to a function table at performance time.

This opcode is deprecated. Use [copya2ftab](copya2ftab.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    copy2ftab(kSource[], kTable)
    ```

=== "Classic"
    ``` csound-orc
    copy2ftab kSource[], kTable
    ```

### Performance

The source must be an initialized one-dimensional k-rate array. The destination table must already exist. The copy starts at table index 0 and stops at the end of the array or table, whichever comes first. Any remaining table values stay unchanged.

The opcode copies on every control cycle. It has no output arguments and does not copy at initialization. It accepts only the two-argument k-rate form.

## Replacement

Keep the array first and the table number second when changing the name.

``` csound-orc
// Old name
copy2ftab(kSource, kTable)
// Supported name
copya2ftab(kSource, kTable)
```

`copya2ftab(kSource, kTable)` also copies at initialization. The source array and table must be ready at that point. To keep performance-only copying, pass an explicit zero offset with `copya2ftab(kSource, kTable, 0)`.

See [copya2ftab](copya2ftab.md) for its initialization-rate form and examples.

## See also

[copya2ftab](copya2ftab.md), [Array opcodes](../math/array.md)

## Credits

Author John ffitch, October 2011.
