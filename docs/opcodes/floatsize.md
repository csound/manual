<!--
id:floatsize
category:Miscellaneous
-->
# floatsize
Returns the size of Csound's internal floating-point type in bytes.

## Syntax

=== "Modern"
    ``` csound-orc
    iBytes = floatsize()
    ```

=== "Classic"
    ``` csound-orc
    iBytes floatsize
    ```

### Initialization

`floatsize` takes no inputs and returns an i-rate value. The result is `sizeof(MYFLT)`, where `MYFLT` is the type Csound uses for ordinary numeric variables and audio samples.

| Result | Csound build |
| --- | --- |
| 4 | Single precision, using 32-bit floats |
| 8 | Double precision, using 64-bit doubles |

The build chooses this type. It stays the same throughout the performance. A 64-bit computer can run either build. Audio-file bit depth is independent of this value.

## Examples

Use `floatsize` when a numeric check needs to allow for different rounding errors in float and double builds. This example squares the square root of two, then checks how close the result is to two. It uses [floatsize.csd](../examples/floatsize.csd).

``` csound-csd title="Choose a tolerance for a numeric check" linenums="1"
--8<-- "examples/floatsize.csd"
```

The example prints the internal number size and whether the check passed. Its tolerances suit this calculation. Choose tolerances for your own calculations based on the size of the values and the errors you can accept.

## See also

[Floating-point precision](../misc/csound64.md), [Miscellaneous opcodes](../miscopcodes.md)

## Credits

Opcode by Victor Lazzarini, December 2024.

New in Csound 7.
