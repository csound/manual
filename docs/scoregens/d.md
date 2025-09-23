<!--
id:d
category:
-->
# d Statement (De Note Statement)
Removes an active instrument at a specific time.

This statement calls for an instrument that has been held to be removed at a specific time.

## Syntax
``` csound-orc
i  p1  p2  p3  p4
```

### Initialization

_p1_ -- Instrument number. An optional fractional part can provide an additional tag for specifying ties between particular notes of consecutive clusters.

_p2_ -- Starting time in arbitrary units called beats.

_p3_ -- ignored but required.  Usually zero.

### Performance

Beats are evaluated as seconds, unless there is a [t statement](../scoregens/t.md) in this score section or a [-t flag](../invoke/cs-options-by-category.md#-t-num-temponum) in the command-line.

Action times are relative to the beginning of a section ( see [s statement](../scoregens/s.md)), which is assigned time 0.

Note statements within a section may be placed in any order. Before being sent to an orchestra, unordered score statements must first be processed by Sorter, which will reorder them by ascending p2 value. Notes with the same p2 value will be ordered by ascending p1; if the same p1, then by ascending p3.

## Examples

Here is an example of the d statement. It uses the file [d_statement.csd](../examples/d_statement.csd).

``` csound-csd title="Example of the d statement." linenums="1"
--8<-- "examples/d_statement.csd"
```

## See Also

[Score Statements](../score/statemnt.md)

## Credits

Author: John ffitch, new in version 6.09.
