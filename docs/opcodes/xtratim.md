<!--
id:xtratim
category:Real-time MIDI:Event Extenders
-->
# xtratim
Extend the duration of real-time generated events and handle their extra life (Usually for usage along with [release](../opcodes/release.md) instead of [linenr](../opcodes/linenr.md), [linsegr](../opcodes/linsegr.md), etc).

## Syntax
=== "Modern"
    ``` csound-orc
    xtratim(iextradur)
    ```

=== "Classic"
    ``` csound-orc
    xtratim iextradur
    ```

### Initialization

_iextradur_ -- additional duration of current instrument instance

### Performance

_xtratim_ extends current MIDI-activated note duration by _iextradur_ seconds after the corresponding noteoff message has deactivated the current note itself. It is usually used in conjunction with [release](../opcodes/release.md). This opcode has no output arguments.

This opcode is useful for implementing complex release-oriented envelopes, whose duration is not known when the envelope starts (e.g. for real-time MIDI generated events).

## Examples

Here is a simple example of the xtratim opcode. It uses the file [xtratim.csd](../examples/xtratim.csd).

``` csound-csd title="Example of the xtratim opcode." linenums="1"
--8<-- "examples/xtratim.csd"
```

Here is a more elaborate example of the xtratim opcode. It uses the file [xtratim-2.csd](../examples/xtratim-2.csd).

This example shows how to generate a release segment for an ADSR envelope after a MIDI noteoff is received, extending the duration with xtratim and using release to check whether the note is on the release phase. Two envelopes are generated simultaneously for the left and right channels.

``` csound-csd title="More complex example of the xtratim opcode." linenums="1"
--8<-- "examples/xtratim-2.csd"
```

## See also

[Event Extenders](../midi/extender.md)

## Credits

Author: Gabriel Maldonado

Italy

Examples by Gabriel Maldonado and Jonathan Murphy

New in Csound version 3.47
