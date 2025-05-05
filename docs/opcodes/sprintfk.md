<!--
id:sprintfk
category:Strings:Manipulation
-->
# sprintfk
printf-style formatted output to a string variable at k-rate.

Similar to the C function `sprintf()`. _sprintfk_ runs both at initialization and performance time.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = sprintfk(Sfmt, xarg1[, xarg2[, ... ]])
    ```

=== "Classic"
    ``` csound-orc
    Sdst sprintfk Sfmt, xarg1[, xarg2[, ... ]]
    ```

### Initialization

_Sfmt_ -- format string, has the same format as in printf() and other similar C functions, except length modifiers (l, ll, h, etc.) are not supported. The following conversion specifiers are allowed:

*  %d, %i, %o, %u, %x, %X, %e, %E, %f, %F, %g, %G, %c, %s

_xarg1, xarg2, ..._ -- input arguments (max. 30) for format, should be i-rate for all conversion specifiers except %s, which requires a string argument. sprintfk also allows k-rate number arguments, but these should still be valid at init time as well (unless sprintfk is skipped with igoto). Integer formats like %d round the input values to the nearest integer.

### Performance

_Sdst_ -- output string variable

## Examples

Here is an example of the sprintfk opcode. It uses the file [sprintfk.csd](../examples/sprintfk.csd).

``` csound-csd title="Example of the sprintfk opcode." linenums="1"
--8<-- "examples/sprintfk.csd"
```

Its output should include lines like this:

```
1 + 1 = 2
1 + 1 + 1 = 3
1 + 1 + 1 + 1 = 4
1 + 1 + 1 + 1 + 1 = 5
1 + 1 + 1 + 1 + 1 + 1 = 6
1 + 1 + 1 + 1 + 1 + 1 + 1 = 7
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 8
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 9
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 10
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 11
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 12
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2005<br>
Example by Jonathan Murphy<br>
