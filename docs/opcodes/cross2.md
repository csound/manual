<!--
id:cross2
category:Signal Modifiers:Convolution and Morphing
-->
# cross2
Cross synthesis using FFT's.

This is an implementation of cross synthesis using FFT's.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = cross2(ain1, ain2, isize, ioverlap, iwin, kbias)
    ```

=== "Classic"
    ``` csound-orc
    ares cross2 ain1, ain2, isize, ioverlap, iwin, kbias
    ```

### Initialization

_isize_ --  This is the size of the FFT to be performed. The larger the size the better the frequency response but a sloppy time response.

_ioverlap_ --  This is the overlap factor of the FFT's, must be a power of two. The best settings are 2 and 4.  A  big overlap takes a long time to compile.

_iwin_ --  This is the function table that contains the window to be used in the analysis. One can use the [GEN20](../scoregens/gen20.md) routine to create this window.

### Performance

_ain1_ --  The stimulus sound.  Must have high frequencies for best results.

_ain2_ --  The modulating sound.  Must have a moving frequency response (like speech) for best results.

_kbias_ --  The amount of cross synthesis.  1 is the normal, 0 is no cross synthesis.

## Examples

Here is an example of the cross2 opcode. It uses the file [cross2.csd](../examples/cross2.csd) and [fox.wav](../examples/fox.wav).

``` csound-csd title="Example of the cross2 opcode." linenums="1"
--8<-- "examples/cross2.csd"
```

## See also

[Convolution and Morphing](../sigmod/conmorph.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1997<br>
