<!--
id:metro
category:Instrument Control:Sensing and Control
-->
# metro
Trigger Metronome.

Generate a metronomic signal to be used in any circumstance an isochronous trigger is needed.

## Syntax
=== "Modern"
    ``` csound-orc
    ktrig  = metro( kfreq [, initphase])
    ```

=== "Classic"
    ``` csound-orc
    ktrig  metro  kfreq [, initphase]
    ```

### Initialization

_initphase_  - initial phase value (in the 0 to 1 range)

### Performance

_ktrig_ - output trigger signal

_kfreq_ - frequency of trigger bangs in cps

_metro_ is a simple opcode that outputs a sequence of isochronous bangs (that is 1 values) each 1/kfreq seconds. Trigger signals can be used in any circumstance, mainly to temporize realtime algorithmic compositional structures.

> :memo: **Note**
>
> _metro_ will produce a trigger signal of 1 when its phase is exactly 0 or 1. If you want to skip the initial trigger, use a very small value like 0.00000001.

## Examples

Here is an example of the metro opcode. It uses the file [metro.csd](../examples/metro.csd)

``` csound-csd title="Example of the metro opcode." linenums="1"
--8<-- "examples/metro.csd"
```

Here is another example of the metro opcode. It uses the file [metro-2.csd](../examples/metro-2.csd)

``` csound-csd title="Another example of the metro opcode." linenums="1"
--8<-- "examples/metro-2.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

More information on this opcode in the Floss Manuals: [https://flossmanual.csound.com/csound-language/control-structures](https://flossmanual.csound.com/csound-language/control-structures)

## Credits

Written by Gabriel Maldonado.

First Example written by Andrés Cabrera.

New in Csound 5 (Previously available only on CsoundAV)
