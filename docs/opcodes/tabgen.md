<!--
id:tabgen
category:Array Opcodes
status:deprecated
-->
# tabgen
Creates a k-rate array containing an arithmetic sequence at initialization.

This opcode is deprecated. Use [genarray](genarray.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    kArray[] = tabgen(istart, iend [, istep])
    ```

=== "Classic"
    ``` csound-orc
    kArray[] tabgen istart, iend [, istep]
    ```

### Initialization

`istart` is the first value. `istep` is the increment and defaults to 1. It must be nonzero and point toward `iend`. The array includes `iend` when the sequence reaches it exactly. For example, 0 through 5 with a step of 2 produces 0, 2, 4.

The opcode allocates a one-dimensional k-rate output array and fills it during initialization. It does not refill the array on each control cycle.

## Replacement

Change `kArray = tabgen(istart, iend, istep)` to `kArray = genarray(istart, iend, istep)`, keeping the bounds and step at i-rate. The form with i-rate bounds preserves initialization-only generation into a k-rate array.

Use `genarrayi` when you want to make that timing explicit. Passing k-rate bounds to `genarray` instead selects performance-time generation. See [genarray](genarray.md) for both rates.

See [genarray](genarray.md) for examples and the supported forms.

## Credits

Author John ffitch.
