<!--
id:y
category:
-->
# y Statement (or Seed Statement)

Set seed for random numbers, either from p1 or, if omitted, the clock.

## Syntax
``` csound-orc
y [p1]
```

### Initialization

_p1_ -- An integer value between 0 and 2<sup>32</sup> used as a new seed for random numbers. If omitted, the system clock value will be used instead.

### Performance

The tilde symbol ˜ can be used in an expression wherever a number is permissible to use. Each ˜ will evaluate to a random value between zero (0) and one (1). If there is no y statement in the score, the pseudo-random generator will yield the same numbers in each performance. If a fixed seed is given, a different predictable series of pseudo-random numbers will be generated from this seed. If a y statement is used without p1, the system clock will be used as a seed, yielding a different series of pseudo-random numbers for each performance.

## Examples

Here is an example of the y statement. It uses the file [y_statement.csd](../examples/y_statement.csd).

``` csound-csd title="Example of the y statement." linenums="1"
--8<-- "examples/y_statement.csd"
```

Each time this example is run, different values between 1 and 10 will be displayed. The seed used will be displayed as well.

## See Also

[Score Statements](../score/statemnt.md)

## Credits

Author: John ffitch, 2014

New in version 6.03
