<!--
id:rnd31
category:Signal Generators:Random (Noise) Generators
-->
# rnd31
31-bit bipolar random opcodes with controllable distribution.

These units are portable, i.e. using the same seed value will generate the same random sequence on all systems. The distribution of generated random numbers can be varied at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    ax = rnd31(kscl, krpow [, iseed])
    ix = rnd31(iscl, irpow [, iseed])
    kx = rnd31(kscl, krpow [, iseed])
    ```

=== "Classic"
    ``` csound-orc
    ax rnd31 kscl, krpow [, iseed]
    ix rnd31 iscl, irpow [, iseed]
    kx rnd31 kscl, krpow [, iseed]
    ```

### Initialization

_ix_ -- i-rate output value.

_iscl_ -- output scale. The generated random numbers are in the range -iscl to iscl.

_irpow_ -- controls the distribution of random numbers. If irpow is positive, the random distribution (x is in the range -1 to 1) is _abs(x) &circ; ((1 / irpow) - 1)_; for negative irpow values, it is _(1 - abs(x)) &circ; ((-1 / irpow) - 1)_. Setting _irpow_ to -1, 0, or 1 will result in uniform distribution (this is also faster to calculate).

<figure markdown="span">
![[A graph of distributions for different values of irpow.]](../images/rnd31_rand.png)
<figcaption>A graph of distributions for different values of irpow.</figcaption>
</figure>

_iseed_ (optional, default=0) -- seed value for random number generator (positive integer in the range 1 to 2147483646 (2 &circ; 31 - 2)). Zero or negative value seeds from current time (this is also the default). Seeding from current time is guaranteed to generate different random sequences, even if multiple random opcodes are called in a very short time.

In the a- and k-rate version the seed is set at opcode initialization. With i-rate output, if iseed is zero or negative, it will seed from current time in the first call, and return the next value from the random sequence in successive calls; positive seed values are set at all i-rate calls.  The seed is local for a- and k-rate, and global for i-rate units.

> :memo: **Notes**
>
> * although seed values up to 2147483646 are allowed, it is recommended to use smaller numbers (&lt; 1000000) for portability, as large integers may be rounded to a different value if 32-bit floats are used.
> * i-rate _rnd31_ with a positive seed will always produce the same output value (this is not a bug). To get different values, set seed to 0 in successive calls, which will return the next value from the random sequence.


### Performance

_ax_ -- a-rate output value.

_kx_ -- k-rate output value.

_kscl_ -- output scale. The generated random numbers are in the range -kscl to kscl. It is the same as _iscl_, but can be varied at k-rate.

_krpow_ -- controls the distribution of random numbers. It is the same as _irpow_, but can be varied at k-rate.

## Examples

Here is an example of the rnd31 opcode at a-rate. It uses the file [rnd31.csd](../examples/rnd31.csd).

``` csound-orc title="An example of the rnd31 opcode at a-rate." linenums="1"
--8<-- "examples/rnd31.csd"
```

Here is an example of the rnd31 opcode at k-rate. It uses the file [rnd31_krate.csd](../examples/rnd31_krate.csd).

``` csound-orc title="An example of the rnd31 opcode at k-rate." linenums="1"
--8<-- "examples/rnd31_krate.csd"
```

Its output should include lines like this:

```
k1=0.112106
k1=-0.274665
k1=0.403933
```

Here is an example of the rnd31 opcode that uses the number 7 as a seed value. It uses the file [rnd31_seed7.csd](../examples/rnd31_seed7.csd).

``` csound-orc title="An example of the rnd31 opcode that uses the number 7 as a seed value." linenums="1"
--8<-- "examples/rnd31_seed7.csd"
```

Its output should include lines like this:

```
instr 1:  i1 = -0.649
instr 1:  i2 = -0.761
instr 1:  i3 = 0.677
```

Here is an example of the rnd31 opcode that uses the current time as a seed value. It uses the file [rnd31_time.csd](../examples/rnd31_time.csd).

``` csound-orc title="An example of the rnd31 opcode that uses the current time as a seed value." linenums="1"
--8<-- "examples/rnd31_time.csd"
```

Its output should include lines like this:

```
instr 1:  i1 = -0.691
instr 1:  i2 = -0.686
instr 1:  i3 = -0.358
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Istvan Varga

New in version 4.16
