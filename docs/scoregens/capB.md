<!--
id:capB
category:
-->
# B Statement
This statement adjusts the clock accumultively.

## Syntax
``` csound-orc
B p1
```

### Performance

_p1_ -- Specifies how the clock is to be set.

### Special Considerations

p1 is the number of beats by which p2 values of subsequent _i statements_ are modified. If p1 is positive, the clock is reset forward, and subsequent notes appear later, the number of beats specified by p1 being added to the note's p2. If p1 is negative, the clock is reset backward, and subsequent notes appear earlier, the number of beats specified by p1 being subtracted from the note's p2. The clock is incremented by p1 for subsequent notes.

## Examples

=== "Modern"
    Here is an example of the B statement. It uses the file [capB-modern.csd](../examples/capB-modern.csd).
    ``` csound-csd title="Example of the B statement." linenums="1"
    --8<-- "examples/capB-modern.csd"
    ```

=== "Classic"
    Here is an example of the B statement. It uses the file [capB.csd](../examples/capB.csd).
    ``` csound-csd title="Example of the B statement." linenums="1"
    --8<-- "examples/capB.csd"
    ```

## See Also

[Score Statements](../score/statemnt.md)

## Credits

New in Csound 6.15.
