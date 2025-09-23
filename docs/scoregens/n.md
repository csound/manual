<!--
id:n
category:
-->
# n Statement
Repeats a section from the referenced [m statement](../scoregens/m.md).

## Syntax
``` csound-orc
n p1
```

### Initialization

_p1_ -- Name of mark to repeat.

### Performance

This can be helpful in setting a up verse and chorus structure in the score. Names may contain letters and numerals.

For example, the following score:

``` csound-sco
m foo
i1 0 1
i1 1 1.5
i1 2.5 2
s
i1 0 10
s
n foo
e
```

Will be passed from the preprocessor to Csound as:

``` csound-sco
i1 0 1
i1 1 1.5
i1 2.5 2
s
i1 0 10
s
;; this is named section repeated
i1 0 1
i1 1 1.5
i1 2.5 2
s
;; end of named section
e
```

## Examples

See the example for the [m statement](../scoregens/m.md).

## See Also

[Score Statements](../score/statemnt.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
April 1998<br>

New in Csound version 3.48
