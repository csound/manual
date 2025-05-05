<!--
id:prints
category:Signal I/O:Printing and Display
-->
# prints
Prints at init-time using a printf() style syntax.

## Syntax
=== "Modern"
    ``` csound-orc
    prints("string" [, xval1] [, xval2] [...])
    ```

=== "Classic"
    ``` csound-orc
    prints "string" [, xval1] [, xval2] [...]
    ```

### Initialization

_"string"_ -- the text string to be printed. Can be up to 8192 characters and must be in double quotes.

### Performance

_xval1, xval2, ..._ (optional) -- The k-rate values or strings to be printed. These are specified in _&#8220;string&#8221;_ with the standard C value specifier (%f, %d, %s etc.) in the order given.

_prints_ is similar to the _printks_ opcode except it operates at init-time instead of k-rate. For more information about output formatting, please look at [printks's documentation](../opcodes/printks.md).

## Examples

Here is an example of the prints opcode. It uses the file [prints.csd](../examples/prints.csd).

``` csound-csd title="Example of the prints opcode." linenums="1"
--8<-- "examples/prints.csd"
```

Its output should include a line like this:

```
1234.568        ;;;;;;semicolons!
```

## See also

[Printing and Display](../sigio/pdisplay.md)

## Credits

Author: Matt Ingalls<br>
January 2003<br>
