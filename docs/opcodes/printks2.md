<!--
id:printks2
category:Signal I/O:Printing and Display
-->
# printks2
Prints a new value every time a control variable changes using a printf() style syntax.

## Syntax
=== "Modern"
    ``` csound-orc
    printks2("string", kval)
    ```

=== "Classic"
    ``` csound-orc
    printks2 "string", kval
    ```

### Initialization

_"string"_ -- the text string to be used as a format.

### Performance

_kval_ -- signal to be printed. The style of printing is specified in _&#8220;string&#8221;_ with the standard C value specifier (%f, %d, etc.).

### Print Output Formatting

All standard C language printf() control characters may be used. For example, if _kval1_ = 153.26789 then some common formatting options are:

1. %f prints with full precision: 153.26789
2. %5.2f prints: 153.26
3. %d prints integers-only: 153
4. %c treats _kval1_ as an ascii character code.

In addition to all the printf() codes, printks2 supports these useful character codes:

| printks Code            | Character Code          |
|-------------------------|-------------------------|
| &#92;&#92;r, &#92;&#92;R, %r, or %R | return character (\r)   |
| &#92;&#92;n, &#92;&#92;N, %n, %N    | newline character (\n)  |
| &#92;&#92;t, &#92;&#92;T, %t, or %T | tab character (\t)      |
| %!                      | semicolon character (;) This was needed because a “;” is interpreted as a comment. |
| ^                       | escape character (0x1B) |
| ^ ^                     | caret character (^)     |
| ~                       | ESC[ (escape+[ is the escape sequence for ANSI consoles) |
| ~~                      | tilde (~)               |

For more information about printf() formatting, consult any C language documentation.

## Examples

Here is an example of the printks2 opcode. It uses the file [printks2.csd](../examples/printks2.csd).

``` csound-csd title="Example of the printks2 opcode." linenums="1"
--8<-- "examples/printks2.csd"
```

## See also

[Printing and Display](../sigio/pdisplay.md)

## Credits

Author: John ffitch<br>
Bath, UK<br>
Mar 2014<br>

New in Csound version 6.03
