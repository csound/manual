<!--
id:rand
category:Signal Generators:Random (Noise) Generators
-->
# rand
Output is a controlled random number series between -*amp* and +*amp*.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = rand(xamp [, iseed] [, isel] [, ioffset])
    kres = rand(xamp [, iseed] [, isel] [, ioffset])
    ```

=== "Classic"
    ``` csound-orc
    ares rand xamp [, iseed] [, isel] [, ioffset]
    kres rand xamp [, iseed] [, isel] [, ioffset]
    ```

### Initialization

_iseed_ (optional, default=0.5) -- a seed value for the recursive pseudo-random formula. A value between 0 and 1 will produce an initial output of _kamp * iseed_. A value greater than 1 will be seeded from the system clock. A negative value will cause seed re-initialization to be skipped. The default seed value is .5.

_isel_ (optional, default=0) -- if zero, a 16-bit number is generated. If non-zero, a 31-bit random number is generated. Default is 0.

_ioffset_ (optional, default=0) -- a base value added to the random result. New in Csound version 4.03.

### Performance

_kamp, xamp_ -- range over which random numbers are distributed.

_ares, kres_ -- Random number produced.

The internal pseudo-random formula produces values which are uniformly distributed over the range _kamp_ to _-kamp_. _rand_ will thus generate uniform white noise with an R.M.S value of _kamp / root 2_.

The value _ares_ or _kres_ is within is a half-closed interval which contains _-xamp_, but never contains _+xamp_.

## Examples

Here is an example of the rand opcode. It uses the file [rand.csd](../examples/rand.csd).

``` csound-orc title="Example of the rand opcode." linenums="1"
--8<-- "examples/rand.csd"
```

The example will produce the following output:

```
i   1 time     0.00067:    50.00305
i   1 time     0.50000:    62.71362
i   1 time     1.00000:   -89.31885

WARNING: Seeding from current time 472230558

i   2 time     2.00067:   -70.65735
i   2 time     2.50000:    69.15283
i   2 time     3.00000:   -48.79761
```

## See also

[Random (Noise) Generators](../siggen/random.md), [randh](../opcodes/randh.md), [randi](../opcodes/randi.md)

## Credits

Thanks to a note from John ffitch, I changed the names of the parameters.
