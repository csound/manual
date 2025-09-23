<!--
id:randi
category:Signal Generators:Random (Noise) Generators
-->
# randi
Generates a controlled random number series with interpolation between each new number.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = randi(xamp, xcps [, iseed] [, isize] [, ioffset])
    kres = randi(kamp, kcps [, iseed] [, isize] [, ioffset])
    ```

=== "Classic"
    ``` csound-orc
    ares randi xamp, xcps [, iseed] [, isize] [, ioffset]
    kres randi kamp, kcps [, iseed] [, isize] [, ioffset]
    ```

### Initialization

_iseed_ (optional, default=0.5) -- seed value for the recursive pseudo-random formula. A value between 0 and +1 will produce an initial output of _kamp * iseed._ A negative value will cause seed re-initialization to be skipped. A value greater than 1 will seed from system time, this is the best option to generate a different random sequence for each run.

_isize_ (optional, default=0) -- if zero, a 16 bit number is generated. If non-zero, a 31-bit random number is generated. Default is 0.

_ioffset_ (optional, default=0) -- a base value added to the random result. New in Csound version 4.03.

### Performance

_kamp, xamp_ -- range over which random numbers are distributed.

_kcps, xcps_ -- the frequency which new random numbers are generated.

The internal pseudo-random formula produces values which are uniformly distributed over the range _kamp_ to _-kamp_. _rand_ will thus generate uniform white noise with an R.M.S value of _kamp / root 2_.

The remaining units produce band-limited noise: the _kcps_ and _xcps_ parameters permit the user to specify that new random numbers are to be generated at a rate less than the sampling or control frequencies. _randi_ will produce straight-line interpolation between each new number and the next.

## Examples

Here is an example of the randi opcode. It uses the file [randi.csd](../examples/randi.csd).

``` csound-orc title="Example of the randi opcode." linenums="1"
--8<-- "examples/randi.csd"
```

The example will produce the following output:

```
i   1 time     0.00067:    50.00000
i   1 time     0.50000:   -75.81672
i   1 time     1.00000:    95.93833

WARNING: Seeding from current time 1482746120

i   2 time     2.00067:   -17.94434
i   2 time     2.50000:   -14.11875
i   2 time     3.00000:   -72.41545
```

## See also

[Random (Noise) Generators](../siggen/random.md), [randh](../opcodes/randh.md), [rand](../opcodes/rand.md)
