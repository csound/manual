<!--
id:typeof
category:Miscellaneous
-->
# typeof
Returns the Csound type of a variable or expression as a string.

Use `typeof` when you want to include a type name in a debug message or check it in a condition. The result describes the argument's type, regardless of its value.

## Syntax

=== "Modern"
    ``` csound-orc
    Stype = typeof(xarg)
    ```

=== "Classic"
    ``` csound-orc
    Stype typeof xarg
    ```

### Initialization

`xarg` is a variable or expression of any Csound type. `Stype` receives its internal type name at initialization. Passing a k-rate value or an audio signal does not make the opcode run on every control cycle.

Common results are shown below. Type names are case-sensitive.

| Returned string | Meaning |
| --- | --- |
| `"i"` | An i-rate number |
| `"k"` | A k-rate number |
| `"a"` | An audio signal |
| `"S"` | A string |
| `"c"` | A numeric constant, such as `440` |
| `"p"` | A score p-field, such as `p4` |
| `"["` | An array |

An array returns `"["` without its element type, dimensions or length. To inspect an element of a nonempty array, use an expression such as `typeof(iNotes[0])`.

Other types return their internal names. For example, a user-defined structure named `Note` returns `":Note;"`.

The opcode returns a string and prints nothing by itself. Use [printf](printf.md) or [prints](prints.md) to display it, or [strcmp](strcmp.md) to compare it with a type name.

## Examples

This example checks whether a frequency control has type `k`, then prints the types of a note array and its first element. It uses [typeof.csd](../examples/typeof.csd).

``` csound-csd title="Use type names in messages and conditions" linenums="1"
--8<-- "examples/typeof.csd"
```

The output includes these lines.

``` text
Frequency control has type k
The frequency control can change during a note
Note array has type [
First note has type i
Literal 440 has type c
```

The final two lines show the difference between an i-rate array element and a numeric literal. Both hold numbers, but their internal types differ.

## See also

[Miscellaneous opcodes](../miscopcodes.md), [strcmp](strcmp.md), [printf](printf.md)

## Credits

Opcode by Victor Lazzarini, July 2025.

New in Csound 7.
