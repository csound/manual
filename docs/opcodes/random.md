<!--
id:random
category:Signal Generators:Random (Noise) Generators
-->
# random
Generates a controlled pseudo-random number series between min and max values.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = random(kmin, kmax)
    ires = random(imin, imax)
    kres = random(kmin, kmax)
    ```

=== "Classic"
    ``` csound-orc
    ares random kmin, kmax
    ires random imin, imax
    kres random kmin, kmax
    ```

### Initialization

_imin_ -- minimum range limit

_imax_ -- maximum range limit

### Performance

_kmin_ -- minimum range limit

_kmax_ -- maximum range limit

The _random_ opcode is similar to [linrand](../opcodes/linrand.md) and [trirand](../opcodes/trirand.md) but sometimes I [Gabriel Maldonado] find it more convenient because allows the user to set arbitrary minimum and maximum values.

## Examples

Here is an example of the random opcode. It uses the file [random.csd](../examples/random.csd).

``` csound-orc title="Example of the random opcode." linenums="1"
--8<-- "examples/random.csd"
```

Its output should include lines like:

```
i   1 time     0.00067:   894.58566
i   1 time     0.50000:   748.44281
i   1 time     1.00000:   328.29916

WARNING: Seeding from current time 1656666052

i   2 time     2.00067:   690.71466
i   2 time     2.50000:   459.42445
i   2 time     3.00000:   100.85594
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Gabriel Maldonado
