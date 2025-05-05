<!--
id:olabuffer
category:Miscellaneous
-->
# olabuffer
Sum overlapping frames of audio as k-rate arrays and read as an audio signal.

Plugin opcode in framebuffer.

_olabuffer_ This opcode takes 1 dimensional k-rate arrays that contain sequential frames of audio and sums them based on an overlap factor resulting in an audio signal output. This is useful for frame based audio processing such as spectral analysis/synthesis.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = olabuffer(kin, ioverlap)
    ```

=== "Classic"
    ``` csound-orc
    aout olabuffer kin, ioverlap
    ```

### Initialization

_ioverlap_ -- The amount of overlaps per k-array input frame sample size. For example for an input window size of 1024, and a hop size of 256 the overlap factor would be 4. The overlap factor must be larger than or equal to ksmps and must also be an integer multiple of the input k-rate array sample count.

### Performance

_aout_ -- The resulting audio signal from the added input frames.

_kin_ -- A k-rate array containing sequential frames of audio.

## Examples

Here is a simple example of the olabuffer opcode. It uses the file [framebuffer.csd](../examples/framebuffer.csd).

``` csound-csd title="Example of the olabuffer opcode." linenums="1"
--8<-- "examples/framebuffer.csd"
```

## See Also

[Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author: Edward Costello;<br>
NUIM, 2015<br>

New in version 6.06
