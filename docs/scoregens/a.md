<!--
id:a
category:
-->
# a Statement (or Advance Statement)
Advance score time by a specified amount without producing sound samples.

## Syntax
``` csound-orc
a p1  p2  p3
```

### Performance

```
p1    Carries no meaning. Usually zero.
p2    Action time, in beats, at which advance is to begin.
p3    Number of beats to advance without producing sound.
p4    |
p5    |    These carry no meaning.
p6    |
.
.
```

### Special Considerations

This statement allows the beat count within a score section to be advanced without generating intervening sound samples. This can be of use when a score section is incomplete (the beginning or middle is missing) and the user does not wish to generate and listen to a lot of silence.

p2, action time, and p3, number of beats, are treated as in [i statements](../scoregens/i.md), with respect to sorting and modification by [t statements](../scoregens/t.md).

An _a statement_ will be temporarily inserted in the score by the Score Extract feature when the extracted segment begins later than the start of a Section. The purpose of this is to preserve the beat count and time count of the original score for the benefit of the peak amplitude messages which are reported on the user console.

Whenever an _a statement_ is encountered by a performing orchestra, its presence and effect will be reported on the user's console.

## Examples

=== "Modern"
    Here is an example of the a statement. It uses the file [a-modern.csd](../examples/a-modern.csd).
    ``` csound-csd title="Example of the a statement." linenums="1"
    --8<-- "examples/a-modern.csd"
    ```

=== "Classic"
    Here is an example of the a statement. It uses the file [a.csd](../examples/a.csd).
    ``` csound-csd title="Example of the a statement." linenums="1"
    --8<-- "examples/a.csd"
    ```

## See Also

[Score Statements](../score/statemnt.md)
