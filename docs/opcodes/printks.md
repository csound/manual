<!--
id:printks
category:Signal I/O:Printing and Display
-->
# printks
Prints at k-rate using a printf() style syntax.

## Syntax
=== "Modern"
    ``` csound-orc
    printks("string", itime [, xval1] [, xval2] [...])
    ```

=== "Classic"
    ``` csound-orc
    printks "string", itime [, xval1] [, xval2] [...]
    ```

### Initialization

_"string"_ -- the text string to be printed. Can be up to 8192 characters and must be in double quotes.

_itime_ -- time in seconds between printings.

### Performance

_xval1, xval2, ..._ (optional) -- The k-rate values to be printed. These are specified in _&#8220;string&#8221;_ with the standard C value specifier (%f, %d, %s etc.) in the order given.

In Csound version 4.23, you can use as many _kval_ variables as you like. In versions prior to 4.23, you must specify 4 and only 4 kvals (using 0 for unused kvals).

_printks_ prints numbers and text which can be i-time or k-rate values. _printks_ is highly flexible, and if used together with cursor positioning codes, could be used to write specific values to locations in the screen as the Csound processing proceeds.

A special mode of operation allows this _printks_ to convert _kval1_ input parameter into a 0 to 255 value and to use it as the first character to be printed. This enables a Csound program to send arbitrary characters to the console. To achieve this, make the first character of the string a &num; and then, if desired continue with normal text and format specifiers.

This opcode can be run on every k-cycle it is run in the instrument. To every accomplish this, set _itime_ to 0.

When _itime_ is not 0, the opcode print on the first k-cycle it is called, and subsequently when every _itime_ period has elapsed. The time cycles start from the time the opcode is initialized - typically the initialization of the instrument.

### Print Output Formatting

All standard C language printf() control characters may be used. For example, if _kval1_ = 153.26789 then some common formatting options are:

1. %f prints with full precision: 153.26789
2. %5.2f prints: 153.26
3. %d prints integers-only: 153
4. %c treats _kval1_ as an ascii character code.

In addition to all the printf() codes, printks supports these useful character codes:

| printks Code | Character Code |
|---|---|
| &#92;&#92;r, &#92;&#92;R, %r, or %R | return character (\r) |
| &#92;&#92;n, &#92;&#92;N, %n, %N | newline character (\n) |
| &#92;&#92;t, &#92;&#92;T, %t, or %T | tab character (\t) |
| %! | semicolon character (;) This was needed because a “;” is interpreted as an comment. |
| ^ | escape character (0x1B) |
| ^ ^ | caret character (^) |
| ~ | ESC[ (escape+[ is the escape sequence for ANSI consoles) |
| ~~ | tilde (~) |

For more information about printf() formatting, consult any C language documentation.

> :memo: **Note**
>
> Prior to version 4.23, only the %f format code was supported.

## Examples

Here is an example of the printks opcode. It uses the file [printks.csd](../examples/printks.csd).

``` csound-csd title="Example of the printks opcode." linenums="1"
--8<-- "examples/printks.csd"
```

Its output should include lines like this:

```
kup = 0.000000, kdown = 30.000000
kup = 20.010843, kdown = 25.962524
kup = 40.029991, kdown = 21.925049
kup = 60.049141, kdown = 17.887573
kup = 79.933266, kdown = 13.872493
```

## See also

[Printing and Display](../sigio/pdisplay.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

Example written by Kevin Conder.

Thanks goes to Luis Jure for pointing out a mistake with the _itime_ parameter.

Thanks to Matt Ingalls, updated the documentation for version 4.23.
