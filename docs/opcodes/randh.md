<!--
id:randh
category:Signal Generators:Random (Noise) Generators
-->
# randh
Generates random numbers and holds them for a period of time.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = randh(xamp, xcps [, iseed] [, isize] [, ioffset])
    kres = randh(kamp, kcps [, iseed] [, isize] [, ioffset])
    ```

=== "Classic"
    ``` csound-orc
    ares randh xamp, xcps [, iseed] [, isize] [, ioffset]
    kres randh kamp, kcps [, iseed] [, isize] [, ioffset]
    ```

### Initialization

_iseed_ (optional, default=0.5) -- seed value for the recursive pseudo-random formula. A value between 0 and +1 will produce an initial output of _kamp * iseed._ A negative value will cause seed re-initialization to be skipped. A value greater than 1 will seed from system time, this is the best option to generate a different random sequence for each run.

_isize_ (optional, default=0) -- if zero, a 16 bit number is generated. If non-zero, a 31-bit random number is generated. Default is 0.

_ioffset_ (optional, default=0) -- a base value added to the random result. New in Csound version 4.03.

### Performance

_kamp, xamp_ -- range over which random numbers are distributed.

_kcps, xcps_ -- the frequency which new random numbers are generated.

The internal pseudo-random formula produces values which are uniformly distributed over the range -_kamp_ to +_kamp_. _rand_ will thus generate uniform white noise with an R.M.S value of _kamp / root 2_.

The remaining units produce band-limited noise: the _kcps_ and _xcps_ parameters permit the user to specify that new random numbers are to be generated at a rate less than the sampling or control frequencies. _randh_ will hold each new number for the period of the specified cycle.

## Examples

Here is an example of the randh opcode. It uses the file [randh.csd](../examples/randh.csd).

``` csound-orc title="Example of the randh opcode." linenums="1"
--8<-- "examples/randh.csd"
```

The example will produce the following output:

```
i1    50.00000
i1    50.00305
i1    97.68677
i1   -44.25354
i1   -61.56006
i1   -75.91248
i1    67.57202
i1    12.83875
i1     5.39551
i1   -95.18738

WARNING: Seeding from current time 684387922

i2   -13.81226
i2   -16.49475
i2    69.51904
i2    35.04944
i2    47.47925
i2    63.25378
i2   -59.61914
i2    50.93079
i2    -6.46362
i2     5.89294
```

## See also

[Random (Noise) Generators](../siggen/random.md), [rand](../opcodes/rand.md), [randi](../opcodes/randi.md)
