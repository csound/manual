<!--
id:sc_phasor
category:Signal Generators:Phasors
status:deprecated
-->
# scphasor
A resettable linear ramp between two levels (renamed as trigphasor).

Plugin opcode in scugens.

Port of Supercollider's Phasor. DEPRECATED (renamed as [trigphasor](../opcodes/trigphasor.md), )

## Syntax
=== "Modern"
    ``` csound-orc
    aindex = scphasor(xtrig, xrate, kstart, kend [, kresetPos])
    kindex = scphasor(xtrig, xrate, kstart, kend [, kresetPos])
    ```

=== "Classic"
    ``` csound-orc
    aindex sc_phasor xtrig, xrate, kstart, kend [, kresetPos]
    kindex sc_phasor xtrig, xrate, kstart, kend [, kresetPos]
    ```

### Performance

Phasor is a linear ramp between _kstart_ and _kend_ values. When its trigger input crosses from non-positive to positive, sc_phasor's output will jump to its reset position (or to _kstart_if no reset value was given). Upon reaching the end of its ramp, *sc_phasor* will wrap back to its start.

If _kresetPos_ is specified, this value will be used to jump to after a trigger. Otherwise, a trigger will set the position back to _kstart_

If one wants Phasor to output a signal with frequency _freq_ oscillating between _start_ and _end_, then the _rate_ should be:

```
(end - start) * freq / sr
```

## Examples
=== "Modern"
    Here is an example of the scphasor opcode. It uses the file [scphasor.csd](../examples/scphasor.csd).
    ``` csound-csd title="Example of the scphasor opcode." linenums="1"
    --8<-- "examples/scphasor.csd"
    ```

=== "Classic"
    Here is an example of the sc_phasor opcode. It uses the file [sc_phasor.csd](../examples/sc_phasor.csd).
    ``` csound-csd title="Example of the sc_phasor opcode." linenums="1"
    --8<-- "examples/sc_phasor.csd"
    ```

## See also

[phasor](../opcodes/phasor.md)

## Credits

By: Eduardo Moguillansky 2017
