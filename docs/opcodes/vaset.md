<!--
id:vaset
category:Signal Modifiers:Sample Level Operators
-->
# vaset
Write values into the current buffer of an a-rate variable at the given index.

Useful for doing sample-by-sample manipulation at k-rate without using setksmps 1.

> :memo: **Note**
>
> Because this opcode does not do any bounds checking, the user must be careful not to try to write values past ksmps (the size of a buffer for an a-rate variable) by using index values greater than ksmps.

> :memo: **Note**
>
> In Csound6 this opcode does do bounds checking.

## Syntax
=== "Modern"
    ``` csound-orc
    vaset(kval, kndx, avar)
    ```

=== "Classic"
    ``` csound-orc
    vaset kval, kndx, avar
    ```

### Performance

_kval_ - value to write into avar

_kndx_ - index of the sample to write to the current buffer of the given avar variable

_avar_ - a-rate variable to write to

## Examples

Here is an example of the vaset opcode. It uses the file [vaset.csd](../examples/vaset.csd).

``` csound-csd title="Example of the vaset opcode." linenums="1"
--8<-- "examples/vaset.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)

## Credits

Author: Steven Yi<br>

New in version 5.04

September 2006.
