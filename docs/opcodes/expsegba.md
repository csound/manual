<!--
id:expsegba
category:Signal Generators:Linear and Exponential Generators
-->
# expsegba
An exponential segment generator operating at a-rate with absolute times.

This is the audio-only form of [expsegb](../opcodes/expsegb.md). Both use sample timing at audio rate.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = expsegba(ia, itim1, ib [, itim2] [, ic] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares expsegba ia, itim1, ib [, itim2] [, ic] [...]
    ```

### Initialization

_ia_ -- starting value. Zero is illegal.

_ib_, _ic_, etc. -- value at _itim1_ seconds, etc. must be non-zero and must agree in sign with _ia_.

_itim1_ -- time in seconds at the end of the first segment. A zero or negative value skips initialization, preserving the current curve during reinitialization.

_itim2_, _itim3_, etc. -- times in seconds at the ends of later segments. Times must not decrease.

### Performance

Each time gives an endpoint's position in seconds from the start of the envelope. Each time rounds to the nearest sample. The magnitude changes by a constant factor between points. All points must be non-zero and have the same sign; negative points are allowed.

If several points round to the same update, the output jumps to the last value at that update. If the note continues past the final time, the final segment keeps the same exponential rate. When the final two points share an update, the output holds the final value.

## Examples

Here is an example of the expsegba opcode. It uses the file [expsegba.csd](../examples/expsegba.csd).

``` csound-csd title="Example of the expsegba opcode." linenums="1"
--8<-- "examples/expsegba.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch

June 2011

New in Csound 5.14
