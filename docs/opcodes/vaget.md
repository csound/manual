<!--
id:vaget
category:Signal Modifiers:Sample Level Operators
-->
# vaget
Access values of the current buffer of an a-rate variable by indexing.

Useful for doing sample-by-sample manipulation at k-rate without using setksmps 1.

> :memo: **Note**
>
> Because this opcode does not do any bounds checking, the user must be careful not to try to read values past ksmps (the size of a buffer for an a-rate variable) by using index values greater than ksmps.

> :memo: **Note**
>
> In Csound6 this opcode does do bounds checking.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = vaget(kndx, avar)
    ```

=== "Classic"
    ``` csound-orc
    kval vaget kndx, avar
    ```

### Performance

_kval_ - value read from avar

_kndx_ - index of the sample to read from the current buffer of the given avar variable

_avar_ - a-rate variable to read from

## Examples

Here is an example of the vaget opcode. It uses the file [vaget.csd](../examples/vaget.csd).

``` csound-csd title="Example of the vaget opcode." linenums="1"
--8<-- "examples/vaget.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)

## Credits

Author: Steven Yi<br>

New in version 5.04

September 2006.
