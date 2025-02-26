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

``` csound-orc


i1     0      2
i1     10     888		

b 5                           ; set the clock "forward"
i2     1      1     440       ; start time = 6
i2     2      1     480       ; start time = 7

b -1                          ; set the clock back
i3     3      2     3.1415    ; start time = 2
i3     5.5    1     1.1111    ; start time = 4.5

b 0                           ; reset clock to normal
i4     10     200   7         ; start time = 10

```

## See Also

[Score Statements](../../score/statemnt)

## Credits

Explanation suggested and example provided by Paul Winkler. (Csound Version 4.07)
