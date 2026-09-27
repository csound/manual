<!--
id:tabmap
category:Array Opcodes
status:deprecated
-->
# tabmap
Applies a function to each element of a k-rate array.

This opcode is deprecated. Use [maparray](maparray.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    kResult[] = tabmap(kSource[], Sfunction)
    ```

=== "Classic"
    ``` csound-orc
    kResult[] tabmap kSource[], Sfunction
    ```

### Initialization and performance

`kSource[]` must be an initialized one-dimensional array. `Sfunction` names a supported scalar function, such as `abs`. The opcode allocates the result array and applies the function during initialization, then updates the result each control cycle.

The function needs both an i-rate and a k-rate form with one numeric input and one numeric output. This interface supports simple scalar functions, not arbitrary opcodes with state or extra arguments.

## Replacement

Change `kResult = tabmap(kSource, "abs")` to `kResult = maparray(kSource, "abs")`. The two names share initialization and performance behavior.

For initialization-only mapping of a k-rate array, use `maparrayi`. The old names for that operation are [tabmap_i](tabmap_i.md) and [tabmapi](tabmapi.md).

See [maparray](maparray.md) for examples and the supported forms.

## Credits

Author John ffitch.
