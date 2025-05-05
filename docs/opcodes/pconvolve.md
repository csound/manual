<!--
id:pconvolve
category:Signal Modifiers:Convolution and Morphing
-->
# pconvolve
Convolution based on a uniformly partitioned overlap-save algorithm.

Compared to the [convolve](../opcodes/convolve.md) opcode, _pconvolve_ has these benefits:

*  small delay
*  possible to run in real-time for shorter impulse files
*  no pre-process analysis pass
*  can often render faster than _convolve_

## Syntax
=== "Modern"
    ``` csound-orc
    ar1 [, ar2 [, ar3 [, ar4]]] = pconvolve(ain, ifilcod [, ipartitionsize [, ichannel]])
    ```

=== "Classic"
    ``` csound-orc
    ar1 [, ar2 [, ar3 [, ar4]]] pconvolve ain, ifilcod [, ipartitionsize [, ichannel]]
    ```

### Initialization

_ifilcod_ -- integer or character-string denoting an impulse response soundfile. Multichannel files are supported, the file must have the same sample-rate as the orc. [Note: _cvanal_ files cannot be used!]  Keep in mind that longer files require more calculation time [and probably larger partition sizes and more latency].  At current processor speeds, files longer than a few seconds may not render in real-time.

_ipartitionsize_ (optional, defaults to the output buffersize [-b]) -- the size in samples of each partition of the impulse file.  This is the parameter that needs tweaking for best performance depending on the impulse file size. Generally, a small size means smaller latency but more computation time. If you specify a value that is not a power-of-2 the opcode will find the next power-of-2 greater and use that as the actual partition size.

_ichannel_ (optional) -- which channel to use from the impulse response data file.

### Performance

_ain_ -- input audio signal.

The overall latency of the opcode can be calculated as such [assuming _ipartitionsize_ is a power of 2]

```
ilatency = (ksmps <> ipartitionsize ? ipartitionsize + ksmps : ipartitionsize)/sr
```

## Examples

Instrument 1 shows an example of real-time convolution.

Instrument 2 shows how to do file-based convolution with a 'look ahead' method to remove all delay.

> :memo: **NOTE**
>
> You can download impulse response files from noisevault.com or replace the filenames with your own impulse files.

Here is an example of the pconvolve opcode. It uses the file [pconvolve.csd](../examples/pconvolve.csd).

``` csound-csd title="Example of the pconvolve opcode." linenums="1"
--8<-- "examples/pconvolve.csd"
```

## See also

[Convolution and Morphing](../sigmod/conmorph.md)

## Credits

Author: Matt Ingalls<br>
2004<br>
