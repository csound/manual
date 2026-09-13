<!--
id:unwrap
category:Array Operations: Fast Fourier Transform
-->
# unwrap
Wrap or unwrap an array of phase values in radians.

The default mode wraps each phase into $[-\pi, \pi)$. Mode 1 unwraps each array element over successive control periods; its output can extend beyond that interval.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = unwrap(kin[] [, imode])
    ```

=== "Classic"
    ``` csound-orc
    kout[] unwrap kin[] [, imode]
    ```

### Initialization

_imode_ (optional, default=0) -- 0 wraps each input value independently. 1 keeps a separate phase history for each element and adds or subtracts multiples of $2\pi$ so that its change from the previous output lies in $[-\pi, \pi)$. Only 0 and 1 are accepted. Phase history starts at zero and resets on initialization or reinitialization.

### Performance

_kout[]_ -- output array containing the wrapped or unwrapped phases. It is created if needed. The same array may be used for input and output.

_kin[]_ -- one-dimensional input array of phases. Its length must stay fixed after initialization. A separate input array is left unchanged.

In mode 1, phase changes larger than half a cycle between updates cannot be distinguished from a smaller change in the opposite direction.

## Examples

Here is an example of the unwrap opcode. It uses the file [unwrap.csd](../examples/unwrap.csd).

``` csound-csd title="Example of the unwrap opcode." linenums="1"
--8<-- "examples/unwrap.csd"
```

## See Also

[Vectorial opcodes](../vectorial/top.md), [array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
