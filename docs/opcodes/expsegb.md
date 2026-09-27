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

_itim1_ -- time in seconds at the end of the first segment. A zero or negative value skips initialization, preserving the current curve during reinitialization.

_itim2, itim3_, etc. -- times in seconds at the ends of later segments. Times must not decrease.

### Performance

Each time gives an endpoint's position in seconds from the start of the envelope. Each time rounds to the nearest control period for _kres_ and the nearest sample for _ares_. The magnitude changes by a constant factor between points. All points must be non-zero and have the same sign; negative points are allowed.

If several points round to the same update, the output jumps to the last value at that update. If the note continues past the final time, the final segment keeps the same exponential rate. When the final two points share an update, the output holds the final value.

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
