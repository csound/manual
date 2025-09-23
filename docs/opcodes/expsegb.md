<!--
id:expsegb
category:Signal Generators:Linear and Exponential Generators
-->
# expsegb
Trace a series of exponential segments between specified absolute points.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = expsegb(ia, itim1, ib [, itim2] [, ic] [...])
    kres = expsegb(ia, itim1, ib [, itim2] [, ic] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares expsegb ia, itim1, ib [, itim2] [, ic] [...]
    kres expsegb ia, itim1, ib [, itim2] [, ic] [...]
    ```

### Initialization

_ia_ -- starting value. Zero is illegal for exponentials.

_ib, ic_, etc. -- value at _tim1_ seconds, etc. For exponentials, must be non-zero and must agree in sign with _ia_.

_itim1_ -- time in seconds of end of first segment.

_itim2, itim3_, etc. -- time in seconds of
subsequent ends of segments.

### Performance

These units generate control or audio signals whose values can pass through 2 or more specified points. The last _tim_ value may or may not equal the instrument's performance time: a shorter performance will truncate the specified pattern, while a longer one will cause the last-defined segment to continue on in the same direction.

Note that the _expsegb_ opcode does not operate correctly at audio rate when segments are shorter than a k-period. Try the [expsegba](../opcodes/expsegba.md) opcode instead.

## Examples

Here is an example of the expsegb opcode. It uses the file [expsegb.csd](../examples/expsegb.csd).

``` csound-orc title="Example of the expsegb opcode." linenums="1"
--8<-- "examples/expsegb.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: Victor Lazzarini<br>
June 2011 <br>

New in version 5.14
