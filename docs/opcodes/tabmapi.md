<!--
id:tabmapi
category:Array Opcodes
status:deprecated
-->
# tabmapi
Provides the older alias for initialization-only array mapping.

This opcode is deprecated. Use [maparrayi](maparray.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    kResult[] = tabmapi(kSource[], Sfunction)
    ```

=== "Classic"
    ``` csound-orc
    kResult[] tabmapi kSource[], Sfunction
    ```

## Replacement

`tabmapi` is an alias of [tabmap_i](tabmap_i.md). Both run only during initialization, even though their input and output arrays are k-rate.

Change `kResult = tabmapi(kSource, "abs")` to `kResult = maparrayi(kSource, "abs")`. See [tabmap_i](tabmap_i.md) for the legacy arguments and [maparray](maparray.md) for supported mapping forms.

See [maparray](maparray.md) for examples and the supported forms.

## Credits

Author John ffitch.
