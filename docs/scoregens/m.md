<!--
id:m
category:
-->
# m Statement (Mark Statement)
Sets a named mark in the score, which can be used by an [n statement](../scoregens/n.md).

## Syntax
``` csound-orc
m p1
```

### Initialization

_p1_ -- Name of mark.

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

Here is an example of the m statement. It uses the file [m.csd](../examples/m.csd).

``` csound-csd title="Example of the m statement." linenums="1"
--8<-- "examples/m.csd"
```

## See Also

[Score Statements](../score/statemnt.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
April, 1998<br>

New in Csound version 3.48
