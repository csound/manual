<!--
id:shiftout
category:Array Opcodes
-->
# shiftout
Shifts the contents of a 1-dimensional array into an audio variable.

The array needs to be at least ksmps numbers long, but can be longer. Data is shifted out circularly, with the writing position moving by ksmps positions every k-cycle. When the array gets emptied, the writing position wraps around to the beginning of the array again. Together with the shiftin opcode, it can form a FIFO queue.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = shiftout(kIn[] [, ioff])
    ```

=== "Classic"
    ``` csound-orc
    asig shiftout kIn[] [, ioff]
    ```

### Initialization

_ioff_ -- initial read offset position (optional, defaults to 0).

### Performance

_kin[]_ -- input array, needs to be at least ksmps numbers long.

_asig_ -- output audio

## Examples

Here is an example of the shiftout opcode. It uses the file [shiftout.csd](../examples/shiftout.csd).

``` csound-csd title="Example of the shiftout opcode." linenums="1"
--8<-- "examples/shiftout.csd"
```

## See Also

[Vectorial opcodes](../vectorial/top.md), [array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
