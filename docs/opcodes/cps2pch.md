<!--
id:cps2pch
category:Pitch Converters:Tuning Opcodes
-->
# cps2pch
Converts a pitch-class value into cycles-per-second (Hz) for equal divisions of the octave.

## Syntax
=== "Modern"
    ``` csound-orc
    icps = cps2pch(ipch, iequal)
    ```

=== "Classic"
    ``` csound-orc
    icps cps2pch ipch, iequal
    ```

### Initialization

_ipch_ -- Input number of the form 8ve.pc, indicating an 'octave' and which note in the octave.

_iequal_ -- If positive, the number of equal intervals into which the 'octave' is divided. Must be less than or equal to 100. If negative, is the number of a table of frequency multipliers.

> :memo: **Note**
>
> 1.  The following are essentially the same
> ``` csound-orc
> ia  =  cpspch(8.02)
> ib     cps2pch  8.02, 12
> ic     cpsxpch  8.02, 12, 2, 1.02197503906
> ```
>
> 2.   These are opcodes not functions
> 3.   Negative values of _ipch_ are allowed.

## Examples

Here is an example of the cps2pch opcode. It uses the file [cps2pch.csd](../examples/cps2pch.csd).

``` csound-csd title="Example of the cps2pch opcode." linenums="1"
--8<-- "examples/cps2pch.csd"
```

Its output should include lines like this:

```
instr 1:  icps = 293.666
```

Here is an example of the cps2pch opcode using a table of frequency multipliers. It uses the file [cps2pch_ftable.csd](../examples/cps2pch_ftable.csd).

``` csound-csd title="Example of the cps2pch opcode using a table of frequency multipliers." linenums="1"
--8<-- "examples/cps2pch_ftable.csd"
```

Its output should include lines like this:

```
instr 1:  icps = 313.951
```

Here is an example of the cps2pch opcode using a 19ET scale. It uses the file [cps2pch_19et.csd](../examples/cps2pch_19et.csd).

``` csound-csd title="Example of the cps2pch opcode using a 19ET scale." linenums="1"
--8<-- "examples/cps2pch_19et.csd"
```

Its output should include lines like this:

```
instr 1:  icps = 281.429
```

## See also

[Pitch Converters: Tuning Opcodes](../pitch/tuning.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
1997<br>

New in Csound version 3.492
