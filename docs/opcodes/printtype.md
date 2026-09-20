<!--
id:printtype
category:Signal I/O:Printing and Display
-->
# printtype
Prints the type of a variable or expression.

Use `printtype` to inspect types while debugging an orchestra or a user-defined opcode. It prints the type name through Csound's message output. It has no output arguments and does not print the argument's value.

`print_type` is the older spelling and performs the same operation. Use `printtype` in new Csound 7 code.

## Syntax

=== "Modern"
    ``` csound-orc
    printtype(xarg)
    print_type(xarg)
    ```

=== "Classic"
    ``` csound-orc
    printtype xarg
    print_type xarg
    ```

### Initialization

`xarg` is one argument of any Csound type. It can be a variable or an expression.

The opcode prints once each time it initializes, including when the argument is a k-rate value or an audio signal. It does not print again on every control cycle. No testing option is required.

The message starts with `Variable Type` and gives the internal type name. Common names are shown below.

| Printed type | Meaning |
| --- | --- |
| `i` | An i-rate number |
| `k` | A k-rate number |
| `a` | An audio signal |
| `S` | A string |
| `[` | An array |

For arrays, `printtype` prints only `[`. It does not show the element type, number of dimensions or length. Other types use their internal names.

## Examples

This example inspects several variables and an expression that combines an i-rate number with a k-rate value. It uses [printtype.csd](../examples/printtype.csd).

``` csound-csd title="Inspect variable and expression types" linenums="1"
--8<-- "examples/printtype.csd"
```

The output includes these lines in order.

``` text
Variable Type: i
Variable Type: k
Variable Type: a
Variable Type: S
Variable Type: [
Variable Type: k
```

The final line shows that adding the i-rate number to the k-rate value produces a k-rate expression. Replacing `printtype` with `print_type` gives the same type messages.

## See also

[Printing and Display](../sigio/pdisplay.md), [print](print.md), [printf](printf.md)

## Credits

Opcode by Steven Yi, July 2014.

`print_type` is available from Csound 6.04. The `printtype` spelling is available from Csound 7.
