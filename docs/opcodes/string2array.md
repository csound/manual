<!--
id:string2array
category:Strings:Conversion
-->
# string2array
Reads a list of numbers from a string into an array.

Use `string2array` to turn a text list of pitches, durations or other settings into numbers an instrument can use. It accepts decimal numbers separated by whitespace or commas.

## Syntax

=== "Modern"
    ``` csound-orc
    iarray[] = string2array(Svalues)
    karray[] = string2array(Svalues)
    ```

=== "Classic"
    ``` csound-orc
    iarray[] string2array Svalues
    karray[] string2array Svalues
    ```

### Initialization

`Svalues` contains the numbers to read. Spaces, tabs, newlines and commas separate values. Repeated separators are allowed. Use a decimal point for fractions, since a comma separates two numbers.

The output holds numeric values in the order they appear in the string. Both i-rate and k-rate arrays are supported. The opcode reads the string at initialization only, including when reinitialization runs. Changing the string during performance does not update a k-rate output array.

For a new array, the opcode creates a one-dimensional array with one element per number. An existing one-dimensional output takes that size too. You do not need to allocate it first.

A preallocated multidimensional output keeps its shape. The opcode fills it in row-major order, with the last index changing fastest. Extra values beyond its element count are ignored, and elements beyond the supplied values keep their previous contents.

### String format

Numbers can have a sign, a fractional part or an exponent written with `e` or `E`.

| Input string | Output values |
| --- | --- |
| `"60 64 67"` | `[60, 64, 67]` |
| `"0.5, -2, +3"` | `[0.5, -2, 3]` |
| `"1e2 2.5E-1"` | `[100, 0.25]` |

Supply plain numeric data. Expressions, note names, comments and quoted text fields are not supported. The parser does not reliably report malformed numbers, so check text from outside the instrument before passing it in. Keep each numeric token to at most 127 characters.

The output contains numbers, not strings or character codes. Use [strchar](strchar.md) to read a character code or [strtod](strtod.md) to convert a single number.

## Examples

The example passes pitch steps in a score string. The instrument reads them into an i-rate array, adds each step to MIDI note 60 and schedules the notes 0.4 seconds apart.

The first phrase uses `0, 4, 7, 12` for a major arpeggio. The second uses `0 3 7 12` for a minor arpeggio. This lets the score choose the phrase without changing the instrument.

It uses [string2array.csd](../examples/string2array.csd).

``` csound-csd title="Play pitch steps supplied as text" linenums="1"
--8<-- "examples/string2array.csd"
```

## See also

[fillarray](fillarray.md), [strget](strget.md), [strtod](strtod.md), [strchar](strchar.md), [Array opcodes](../math/array.md), [String conversion](../strings/convert.md)

## Credits

Author John ffitch, 2019.

New in Csound 6.13.
