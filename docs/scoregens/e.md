<!--
id:e
category:
-->
# e Statement
This statement may be used to mark the end of the last section of the score.

## Syntax
``` csound-orc
e [0 time]
```

### Performance

The second p-field _time_ is optional and if present determines the end time (length in beats) of the final section of the score.  This time must be after the end of the last event otherwise it will have no effect. "Always on" instruments will end at the given time. Extending the section in this way is useful to avoid prematurely cutting off reverb tails or other effects.

### Special Considerations

The _e statement_ is contextually identical to an [s statement](../scoregens/s.md). Additionally, the _e statement_ terminates all signal generation (including indefinite performance) and closes all input and output files.

If an _e statement_ occurs before the end of a score, all subsequent score lines will be ignored.

The _e statement_ is optional in a score file yet to be sorted. If a score file has no _e statement_, then Sort processing will supply one.

## Examples

Here is an example of the e statement. It uses the file [e.csd](../examples/e.csd).

``` csound-csd title="Example of the e statement." linenums="1"
--8<-- "examples/e.csd"
```

## See Also

[Score Statements](../score/statemnt.md)
