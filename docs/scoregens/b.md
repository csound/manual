<!--
id:b
category:
-->
# b Statement
This statement resets the clock.

## Syntax
``` csound-orc
b p1
```

### Performance

_p1_ -- Specifies how the clock is to be set.

### Special Considerations

p1 is the number of beats by which p2 values of subsequent _i statements_ are modified. If p1 is positive, the clock is reset forward, and subsequent notes appear later, the number of beats specified by p1 being added to the note's p2. If p1 is negative, the clock is reset backward, and subsequent notes appear earlier, the number of beats specified by p1 being subtracted from the note's p2. There is no cumulative affect. The clock is reset with each _b statement_. If p1 = 0, the clock is returned to its original position, and subsequent notes appear at their specified p2.

## Examples

=== "Modern"
    Here is an example of the C statement. It uses the file [b-modern.csd](../examples/b-modern.csd).
    ``` csound-csd title="Example of the C statement." linenums="1"
    --8<-- "examples/b-modern.csd"
    ```

=== "Classic"
    Here is an example of the C statement. It uses the file [b.csd](../examples/b.csd).
    ``` csound-csd title="Example of the C statement." linenums="1"
    --8<-- "examples/b.csd"
    ```

## See Also

[Score Statements](../score/statemnt.md)

## Credits

Explanation suggested and example provided by Paul Winkler. (Csound Version 4.07)
