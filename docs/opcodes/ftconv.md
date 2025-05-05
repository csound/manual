<!--
id:ftconv
category:Signal Modifiers:Convolution and Morphing
-->
# ftconv
Low latency multichannel convolution, using a function table as impulse response source.

The algorithm is to split the impulse response to partitions of length determined by the _iplen_ parameter, and delay and mix partitions so that the original, full length impulse response is reconstructed without gaps. The output delay (latency) is _iplen_ samples, and does not depend on the control rate, unlike in the case of other convolve opcodes.

## Syntax
=== "Modern"
    ``` csound-orc
    a1[, a2[, a3[, ... a8]]] = ftconv(ain, ift, iplen[, iskipsamples \
                                      [, iirlen[, iskipinit]]])
    ```

=== "Classic"
    ``` csound-orc
    a1[, a2[, a3[, ... a8]]] ftconv ain, ift, iplen[, iskipsamples \
                                    [, iirlen[, iskipinit]]]
    ```

### Initialization

_ift_ -- source ftable number. The table is expected to contain interleaved multichannel audio data, with the number of channels equal to the number of output variables (a1, a2, etc.). An interleaved table can be created from a set of mono tables with [GEN52](../scoregens/gen52.md).

_iplen_ -- length of impulse response partitions, in sample frames; must be an integer power of two. Lower settings allow for shorter output delay, but will increase CPU usage.

_iskipsamples_ (optional, defaults to zero) -- number of sample frames to skip at the beginning of the table. Useful for reverb responses that have some amount of initial delay. If this delay is not less than _iplen_ samples, then setting _iskipsamples_ to the same value as _iplen_ will eliminate any additional latency by _ftconv_.

_iirlen_ (optional) -- total length of impulse response, in sample frames. The default is to use all table data (not including the guard point).

_iskipinit_ (optional, defaults to zero) -- if set to any non-zero value, skip initialization whenever possible without causing an error.

### Performance

_ain_ -- input signal.

_a1 ... a8_ -- output signal(s).

## Examples

Here is an example of the ftconv opcode. It uses the file [ftconv.csd](../examples/ftconv.csd).

``` csound-csd title="Example of the ftconv opcode." linenums="1"
--8<-- "examples/ftconv.csd"
```

## See also

[Convolution and Morphing](../sigmod/conmorph.md)

## Credits

Author: Istvan Varga<br>
2005<br>
