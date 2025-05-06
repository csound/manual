<!--
id:autocorr
category:Array Operations: Autocorrelation
-->
# autocorr
This opcode takes in an input array and computes its autocorrelation.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = autocorr(kin[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] autocorr kin[]
    ```

### Performance

_kout[]_ -- output array containing the autocorrelation output. It will be created if it does not exist.

_kin[]_ -- input array containing the sequence for autocorrelation.

## Examples

=== "Modern"
    Here is an example of the autocorr opcode. It uses the file [autocorr-modern.csd](../examples/autocorr-modern.csd).
    ``` csound-csd title="Example of the autocorr opcode." linenums="1"
    --8<-- "examples/autocorr-modern.csd"
    ```

=== "classic"
    Here is an example of the autocorr opcode. It uses the file [autocorr.csd](../examples/autocorr.csd).
    ``` csound-csd title="Example of the autocorr opcode." linenums="1"
    --8<-- "examples/autocorr.csd"
    ```

## See Also

[Vectorial opcodes](../vectorial/top.md), [array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2021<br>

New in version 6.16
