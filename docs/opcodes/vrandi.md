<!--
id:vrandi
category:Vectorial:Random
-->
# vrandi
Generate a sort of 'vectorial band-limited noise'.

## Syntax
=== "Modern"
    ``` csound-orc
    vrandi(ifn,  krange, kcps, ielements [, idstoffset] [, iseed] \
           [, isize] [, ioffset])
    ```

=== "Classic"
    ``` csound-orc
    vrandi ifn,  krange, kcps, ielements [, idstoffset] [, iseed] \
           [, isize] [, ioffset]
    ```

### Initialization

_ifn_ - number of the table where the vectorial signal will be generated

_ielements_ - number of elements to process

_idstoffset_ - (optional, default=0) -- index offset for the destination table

_iseed_ (optional, default=0.5) -- seed value for the recursive pseudo-random formula. A value between 0 and +1 will produce an initial output of _kamp_ * _iseed_. A negative value will cause seed re-initialization to be skipped. A value greater than 1 will seed from system time, this is the best option to generate a different random sequence for each run.

_isize_ (optional, default=0) -- if zero, a 16 bit number is generated. If non-zero, a 31-bit random number is generated. Default is 0.

_ioffset_ - (optional, default=0) -- a base value added to the random result.

### Performance

_krange_ - range of random elements (from -_krange_ to _krange_)

_kcps_ - rate of generated elements in cycles per seconds

This opcode is similar to [randi](../opcodes/randi.md), but operates on vectors instead of with scalar values.

Though argument _isize_ defaults to 0, thus using a 16-bit random number generator, using the newer 31-bit algorithm is recommended, as this will produce a random sequence with a longer period (more random numbers before the sequence starts repeating).

The output is a vector contained in _ifn_ (that must be previously allocated).

All these operators are designed to be used together with other opcodes that operate with vector such as [adsynt](../opcodes/adsynt.md), etc.

## Examples

Here is an example of the vrandi opcode. It uses the file [vrandi.csd](../examples/vrandi.csd).

``` csound-csd title="Example of the vrandi opcode." linenums="1"
--8<-- "examples/vrandi.csd"
```

## See also

[Vectorial Random Signal Generators](../vectorial/vectorialrandom.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
