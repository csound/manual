<!--
id:ftchnls
category:Table Control:Table Queries
-->
# ftchnls
Returns the number of channels in a stored function table.

## Syntax
``` csound-orc
ftchnls(x) (init-rate args only)
```

### Performance

Returns the number of channels of a [GEN01](../scoregens/gen01.md) table, determined from the header of the original file.  If the original file has no header or the table was not created by these GEN01, _ftchnls_ returns -1.

## Examples

Here is an example of the ftchnls opcode. It uses the files [ftchnls.csd](../examples/ftchnls.csd), [drumsMlp.wav](../examples/drumsMlp.wav), and [drumsSlp.wav](../examples/drumsSlp.wav).

``` csound-csd title="Example of the ftchnls opcode." linenums="1"
--8<-- "examples/ftchnls.csd"
```

The audio file &#8220;drumsMlp.wav&#8221; is monophonic, the audio file &#8220;drumsSlp.wav&#8221; is stereophonic, so its output should include lines like these:

```
number of channels = 1
number of channels = 2
```

## See also

[Table Control:Table Queries](../table/queries.md)

## Credits

Author: Chris McCormick<br>
Perth, Australia<br>
December 2001<br>
