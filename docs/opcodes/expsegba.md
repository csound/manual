<!--
id:expsegba
category:Signal Generators:Linear and Exponential Generators
-->
# expsegba
An exponential segment generator operating at a-rate with absolute times.

This unit is almost identical to [expsegb](../opcodes/expsegb.md), but more precise when defining segments with very short durations (i.e., in a percussive attack phase) at audio rate.

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

_ib_, _ic_, etc. -- value after _itim1_ seconds, etc. must be non-zero and must agree in sign with _ia_.

_itim1_ -- time in seconds at end of first segment.

_itim2_, _itim3_, etc. --
time in seconds at the end of subsequent segments.

### Performance

This unit generate audio signals whose values can pass through two or more specified points. The final _tim _ value may or may not equal the instrument's performance time. A shorter performance will truncate the specified pattern, while a longer one will cause the last defined segment to continue on in the same direction.

## Examples

Here is an example of the expsegba opcode. It uses the file [expsegba.csd](../examples/expsegba.csd).

``` csound-orc title="Example of the expsegba opcode." linenums="1"
--8<-- "examples/expsegba.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch

June 2011

New in Csound 5.14
