<!--
id:triglinseg
category:Signal Generators:Linear and Exponential Generators
-->
# triglinseg
Triggers a series of line segments between specified points.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = triglinseg(kTrig, ia, idur1, ib [, idur2] [, ic] [...])
    kres = triglinseg(kTrig, ia, idur1, ib [, idur2] [, ic] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares triglinseg kTrig, ia, idur1, ib [, idur2] [, ic] [...]
    kres triglinseg kTrig, ia, idur1, ib [, idur2] [, ic] [...]
    ```

### Initialization

_ia_ -- starting value.

_ib, ic_, etc. -- value after _dur1_ seconds, etc.

_idur1_ -- duration in seconds of first segment.

_idur2, idur3_, etc. -- duration in seconds of subsequent segments.

### Performance

_kTrig_ -- trigger value. Will trigger playback of envelop when kTrig is equal 1

These units generate control or audio signals whose values can pass through 2 or more specified points. The sum of _dur_ values may or may not equal the instrument's performance time: a shorter performance will truncate the specified pattern. Triggering the envelop while it is already playing will cause the envelop to jump to the start and play again. This might cause a pop or a click. It is best to wait till the envelope has ended before retriggering it.

## Examples

Here is an example of the triglinseg opcode. It uses the file [triglinseg.csd](../examples/triglinseg.csd).

``` csound-orc title="Example of the triglinseg opcode." linenums="1"
--8<-- "examples/triglinseg.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: Rory Walsh<br>
2021<br>
