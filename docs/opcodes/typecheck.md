<!--
id:typecheck
category:Instrument Control:Conditional Values
-->
# typecheck
Checks whether two arguments have the same Csound type.

Use `typecheck` when debugging an orchestra or a user-defined opcode to check the types of its inputs. The result is a Boolean that you can use in an `if` statement.

## Syntax

=== "Modern"
    ``` csound-orc
    sameType:b = typecheck(xarg1, xarg2)
    ```

=== "Classic"
    ``` csound-orc
    sameType:b typecheck xarg1, xarg2
    ```

### Initialization

`xarg1` and `xarg2` are variables or expressions of any Csound type. `sameType` is an initialization-time Boolean, true when both arguments have the same internal type and false otherwise.

Values do not affect the result. Two i-rate numbers with values of 60 and 72 match. An i-rate number and a k-rate number differ even when both hold 60, since rate is part of the type.

Numeric literals have the constant type `c`. Comparing an i-rate variable with the literal `60` therefore returns false. Compare with another i-rate variable when you want to check for type `i`.

All arrays share the internal array type. `typecheck` returns true for two arrays even if their element types, dimensions or lengths differ. Check those properties separately when they matter to your code.

The opcode runs at initialization only. Passing k-rate values or audio signals does not make it run during performance. It prints no messages and does not require `--run-unit-tests`.

## Examples

This example checks the types of note values, then compares a numeric array with a string array. It uses [typecheck.csd](../examples/typecheck.csd).

``` csound-csd title="Compare types of note values and arrays" linenums="1"
--8<-- "examples/typecheck.csd"
```

The output includes these lines.

``` text
Both note values are i-rate
The i-rate and k-rate notes have different types
Both arguments are arrays
```

The last result only tells us that both arguments are arrays. It does not mean that an opcode expecting a numeric array will accept the string array.

## See also

[Conditional Values](../control/conditional.md), [if](if.md)

## Credits

Opcode by Victor Lazzarini, July 2025.

New in Csound 7.
