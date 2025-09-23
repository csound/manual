<!--
id:trigphasor
category:Signal Generators:Phasors
-->
# trigphasor
A resettable linear ramp between two levels.

Plugin opcode in scugens.

A resettable linear ramp between two levels (port of Supercollider's Phasor). _trigphasor_ is a linear ramp between _kstart_ and _kend_ values. When its trigger input crosses from non-positive to positive, trigphasor's output will jump to its reset position (or to _kstart_if no reset value was given). Upon reaching the end of its ramp, trigphasor will wrap back to its start.

## Syntax
=== "Modern"
    ``` csound-orc
    aindex = trigphasor(xtrig, xrate, kstart, kend [, kresetPos])
    kindex = trigphasor(xtrig, xrate, kstart, kend [, kresetPos])
    ```

=== "Classic"
    ``` csound-orc
    aindex trigphasor xtrig, xrate, kstart, kend [, kresetPos]
    kindex trigphasor xtrig, xrate, kstart, kend [, kresetPos]
    ```

### Performance

_xtrig_ -- trigger, whenever this crosses from non-positive to possitive

_xrate_ -- value added at each evaluation. When running at k-rate, this value is added at each cycle; at a-rate, this value is added per sample (ksmps per cycle).

_kstart, kend_ -- start and end values of the phasor

_xtrig_ -- trigger, whenever this crosses from non-positive to possitive

_kresetPos_ -- if specified, this value will be used to jump to after a trigger. Otherwise, a trigger will set the position back to _kstart_

To generate a phasing signal from kstart to kend with a given period (duration of each cycle), the calculation would be:

```
rate = (end - start) / (period * sr)
```

In the case of phasor being used at k-rate, use _kr_ instead of _sr_ in the above formula.

## Examples

Here is an example of the trigphasor opcode. It uses the file [trigphasor.csd](../examples/trigphasor.csd).

``` csound-orc title="Example of the trigphasor opcode." linenums="1"
--8<-- "examples/trigphasor.csd"
```

## See also

[Phasors](../siggen/phasors.md)

## Credits

By: Eduardo Moguillansky 2017
