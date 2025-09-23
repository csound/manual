<!--
id:framebuffer
category:Miscellaneous
-->
# framebuffer
Read audio signals into 1 dimensional k-rate arrays and vice-versa with a specified buffer size.

Plugin opcode in framebuffer.

_framebuffer_ converts audio signals into a 1 dimensional k-rate array of a specified size. The size of the k-rate array must be larger than ksmps. It also converts 1 dimensional k-rate arrays back into audio signals, the k-rate arrays must be uninitialised and also be larger than ksmps in size. The buffer works as a circular buffer and may be used for doing frame based audio processing such as spectral analysis/synthesis or as a simple delay line.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = framebuffer(ain, isize)
    aout = framebuffer(kin, isize)
    ```

=== "Classic"
    ``` csound-orc
    kout[] framebuffer ain, isize
    aout framebuffer kin, isize
    ```

### Initialization

_isize_ -- The amount of samples that the buffer will contain.

### Performance

_kout[]_ -- The k-rate array output from the framebuffer. _ain_ -- The audio signal input to the framebuffer.

_aout_ -- The audio signal output from the framebuffer. _kin_ -- The k-rate array input to the framebuffer.

## Examples

Here is a simple example of the framebuffer opcode. It uses the file [framebuffer.csd](../examples/framebuffer.csd).

``` csound-csd title="Example of the framebuffer opcode." linenums="1"
--8<-- "examples/framebuffer.csd"
```

## See Also

[Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author: Edward Costello;<br>
NUIM, 2015<br>

New in version 6.06
