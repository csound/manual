<!--
id:fprintks
category:Signal I/O:File I/O
-->
# fprintks
Similar to [printks](../opcodes/printks.md) but prints to a file.

## Syntax
=== "Modern"
    ``` csound-orc
    fprintks("filename", "string", [, kval1] [, kval2] [...])
    ```

=== "Classic"
    ``` csound-orc
    fprintks "filename", "string", [, kval1] [, kval2] [...]
    ```

### Initialization

_"filename"_ -- name of the output file.

_"string"_ -- the text string to be printed. Can be up to 8192 characters and must be in double quotes.

### Performance

_kval1, kval2, ..._ (optional) -- The k-rate values to be printed. These are specified in _&#8220;string&#8221;_ with the standard C value specifier (%f, %d, etc.) in the order given.

_fprintks_ is similar to the _printks_ opcode except it outputs to a file and does not have a _itime_ parameter. For more information about output formatting, please look at [printks's documentation](../opcodes/printks.md).

## Examples

Here is an example of the fprintks opcode. It uses the file [fprintks.csd](../examples/fprintks.csd).

``` csound-csd title="Example of the fprintks opcode." linenums="1"
--8<-- "examples/fprintks.csd"
```

This example will generate a file called &#8220;my.sco&#8221;. It should contain lines like this:

```
i1	0.00	1.35	668.01
i1	0.13	2.21	246.53
i1	0.22	1.88	437.51
i1	1.18	9.65	126.09
```

Here is an example of the fprintks opcode, which converts a standard MIDI file to a csound score. It uses the file [fprintks-2.csd](../examples/fprintks-2.csd).

``` csound-csd title="Example of the fprintks opcode to convert a MIDI file to a csound score." linenums="1"
--8<-- "examples/fprintks-2.csd"
```

This example will generate a file called &#8220;MIDI2cs.sco&#8221; containing i-events according to the MIDI file

Here is an advanced example of the fprintks opcode, which generates scores for Csound. It uses the file [scogen.csd](../examples/scogen.csd).

``` csound-csd title="Example of the fprintks opcode to create a Csound score file generator using Csound." linenums="1"
--8<-- "examples/scogen.csd"
```

This example will generate a file called &#8220;schottstaedt.sco&#8221; which can be used as a score together with  [schottstaedt.orc](../examples/schottstaedt.orc)

## See also

[File Input and Output](../sigio/fileio.md)

## Credits

Author: Matt Ingalls<br>
January 2003<br>
