<!--
id:MixerSend
category:Mixer Opcodes
-->
# MixerSend
Mixes an arate signal into a channel of a buss.

## Syntax
=== "Modern"
    ``` csound-orc
    MixerSend(asignal, isend, ibuss, ichannel)
    ```

=== "Classic"
    ``` csound-orc
    MixerSend asignal, isend, ibuss, ichannel
    ```

### Initialization

_isend_ -- The number of the send, for example the number of the instrument sending the signal. The gain of the send is controlled by the [MixerSetLevel](../opcodes/mixersetlevel.md) opcode. The reason that the sends are numbered is to enable different levels for different sends to be set independently of the actual level of the signals.

_ibuss_ -- The number of the buss, for example the number of the instrument receiving the signal.

_ichannel_ -- The number of the channel. Each buss has <literal>nchnls</literal> channels.

### Performance

_asignal_ -- The signal that will be mixed into the indicated channel of the buss.

Use of the mixer requires that instruments setting gains have smaller numbers than instruments sending signals, and that instruments sending signals have smaller numbers than instruments receiving those signals. However, an instrument may have any number of sends or receives. After the final signal is received, [MixerClear](../opcodes/mixerclear.md) must be invoked to reset the busses to 0 before the next kperiod.

## Examples

``` csound-orc
instr 100 ; Fluidsynth output
; INITIALIZATION
; Normalize so iamplitude for p5 of 80 == ampdb(80).
iamplitude 		= 			ampdb(p5) * 2.0
; AUDIO
aleft, aright 		fluidAllOut		giFluidsynth
asig1 			= 			aleft * iamplitude
asig2 			= 			aright * iamplitude
			; To the chorus.
			MixerSend		asig1, 100, 200, 0
			MixerSend		asig2, 100, 200, 1
			; To the reverb.
			MixerSend		asig1, 100, 210, 0
			MixerSend		asig2, 100, 210, 1
			; To the output.
			MixerSend		asig1, 100, 220, 0
			MixerSend		asig2, 100, 220, 1
endin
```

Here is a complete example of the MixerSend opcode. It uses the file [Mixer.csd](../examples/Mixer.csd)

``` csound-csd title="Complete example of the MixerSend opcode." linenums="1"
--8<-- "examples/Mixer.csd"
```

## See also

[Mixer Opcodes](../mixer.md)

## Credits

Michael Gogins (gogins at pipeline dot com).
