<!--
id:undef
category:Orchestra Syntax:Macros
-->
# &num;undef
Un-defines a macro.

Macros are textual replacements which are made in the orchestra as it is being read.  The [orchestra macro system](../orch/macros.md) in Csound is a very simple one, and uses the characters &num; and &dollar; to define and call macros. This can save typing, and can lead to a coherent structure and consistent style.  This is similar to, but independent of, the [macro system in the score language](../score/macros.md).

_&num;undef NAME_ -- undefines a macro name. If a macro is no longer required, it can be undefined with _&num;undef NAME_.

## Syntax
``` csound-orc
#undef NAME
```

### Performance

Some care is needed with textual replacement macros, as they can sometimes do strange things.  They take no notice of any meaning, so spaces are significant. This is why, unlike the C programming language, the definition has the replacement text surrounded by &num; characters. Used carefully, this simple macro system is a powerful concept, but it can be abused.

## Examples

This example removes `FREQ2` inside instrument 1. Macro processing follows the order of the orchestra text and happens before any notes play. The `#undef` therefore affects the code that follows it, including instrument 2.

Instrument 2 plays first in the score, but its `#ifdef FREQ2` selects the `#else` branch. Both instruments use 440 Hz. Comment out `#undef FREQ2` and run the example again to hear instrument 2 at 660 Hz, followed by instrument 1 at 440 Hz.

=== "Modern"
    The file [undef-modern.csd](../examples/undef-modern.csd) uses modern syntax.
    ``` csound-csd title="Example of #undef." linenums="1"
    --8<-- "examples/undef-modern.csd"
    ```

=== "Classic"
    The file [undef.csd](../examples/undef.csd) uses classic syntax.
    ``` csound-csd title="Example of #undef." linenums="1"
    --8<-- "examples/undef.csd"
    ```

The console output includes these lines.

``` text
Instrument 2 uses 440 Hz
Instrument 1 uses 440 Hz
```

## See also

[#define](define.md), [#ifdef](ifdef.md), [Orchestra Macros](../orch/macros.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
April 1998<br>

New in Csound version 3.48
