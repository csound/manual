<!--
id:lphasor
category:Signal Generators:Sample Playback
-->
# lphasor
Generates a table index for sample playback (e.g. with [tablexkt](../opcodes/tablexkt.md)).

## Syntax
=== "Modern"
    ``` csound-orc
    ares = lphasor(xtrns [, ilps] [, ilpe] [, imode] [, istrt] [, istor])
    ```

=== "Classic"
    ``` csound-orc
    ares lphasor xtrns [, ilps] [, ilpe] [, imode] [, istrt] [, istor]
    ```

### Initialization

_ilps_ -- loop start.

_ilpe_ -- loop end (must be greater than _ilps_ to enable looping).  The default value of _ilps_ and _ilpe_ is zero.

_imode_ (optional: default = 0) -- loop mode. Allowed values are:

*  _0:_ no loop
*  _1:_ forward loop
*  _2:_ backward loop
*  _3:_ forward-backward loop

_istrt_ (optional: default = 0) -- The initial output value (phase). It must be less than _ilpe_ if looping is enabled, but is allowed to be greater than _ilps_ (i.e. you can start playback in the middle of the loop).

_istor_ (optional: default = 0) -- skip initialization if set to any non-zero value.

### Performance

_ares_ -- a raw table index in samples (same unit for loop points). Can be used as index with the table opcodes.

_xtrns_ -- transpose factor, expressed as a playback ratio. _ares_ is incremented by this value, and wraps around loop points. For example, 1.5 means a fifth above, 0.75 means fourth below. It is not allowed to be negative.

## Examples

Here is an example of the lphasor opcode. It uses the file [lphasor.csd](../examples/lphasor.csd).

``` csound-csd title="Example of the lphasor opcode." linenums="1"
--8<-- "examples/lphasor.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: Istvan Varga<br>
January 2002<br>
Example by: Jonathan Murphy<br>

New in version 4.18

Updated April 2002 and November 2002 by Istvan Varga
