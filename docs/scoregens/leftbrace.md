<!--
id:leftbrace
category:
-->
# { Statement
Begins a non-sectional, nestable loop.

The _{_ and _} statements_ can be used to repeat a group of score statements.  These loops do not constitute independent score sections and thus may repeat events within the same section.  Multiple loops may overlap in time or be nested within each other.

## Syntax
``` csound-orc
{ p1 p2
```

### Initialization

_p1_ -- Number of times to repeat the loop.

_p2_ -- A macro name that is automatically defined at the beginning of the loop and whose value is advanced with each repetition (optional).  The initial value is zero and the final value is (p1 - 1).

### Performance

The _{ statement_ is used in conjunction with the [} statement](../scoregens/rightbrace.md) to define repeating groups of other score events.  A score loop begins with the _{ statement_ which defines the number of repetitions and a unique macro name that will contain the current loop counter.  The body of a loop can contain any number of other events (including sectional breaks) and is terminated by a _} statement_ on its own line. The _} statement_ takes no parameters.

The use of the term "loop" here does not imply any sort of temporal succession to the loop iterations.  In other words, the p2 values of the events inside of the loop are not automatically incremented by the length of the loop in each repetition.  This is actually an advantage since it allows groups of simulataneous events to be easily defined as well. The loop macro can be used along with [ score expressions](../score/eval.md) to increase the start times of events or to vary the events in any other way desired for each iteration.  The macro is incremented by one for each repetition.  Note that unlike the _r statement_, the value of the macro the first time through the loop is zero (0), not one (1).  Therefore the final value is one less than the number of repetitions.

Score loops are a very powerful tool. While similar to the section repeat facility (the [r statement](../scoregens/r.md)), their chief advantage is that the score events in successive iterations of the loop are not separated by a section termination. Thus, it is possible to create multiple loops that overlap in time. Loops also can be nested within each other to a depth of 39 levels.

> :warning: **Warning**
>
> Because of serious problems of interaction with macro expansion, loops must start and end in the same file, and not in a macro.


## Examples

Here are some examples of the _{_ and _} statements_.

``` csound-sco title="Sequentially repeat a three-note phrase four times."
{ 4 CNT

i1  [0.00 + 0.75 * $CNT.]   0.2   220
i1  [0.25 + 0.75 * $CNT.]   .     440
i1  [0.50 + 0.75 * $CNT.]   .     880

}
```

is interpreted as

``` csound-sco
i1  0.00   0.2   220
i1  0.25   .     440
i1  0.50   .     880

i1  0.75   0.2   220
i1  1.00   .     440
i1  1.25   .     880

i1  1.50   0.2   220
i1  1.75   .     440
i1  2.00   .     880

i1  2.25   0.2   220
i1  2.50   .     440
i1  2.75   .     880
```


In this example, _p4_ is assumed to be the frequency of the note event.

``` csound-sco title="Create a group of simultaneous harmonic partials."
{ 8 PARTIAL
i1  0  1   [100 * ($PARTIAL. + 1)]
}
```

is interpreted as

``` csound-sco
i1  0  1   100
i1  0  1   200
i1  0  1   300
i1  0  1   400
i1  0  1   500
i1  0  1   600
i1  0  1   700
i1  0  1   800
```

Here is a full example of the _{_ and _} statements_. It uses the file [leftbrace.csd](../examples/leftbrace.csd).

``` csound-csd title="An example of nested loops to create several inharmonic sine clusters." linenums="1"
--8<-- "examples/leftbrace.csd"
```

## See Also

[Score Statements](../score/statemnt.md)

## Credits

Author: Gabriel Maldonado<br>

New in Csound version 3.52 (?).  (Fixed in version 5.08).
