<!--
id:trigexpseg
category:Signal Generators:Linear and Exponential Generators
-->
# trigexpseg
Triggers a series of exponential segments between specified points.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = trigexpseg(kTrig, ia, idur1, ib [, idur2] [, ic] [...])
    kres = trigexpseg(kTrig, ia, idur1, ib [, idur2] [, ic] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares trigexpseg kTrig, ia, idur1, ib [, idur2] [, ic] [...]
    kres trigexpseg kTrig, ia, idur1, ib [, idur2] [, ic] [...]
    ```

### Initialization

_ia_ -- starting value. Zero is illegal for exponentials.

_ib, ic_, etc. -- value after _dur1_ seconds, etc. For exponentials, must be non-zero and must agree in sign with _ia_.

_idur1_ -- duration in seconds of first segment

_idur2, idur3_, etc. -- duration in seconds of subsequent segments.

### Performance

_kTrig_ -- trigger value. Will trigger playback of envelop when kTrig is equal 1

These units generate control or audio signals whose values can pass through 2 or more specified points. The sum of _dur_ values may or may not equal the instrument's performance time: a shorter performance will truncate the specified pattern. Triggering the envelop while it is already playing will cause the envelop to jump to the start and play again. This might cause a pop or a click. It is best to wait till the envelope has ended before retriggering it.

## Examples

Here is an example of the trigexpseg opcode. It uses the file [trigexpseg.csd](../examples/trigexpseg.csd).

``` csound-orc title="Example of the trigexpseg opcode." linenums="1"
--8<-- "examples/trigexpseg.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: Rory Walsh<br>
2021<br>
