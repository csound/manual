<!--
id:sprintf
category:Strings:Manipulation
-->
# sprintf
printf-style formatted output to a string variable.

Similar to the C function `sprintf()`. _sprintf_ runs at i-time only.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = sprintf(Sfmt, xarg1[, xarg2[, ... ]])
    ```

=== "Classic"
    ``` csound-orc
    Sdst sprintf Sfmt, xarg1[, xarg2[, ... ]]
    ```

### Initialization

_Sfmt_ -- format string, has the same format as in printf() and other similar C functions, except length modifiers (l, ll, h, etc.) are not supported. The following conversion specifiers are allowed:

*  %d, %i, %o, %u, %x, %X, %e, %E, %f, %F, %g, %G, %c, %s

_xarg1, xarg2, ..._ -- input arguments (max. 30) for format, should be i-rate for all conversion specifiers except %s, which requires a string argument. Integer formats like %d round the input values to the nearest integer.

### Performance

_Sdst_ -- output string variable

## Examples

Here is an example of the sprintf opcode. It uses the file [sprintf.csd](../examples/sprintf.csd).

``` csound-csd title="Example of the sprintf opcode." linenums="1"
--8<-- "examples/sprintf.csd"
```

Its output should include lines like this:

```
The file name is: 'impuls20.aiff'
soundin: opened 'impuls20.aiff'
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2005<br>
