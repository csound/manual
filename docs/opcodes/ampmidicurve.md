<!--
id:ampmidicurve
category:Real-time MIDI:Converters
-->
# ampmidicurve
Maps an input MIDI velocity number to an output gain factor with a maximum value of 1, modifying the output gain by a dynamic range and a shaping exponent.

Plugin opcode in ampmidid.

The minimum output gain is 1 minus the dynamic range. A shaping exponent of 1 gives a linear response; increasing the exponent produces an increasingly depressed knee in the gain response curve.

## Syntax
=== "Modern"
    ``` csound-orc
    igain = ampmidicurve(ivelocity, idynamicrange, iexponent)
    kgain = ampmidicurve(kvelocity, kdynamicrange, kexponent)
    ```

=== "Classic"
    ``` csound-orc
    igain ampmidicurve ivelocity, idynamicrange, iexponent
    kgain ampmidicurve kvelocity, kdynamicrange, kexponent
    ```

### Initialization

_imidivelocity _ -- MIDI velocity number, ranging from 0 through 127.

_idynamicrange_ -- Intended dynamic range of gain, from 0 through 1.

_iexponent_ -- Exponent applied to shape the gain response curve, 1 or greater.

### Performance

_kmidivelocity _ -- MIDI velocity number, ranging from 0 through 127.

_kdynamicrange_ -- Intended dynamic range of gain, from 0 through 1.

_kexponent_ -- Exponent applied to shape the gain response curve, 1 or greater.

Maps an input MIDI velocity number to an output gain factor with a maximum value of 1, modifying the output gain by a dynamic range and a shaping exponent. The minimum output gain is 1 minus the dynamic range. A shaping exponent of 1 gives a linear response; increasing the exponent produces an increasingly depressed knee in the gain response curve, according to the equation: $y = d \; (x/127)^h + 1 - d$, where $y$ = the gain, $x$ = the input MIDI velocity (from 0 through 127), $d$ = the dynamic range (from p through 1), and $h$ = the shaping exponent (1 or greater). This opcode was suggested by Mauro Giubileo.

## Examples

=== "Modern"
    Here is an example of the ampmidicurve opcode. It uses the file [ampmidicurve-modern.csd](../examples/ampmidicurve-modern.csd).
    ``` csound-csd title="Example of the ampmidicurve opcode." linenums="1"
    --8<-- "examples/ampmidicurve-modern.csd"
    ```

=== "Classic"
    Here is an example of the ampmidicurve opcode. It uses the file [ampmidicurve.csd](../examples/ampmidicurve.csd).
    ``` csound-csd title="Example of the ampmidicurve opcode." linenums="1"
    --8<-- "examples/ampmidicurve.csd"
    ```

## See also

[Midi Converters](../midi/convert.md)

## Credits

Author: Michael Gogins<br>
2019<br>
