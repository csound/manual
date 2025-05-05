<!--
id:liveconv
category:Signal Modifiers:Convolution and Morphing
-->
# liveconv
Partitioned convolution with dynamically reloadable impulse response.

Plugin opcode in liveconv.

Computationally efficient, partitioned convolution, using a function table as impulse response (IR) source, similar to the [ftconv](../opcodes/ftconv.md) opcode. The _liveconv_ opcode allows dynamic reload of IR data at any time while the convolution is running, controlled by the _kupdate_ parameter. Due to the manner in which the IR is updated, the operation can be done without audio artifacts in the convolution output.

The IR table is read partition by partition after signalling an update. The first _ksmps_ samples must be available when the update flag is set. The rest of the table can be continuously filled in consecutive passes. There may be a new update for every partition, allowing as many as _ftlen/iplen_ simultaneous updates (ftlen is the length of the IR table).

The low-latency, dynamic behavior of _liveconv_ makes it ideal for convolution with live sampled impulse responses, and/or real-time impulse response transformations and modifications.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = liveconv(ain, ift, iplen, kupdate, kclear)
    ```

=== "Classic"
    ``` csound-orc
    ares liveconv ain, ift, iplen, kupdate, kclear
    ```

### Initialization

_ift_ -- table number for storing the impulse response (IR) for convolution. The table may be filled with new data at any time while the convolution is running.

_iplen_ -- length of impulse response partition in samples; must be an integer power of two. Lower settings allow for shorter output delay, but will increase CPU usage.

### Performance

_ain_ -- input signal.

_ares_ -- output signal.

_kupdate_ -- flag indicating whether the IR table should be updated. If kupdate=1 the IR table ift is loaded partition by partition, starting with the next partition. If kupdate=-1 the IR table ift is unloaded (cleared to zero) partition by partition, starting with the next partition. Other values have no effect.

_kclear_ -- flag for clearing all internal buffers. If kclear has any value != zero, the internal buffers are cleared immediately. This operation is not free of artifacts.

## Examples

Here is an example of the liveconv opcode. It uses the file [liveconv.csd](../examples/liveconv.csd).

``` csound-csd title="Example of the liveconv opcode." linenums="1"
--8<-- "examples/liveconv.csd"
```

## See also

[Convolution and Morphing](../sigmod/conmorph.md)

## Credits

Author: Sigurd Saue, Oeyvind Brandtsegg<br>
2017<br>
