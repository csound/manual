<!--
id:r
category:
-->
# r Statement (Repeat Statement)
Starts a repeated section, which lasts until the next _s_, _r_ or _e statement_.

## Syntax
``` csound-orc
r p1 p2
```

### Initialization

_p1_ -- Number of times to repeat the section.

_p2_ -- Macro(name) to advance with each repetition (optional).

### Performance

In order that the sections may be more flexible than simple editing, the macro named p2 is given the value of 1 for the first time through the section, 2 for the second, and 3 for the third.  This can be used to change p-field parameters, or ignored.

> :warning: **Warning**
>
> Because of serious problems of interaction with macro expansion, sections must start and end in the same file, and not in a macro.


## Examples

Here is an example of the r statement. It uses the file [r.csd](../examples/r.csd).

``` csound-csd title="Example of the r statement." linenums="1"
--8<-- "examples/r.csd"
```

## See Also

[Score Statements](../score/statemnt.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
April, 1998<br>

New in Csound version 3.48

Example written by Kevin Conder
