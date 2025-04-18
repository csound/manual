<!--
id:ftsr
category:Table Control:Table Queries
-->
# ftsr
Returns the sampling-rate of a stored function table.

## Syntax
``` csound-orc
ftsr(x) (init-rate args only)
```

### Performance

Returns the sampling-rate of a [GEN01](../scoregens/gen01.md) generated table. The sampling-rate is determined from the header of the original file. If the original file has no header or the table was not created by these GEN01, _ftsr_ returns 0. New in Csound version 3.49.

## Examples

Here is an example of the ftsr opcode. It uses the file [ftsr.csd](../examples/ftsr.csd).

``` csound-csd title="Example of the ftsr opcode." linenums="1"
--8<-- "examples/ftsr.csd"
```

its output should lines like these:

```
sampling-rate of table number 1 = 44100
sampling-rate of table number 2 = 22050
sampling-rate of table number 3 = 44100
sampling-rate of table number 4 = 44100
```

## See also

[Table Control:Table Queries](../table/queries.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
October 1998<br>
