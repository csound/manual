<!--
id:fprints
category:Signal I/O:File I/O
-->
# fprints
Similar to [prints](../opcodes/prints.md) but prints to a file.

## Syntax
=== "Modern"
    ``` csound-orc
    fprints("filename", "string" [, ival1] [, ival2] [...])
    ```

=== "Classic"
    ``` csound-orc
    fprints "filename", "string" [, ival1] [, ival2] [...]
    ```

### Initialization

_"filename"_ -- name of the output file.

_"string"_ -- the text string to be printed. Can be up to 8192 characters and must be in double quotes.

_ival1, ival2, ..._ (optional) -- The i-rate values to be printed. These are specified in _&#8220;string&#8221;_ with the standard C value specifier (%f, %d, etc.) in the order given.

### Performance

_fprints_ is similar to the [prints](../opcodes/prints.md) opcode except it outputs to a file. For more information about output formatting, please look at [printks's documentation](../opcodes/printks.md).

## Examples

Here is an example of the fprints opcode. It uses the file [fprints.csd](../examples/fprints.csd). Note that the example must be run from a directory for which the user has write access.

``` csound-csd title="Example of the fprints opcode." linenums="1"
--8<-- "examples/fprints.csd"
```

This example will generate a file called &#8220;my.sco&#8221;. It should contain a line like this:

```
;Generated score by ma++
```

## See also

[File Input and Output](../sigio/fileio.md)

## Credits

Author: Matt Ingalls<br>
January 2003<br>
