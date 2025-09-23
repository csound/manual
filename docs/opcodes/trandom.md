<!--
id:trandom
category:Signal Generators:Random (Noise) Generators
-->
# trandom
Generates a controlled pseudo-random number series between min and max values at k-rate whenever the trigger parameter is different to 0.

## Syntax
=== "Modern"
    ``` csound-orc
    kout = trandom(ktrig, kmin, kmax)
    ```

=== "Classic"
    ``` csound-orc
    kout trandom ktrig, kmin, kmax
    ```

### Performance

_ktrig_ -- trigger opcode produces a new random number whenever this value is not 0.

_kmin_ -- minimum range limit

_kmax_ -- maximum range limit

_trandom_ is almost identical to [random](../opcodes/random.md) opcode, except _trandom_ updates its output with a new random value only when the _ktrig_ argument is triggered (i.e. whenever it is not zero).

## Examples

Here is an example of the trandom opcode. It uses the file [trandom.csd](../examples/trandom.csd).

``` csound-orc title="Example of the trandom opcode." linenums="1"
--8<-- "examples/trandom.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5.06
