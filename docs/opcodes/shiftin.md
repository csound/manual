<!--
id:shiftin
category:Array Opcodes
-->
# shiftin
Shifts the contents of an audio variable into a 1-dimensional array.

The array needs to be at least *ksmps* numbers long, but can be longer. Data is shifted in circularly, with the writing position moving by ksmps positions every k-cycle. When the array gets full, the writing position wraps around to the beginning of the array again (overwriting old positions). Together with the shiftout opcode, it can form a FIFO queue.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = shiftin(asig)
    ```

=== "Classic"
    ``` csound-orc
    kout[] shiftin asig
    ```

### Performance

_kout[]_ -- output array, needs to be at least ksmps numbers long.

_asig_ -- input audio

## Examples

Here is an example of the shiftin opcode. It uses the file [shiftin.csd](../examples/shiftin.csd).

``` csound-csd title="Example of the shiftin opcode." linenums="1"
--8<-- "examples/shiftin.csd"
```

## See Also

[Vectorial opcodes](../vectorial/top.md), [array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
