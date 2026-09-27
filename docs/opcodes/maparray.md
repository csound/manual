<!--
id:maparray
category:Table Control:Table Queries
-->
# maparray
Apply a function of one argument to every element of a vector (one-dimensional k-rate array).

> :memo: **Note**
>
> Up to Csound 6, *maparrayi* was called *maparray_i*.

## Syntax
=== "Modern"
    ``` csound-orc
    karray = maparray(kinarray, String)
    karray = maparrayi(kinarray, String)
    ```

=== "Classic"
    ``` csound-orc
    karray maparray kinarray, String
    karray maparray_i kinarray, String
    ```

### Initialization

_String_ -- a string that names an opcode function, at i-rate for maparrayi or k-rate for maparray.

### Performance

_karray_ --  array for answers.

_kinarray_ --  array for arguments to the function.

## Replacing tabmap and tabmap_i

[tabmap](tabmap.md) maps a k-rate array during initialization and on each control cycle. Change `kResult = tabmap(kSource, "abs")` to `kResult = maparray(kSource, "abs")`.

[tabmap_i](tabmap_i.md) and its alias [tabmapi](tabmapi.md) run only at initialization. Replace either name with `maparrayi` to keep that timing. `maparray_i` is the older spelling of `maparrayi`.

The source must be initialized and one-dimensional. Use a supported one-input scalar function such as `abs`. Initialization-only mapping requires its i-rate form. Repeated k-rate mapping needs both i-rate and k-rate forms. This is not an interface for arbitrary stateful opcodes.

## Examples

=== "Modern"
    Here is an example of the maparray opcode. It uses the file [maparray-modern.csd](../examples/maparray-modern.csd).
    ``` csound-csd title="Example of the maparray opcode." linenums="1"
    --8<-- "examples/maparray-modern.csd"
    ```

=== "Classic"
    Here is an example of the maparray opcode. It uses the file [maparray.csd](../examples/maparray.csd).
    ``` csound-csd title="Example of the maparray opcode." linenums="1"
    --8<-- "examples/maparray.csd"
    ```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2013<br>

New in version 6.00
