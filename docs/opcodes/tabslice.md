<!--
id:tabslice
category:Array Opcodes
status:deprecated
-->
# tabslice
Copies selected elements from a k-rate array during performance.

This opcode is deprecated. Use [slicearray](slicearray.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    kResult[] = tabslice(kSource[], istart, iend [, istride])
    ```

=== "Classic"
    ``` csound-orc
    kResult[] tabslice kSource[], istart, iend [, istride]
    ```

### Performance

`kSource[]` is an initialized one-dimensional k-rate array. `istart` is the first source index and `iend` is the last index to include. Both are required and zero-based. `istride` is a positive integer step and defaults to 1.

The output contains the selected elements in order. For example, indices 1 through 5 with stride 2 select elements 1, 3 and 5. The opcode copies during performance and does not fill the result during initialization.

## Replacement

Change `kResult = tabslice(kSource, istart, iend, istride)` to `kResult = slicearray(kSource, istart, iend, istride)`. Keep the same indices and stride.

`slicearray` also copies during initialization. Initialize the source before the call and account for that earlier copy if other initialization code reads the result. It also supports i-rate, audio and string arrays. The old name accepts only k-rate arrays.

See [slicearray](slicearray.md) for examples and the supported forms.

## Credits

Author John ffitch.
