<!--
id:printsk
category:Signal I/O:Printing and Display
-->
# printsk
Prints at k-rate using a printf() style syntax.

This opcode prints at every cycle, possibly multiple times per cycle. Used inside an if-block it can behave like *printf*, *printks* (when used together with *metro*) or *printks2* (when used with *changed*).

## Syntax
=== "Modern"
    ``` csound-orc
    printsk("string", [, xval1] [, xval2] [...])
    ```

=== "Classic"
    ``` csound-orc
    printsk "string", [, xval1] [, xval2] [...]
    ```

### Initialization

_"string"_ -- the text string to be printed. Can be up to 8192 characters and must be in double quotes.

### Performance

_xval1, xval2, ..._ (optional) -- The k-rate values to be printed. These are specified in _&#8220;string&#8221;_ with the standard C value specifier (%f, %d, %s etc.) in the order given.

### Print Output Formatting

All standard C language printf() control characters may be used. For example, if _kval1_ = 153.26789 then some common formatting options are:

1. %f prints with full precision: 153.26789
2. %5.2f prints: 153.26
3. %d prints integers-only: 153
4. %c treats _kval1_ as an ascii character code.

For more information about printf() formatting, consult any C language documentation.

## Examples

Here is an example of the printsk opcode. It uses the file [printsk.csd](../examples/printsk.csd).

``` csound-csd title="Example of the printsk opcode." linenums="1"
--8<-- "examples/printsk.csd"
```

## See also

[Printing and Display](../sigio/pdisplay.md)

## Credits

By: Eduardo Moguillansky 2020.

New plugin in version 6.15.
