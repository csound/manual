<!--
id:slicearrayi
category:Table Control:Table Queries
-->
# slicearrayi
Copies selected array elements at initialization only.

Use `slicearrayi` to select notes from a scale or keep a copy of settings from a global array when an instrument starts. The spelling `slicearray_i` calls the same opcode.

## Syntax

=== "Modern"
    ``` csound-orc
    iout[] = slicearrayi(iin[], istart, iend [, istride])
    kout[] = slicearrayi(kin[], istart, iend [, istride])
    Sout[] = slicearrayi(Sin[], istart, iend [, istride])
    ```

=== "Classic"
    ``` csound-orc
    iout[] slicearrayi iin[], istart, iend [, istride]
    kout[] slicearrayi kin[], istart, iend [, istride]
    Sout[] slicearrayi Sin[], istart, iend [, istride]
    ```

Use `slicearray_i` in place of `slicearrayi` for the older spelling. It accepts the same arguments and types.

### Initialization

The input must be an initialized, one-dimensional array. Supported element types are i-rate numbers, k-rate numbers and strings. The output has the same element type as the input. Audio arrays and arrays of other types have no `slicearrayi` form.

`istart` is the first input index to copy. Indices start at 0.

`iend` is the last input index allowed in the slice, inclusive. Use `-1` to select through the last input element. This argument is required, including when selecting to the end.

`istride` is the step between input indices. It defaults to 1. A stride of 2 copies every other element, starting at `istart`.

The opcode sizes the output to hold the selected elements. You do not need to declare its size first. For example, slicing `[10, 20, 30, 40, 50, 60]` from 1 through 4 with a stride of 2 returns `[20, 40]`. The end element is copied only if a step reaches it.

The copy runs during initialization, including reinitialization. It does not run on control cycles, even with a k-rate or string array. Later changes to the input leave the output unchanged. Strings are copied too, so changing a source string does not change its copy.

For k-rate inputs, set the values before the slice runs. A global array filled before the instrument starts is one use for this form. A value first assigned during performance is not yet available at initialization. Use [slicearray](slicearray.md) when the slice should follow changes during performance.

### Bounds and stride

Use integer indices and a positive integer stride. Fractional arguments truncate toward zero after the range checks. An end value whose integer part is negative selects the last input element.

The start must be between 0 and the input length. An end index beyond the last element causes an initialization error. A start beyond the selected end returns an empty array, so a start equal to the input length also returns an empty array.

All arguments must be finite. The stride must be at least 1 and less than 2147483648. The end must be at least -2147483648 and less than 2147483648. Invalid bounds, a stride outside its range or an input with more than one dimension cause an initialization error.

## Examples

The example selects the first, third and fifth notes of a major scale to make a chord. The scale lives in a global k-rate array. Each note takes its own copy at initialization.

A matching string slice supplies the note names. The example prints `C E G` and plays the chord for two seconds.

It uses [slicearrayi.csd](../examples/slicearrayi.csd).

``` csound-csd title="Choose a chord from a scale at note start" linenums="1"
--8<-- "examples/slicearrayi.csd"
```

## See also

[slicearray](slicearray.md), [fillarray](fillarray.md), [lenarray](lenarray.md), [Array opcodes](../math/array.md)

## Credits

Author John ffitch, 2018.

The original spelling `slicearray_i` appeared in Csound 6.12. The spelling `slicearrayi` is available in Csound 7.
