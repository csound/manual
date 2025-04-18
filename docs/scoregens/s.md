<!--
id:s
category:
-->
# s Statement
Marks the end of a section.

## Syntax
``` csound-orc
s [time]
```

### Initialization

The first p-field _time_ is optional and if present determines the end time (length in beats) of the section.  This time must be after the end of the last event in the section otherwise it will have no effect. This can be used to create a pause before the beginning of the next section or to allow "always on" instruments such as effects to play by themselves for some length of time.

### Performance

Sorting of the [i statement](../scoregens/i.md), [f statement](../scoregens/f.md) and [a statement](../scoregens/a.md) by action time is done section by section.

Time warping for the [t statement](../scoregens/t.md) is done section by section.

All action times within a section are relative to its beginning. A section statement establishes a new relative time of 0, but has no other reinitializing effects (e.g. stored function tables are preserved across section boundaries).

A section is considered complete when all action times and finite durations have been satisfied (i.e., the &quot;length&quot; of a section is determined by the last occurring action or turn-off). A section can be extended by the use of an [f0 statement](../scoregens/f.md) or by supplying the optional _p1_ value to the _s statement_.

A section ending automatically invokes a purge of inactive instrument and data spaces.

> :memo: **Note**
>
> *   Since score statements are processed section by section, the amount of memory required depends on the maximum number of score statements in a section. Memory allocation is dynamic, and the user will be informed as extra memory blocks are requested during score processing.
> *   For the end of the final section of a score, the _s statement_ is optional; the [e statement](../scoregens/e.md) may be used instead.


## Examples

Here is an example of the s statement. It uses the file [s.csd](../examples/s.csd).

``` csound-csd title="Example of the s statement." linenums="1"
--8<-- "examples/s.csd"
```

## See Also

[Score Statements](../score/statemnt.md)
