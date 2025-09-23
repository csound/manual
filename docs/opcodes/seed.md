<!--
id:seed
category:Signal Generators:Random (Noise) Generators
-->
# seed
Sets the global seed value for all _x-class noise generators_, as well as other opcodes that use a random call, such as [grain](../opcodes/grain.md).

> :memo: **Please Note**
>
> [rand](../opcodes/rand.md), [randh](../opcodes/randh.md), [randi](../opcodes/randi.md), [rnd(x)](../opcodes/rnd.md) and [birnd(x)](../opcodes/birnd.md) are not affected by seed.

## Syntax
=== "Modern"
    ``` csound-orc
    seed(ival)
    ```

=== "Classic"
    ``` csound-orc
    seed ival
    ```

### Performance

Use of _seed_ will provide predictable results from an orchestra using with random generators, when required from multiple performances.

When specifying a seed value, _ival_ should be an integer between 0 and 2<sup>32</sup>. If _ival_ = 0, the value of _ival_ will be derived from the system clock.

## Examples

Here is an example of the seed opcode. It uses the file [seed.csd](../examples/seed.csd).

``` csound-orc title="Example of the seed opcode." linenums="1"
--8<-- "examples/seed.csd"
```

Its output should include lines like:

```
i   1 time     0.00067:   100.00000
i   1 time     0.50000:   175.78677
i   1 time     1.00000:   170.89579

WARNING: Seeding from current time 834128659

i   2 time     2.00067:   100.00000
i   2 time     2.50000:   197.58517
i   2 time     3.00000:   188.69525
```

## See also

[Random (Noise) Generators](../siggen/random.md)

[Orchestra Header Statements](../orch/header.md)
