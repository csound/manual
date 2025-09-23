<!--
id:rightbrace
category:
-->
# } Statement
Ends a non-sectional, nestable loop.

The _{_ and _} statements_ can be used to repeat a group of score statements. These loops do not constitute independent score sections and thus may repeat events within the same section.  Multiple loops may overlap in time or be nested within each other.

## Syntax
``` csound-orc
}
```

### Initialization

All pfields are ignored.

### Performance

The _} statement_ is used in conjunction with the [{ statement](../scoregens/leftbrace.md) to define repeating groups of other score events.  A score loop begins with the _{ statement_ which defines the number of repetitions and a unique macro name that will contain the current loop counter.  The body of a loop can contain any number of other events (including sectional breaks) and is terminated by a _} statement_ on its own line. The _} statement_ takes no parameters.

See the documentation for the [{ statement](../scoregens/leftbrace.md) for further details.

## Examples

See the examples in the entry for the [{ statement](../scoregens/leftbrace.md).

## See Also

[Score Statements](../score/statemnt.md)

## Credits

Author: Gabriel Maldonado<br>

New in Csound version 3.52 (?).  (Fixed in version 5.08).
