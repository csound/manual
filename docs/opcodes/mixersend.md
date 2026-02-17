<!--
id:MixerSend
category:Mixer Opcodes
-->
# mixersend
Mixes an arate signal into a channel of a buss.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *MixerSend*.

## Syntax
=== "Modern"
    ``` csound-orc
    mixersend(asignal, isend, ibuss, ichannel)
    ```

=== "Classic"
    ``` csound-orc
    MixerSend asignal, isend, ibuss, ichannel
    ```

### Initialization

_isend_ -- The number of the send, for example the number of the instrument sending the signal. The gain of the send is controlled by the [mixersetlevel](../opcodes/mixersetlevel.md) opcode. The reason that the sends are numbered is to enable different levels for different sends to be set independently of the actual level of the signals.

_ibuss_ -- The number of the buss, for example the number of the instrument receiving the signal.

_ichannel_ -- The number of the channel. Each buss has <literal>nchnls</literal> channels.

### Performance

_asignal_ -- The signal that will be mixed into the indicated channel of the buss.

Use of the mixer requires that instruments setting gains have smaller numbers than instruments sending signals, and that instruments sending signals have smaller numbers than instruments receiving those signals. However, an instrument may have any number of sends or receives. After the final signal is received, [mixerclear](../opcodes/mixerclear.md) must be invoked to reset the busses to 0 before the next kperiod.

## Examples

``` csound-orc
instr 100 ; Fluidsynth output
  ; INITIALIZATION
  ; Normalize so iamplitude for p5 of 80 == ampdb(80).
  amplitude:i = ampdb(p5) * 2.0
  ; AUDIO
  left:a, right:a = fluidAllOut(giFluidsynth)
  sig1:a = left * amplitude
  sig2:a = right * amplitude
  ; To the chorus.
  mixersend(sig1, 100, 200, 0)
  mixersend(sig2, 100, 200, 1)
  ; To the reverb.
  mixersend(sig1, 100, 210, 0)
  mixersend(sig2, 100, 210, 1)
  ; To the output.
  mixersend(sig1, 100, 220, 0)
  mixersend(sig2, 100, 220, 1)
endin
```

=== "Modern"
    Here is a complete example of the mixersend opcode. It uses the file [Mixer-modern.csd](../examples/Mixer-modern.csd)
    ``` csound-csd title="Complete example of the mixersend opcode." linenums="1"
    --8<-- "examples/Mixer-modern.csd"
    ```

=== "Classic"
    Here is a complete example of the MixerSend opcode. It uses the file [Mixer.csd](../examples/Mixer.csd)
    ``` csound-csd title="Complete example of the MixerSend opcode." linenums="1"
    --8<-- "examples/Mixer.csd"
    ```

## See also

[Mixer Opcodes](../sigrouting/mixer.md)

## Credits

Michael Gogins (gogins at pipeline dot com).
