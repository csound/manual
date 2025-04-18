<!--
id:ftcps
category:Table Control:Table Queries
-->
# ftcps
Returns the base frequency of a stored function table in Hz.

## Syntax
``` csound-orc
ftcps(x) (init-rate args only)
```

### Performance

Returns the base frequency of stored function table, number _x_.  _ftcps_ is designed for tables storing audio waveforms read from files (see [GEN01](../scoregens/gen01.md)).

_ftcps_ returns -1 in case of an error (no base frequency set in table or non-existent table).

## Examples

Here is an example of the ftcps opcode.

``` csound-csd title="Example of the ftcps opcode." linenums="1"
--8<-- "examples/ftcps.csd"
```

## See also

[Table Control:Table Queries](../table/queries.md)

## Credits

Author: Victor Lazzarini<br>
2010<br>

Example written by Victor Lazzarini
