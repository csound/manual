<!--
id:printf
category:Signal I/O:Printing and Display
-->
# printf
printf-style formatted output.

_printf_ and _printf_i_ write formatted output, similarly to the C function printf(). _printf_i_ runs at i-time only, while _printf_ runs both at initialization and performance time.

## Syntax
=== "Modern"
    ``` csound-orc
    printf_i(Sfmt, itrig, [iarg1[, iarg2[, ... ]]])
    printf(Sfmt, ktrig, [xarg1[, xarg2[, ... ]]])
    ```

=== "Classic"
    ``` csound-orc
    printf_i Sfmt, itrig, [iarg1[, iarg2[, ... ]]]
    printf Sfmt, ktrig, [xarg1[, xarg2[, ... ]]]
    ```

### Initialization

_Sfmt_ -- format string, has the same format as in printf() and other similar C functions, except length modifiers (l, ll, h, etc.) are not supported. The following conversion specifiers are allowed:

*  d, i, o, u, x, X, e, E, f, F, g, G, c, s

_iarg1, iarg2, ..._ -- input arguments (max. 30) for format.  Integer formats like %d round the input values to the nearest integer.

_itrig_ -- if greater than zero the opcode performs the printing; otherwise it is an null operation.

### Performance

_ktrig_ -- if greater than zero and different from the value on the previous control cycle the opcode performs the requested printing.  Initially this previous value is taken as zero.

_xarg1, xarg2, ..._ -- input arguments (max. 30) for format.  Integer formats like %d round the input values to the nearest integer. Note that only k-rate and i-rate arguments are valid (no a-rate printing)

## Examples

Here is an example of the printf opcode. It uses the file [printf.csd](../examples/printf.csd).

``` csound-csd title="Example of the printf opcode." linenums="1"
--8<-- "examples/printf.csd"
```

The example will produce the following output:

```
Audiofile 'frox.wav' does not exist!
```

## See also

[Printing and Display](../sigio/pdisplay.md)

More information about printf: [http://www.cplusplus.com/reference/clibrary/cstdio/printf/](http://www.cplusplus.com/reference/clibrary/cstdio/printf/)

## Credits

Author: Istvan Varga<br>
2005<br>
