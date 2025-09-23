<!--
id:MixerGetLevel
category:Mixer Opcodes
-->
# MixerGetLevel
Gets the level at which signals from the send are being added to the buss.

Plugin opcode in mixer

The actual sending of the signal to the buss is performed by the [MixerSend](../opcodes/mixersend.md) opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    kgain = MixerGetLevel(isend, ibuss)
    ```

=== "Classic"
    ``` csound-orc
    kgain MixerGetLevel isend, ibuss
    ```

### Initialization

_isend_ -- The number of the send, for example the number of the instrument sending the signal.

_ibuss_ -- The number of the buss, for example the number of the instrument receiving the signal.

### Performance

_kgain_ -- The level (any real number) at which the signal from the send will be mixed onto the buss.

This opcode reports the level set by [MixerSetLevel](../opcodes/mixersetlevel.md) for a send and buss pair.

Use of the mixer requires that instruments setting gains have smaller numbers than instruments sending signals, and that instruments sending signals have smaller numbers than instruments receiving those signals. However, an instrument may have any number of sends or receives. After the final signal is received, [MixerClear](../opcodes/mixerclear.md) must be invoked to reset the busses to 0 before the next kperiod.

## Examples

Here is an example of the MixerGetLevel opcode. It uses the file [Mixer.csd](../examples/Mixer.csd)

``` csound-csd title="Example of the MixerGetLevel opcode." linenums="1"
--8<-- "examples/Mixer.csd"
```

## See also

[Mixer Opcodes](../mixer.md)

## Credits

Michael Gogins (gogins at pipeline dot com).
