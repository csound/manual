<!--
id:randc
category:Signal Generators:Random (Noise) Generators
-->
# randc
Generates a controlled random number series with cubic interpolation between each new number.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = randc(xamp, xcps [, iseed] [, isize] [, ioffset])
    kres = randc(kamp, kcps [, iseed] [, isize] [, ioffset])
    ```

=== "Classic"
    ``` csound-orc
    ares randc xamp, xcps [, iseed] [, isize] [, ioffset]
    kres randc kamp, kcps [, iseed] [, isize] [, ioffset]
    ```

### Initialization

_iseed_ (optional, default=0.5) -- seed value for the recursive pseudo-random formula. A value between 0 and +1 will produce an initial output of _kamp * iseed._ A negative value will cause seed re-initialization to be skipped. A value greater than 1 will seed from system time, this is the best option to generate a different random sequence for each run.

_isize_ (optional, default=0) -- if zero, a 16 bit number is generated. If non-zero, a 31-bit random number is generated. Default is 0.

_ioffset_ (optional, default=0) -- a base value added to the random result.

### Performance

_kamp, xamp_ -- range over which random numbers are distributed.

_kcps, xcps_ -- the frequency which new random numbers are generated.

The internal pseudo-random formula produces values which are uniformly distributed over the range _kamp_ to _-kamp_. _rand_ will thus generate uniform white noise with an R.M.S value of _kamp / root 2_.

The remaining units produce band-limited noise: the _kcps_ and _xcps_ parameters permit the user to specify that new random numbers are to be generated at a rate less than the sampling or control frequencies. _randi_ will produce straight-line interpolation between each new number and the next.

## Examples

Here is an example of the randc opcode. It uses the file [randc.csd](../examples/randc.csd).

``` csound-orc title="Example of the randc opcode." linenums="1"
--8<-- "examples/randc.csd"
```

The example will produce the following output:

```
i   1 time     0.00000:    50.00305
i   1 time     0.50068:    68.16267
i   1 time     1.00136:   -94.61682
i   1 time     1.50204:   -74.38840
....

WARNING: Seeding from current time 67726716

i   2 time     4.00036:    79.19006
i   2 time     4.50104:   -47.46559
i   2 time     5.00172:    74.73582
i   2 time     5.50240:    65.35726
....
```

## See also

[Random (Noise) Generators](../siggen/random.md), [randh](../opcodes/randh.md), [rand](../opcodes/rand.md)
