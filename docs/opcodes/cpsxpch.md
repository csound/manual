<!--
id:cpsxpch
category:Pitch Converters:Tuning Opcodes
-->
# cpsxpch
Converts a pitch-class value into cycles-per-second (Hz) for equal divisions of any interval.

There is a restriction of no more than 100 equal divisions.

## Syntax
=== "Modern"
    ``` csound-orc
    icps = cpsxpch(ipch, iequal, irepeat, ibase)
    ```

=== "Classic"
    ``` csound-orc
    icps cpsxpch ipch, iequal, irepeat, ibase
    ```

### Initialization

_ipch_ -- Input number of the form 8ve.pc, indicating an 'octave' and which note in the octave.

_iequal_ -- if positive, the number of equal intervals into which the 'octave' is divided. Must be less than or equal to 100. If negative, is the number of a table of frequency multipliers.

_irepeat_ -- Number indicating the interval which is the 'octave.' The integer 2 corresponds to octave divisions, 3 to a twelfth, 4 is two octaves, and so on. This need not be an integer, but must be positive.

_ibase_ -- The frequency which corresponds to pitch 0.0

> :memo: **Note**
>
> 1. The following are essentially the same
> ``` csound-orc
> ia  =  cpspch(8.02)
> ib     cps2pch  8.02, 12
> ic     cpsxpch  8.02, 12, 2, 1.02197503906
> ```
> 2. These are opcodes not functions
> 3. Negative values of _ipch_ are allowed, but not negative _irepeat_, _iequal_ or _ibase_.

## Examples

Here is an example of the cpsxpch opcode. It uses the file [cpsxpch.csd](../examples/cpsxpch.csd).

``` csound-csd title="Example of the cpsxpch opcode." linenums="1"
--8<-- "examples/cpsxpch.csd"
```

Its output should include lines like this:

```
instr 1:  icps = 293.666
```

Here is an example of the cpsxpch opcode using a 10.5 ET scale. It uses the file [cpsxpch_105et.csd](../examples/cpsxpch_105et.csd).

``` csound-csd title="Example of the cpsxpch opcode using a 10.5 ET scale." linenums="1"
--8<-- "examples/cpsxpch_105et.csd"
```

Its output should include lines like this:

```
instr 1:  icps = 4776.824
```

Here is an example of the cpsxpch opcode using a Pierce scale centered on middle A. It uses the file [cpsxpch_pierce.csd](../examples/cpsxpch_pierce.csd).

``` csound-csd title="Example of the cpsxpch opcode using a Pierce scale centered on middle A." linenums="1"
--8<-- "examples/cpsxpch_pierce.csd"
```

Its output should include lines like this:

```
instr 1:  icps = 2827.762
```

## See also

[Pitch Converters: Tuning Opcodes](../pitch/tuning.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
1997<br>

New in Csound version 3.492
