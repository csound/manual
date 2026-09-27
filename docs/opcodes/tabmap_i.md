<!--
id:tabmap_i
category:Array Opcodes
status:deprecated
-->
# tabmap_i
Maps a function over a k-rate array at initialization only.

This opcode is deprecated. Use [maparrayi](maparray.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    kResult[] = tabmap_i(kSource[], Sfunction)
    ```

=== "Classic"
    ``` csound-orc
    kResult[] tabmap_i kSource[], Sfunction
    ```

### Initialization

`kSource[]` must be an initialized one-dimensional numeric array. `Sfunction` names a supported one-input scalar function, such as `abs`, with an i-rate form. The opcode allocates and fills `kResult[]` during initialization. Later changes to the source do not update the result.

[tabmapi](tabmapi.md) is an alias with the same arguments and behavior. Both old names are deprecated.

## Replacement

Replace either `tabmap_i(kSource, "abs")` or `tabmapi(kSource, "abs")` with `maparrayi(kSource, "abs")`. Keep the output as a k-rate array.

Use `maparrayi` to preserve initialization-only timing. `maparray` with k-rate arrays also updates the result on each control cycle. `maparray_i` is the older spelling of `maparrayi`.

See [maparray](maparray.md) for examples and the supported forms.

## Credits

Author John ffitch.
