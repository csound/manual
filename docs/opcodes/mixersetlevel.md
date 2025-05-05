<!--
id:MixerSetLevel
category:Mixer Opcodes
-->
# MixerSetLevel
Sets the level at which signals from the send are added to the buss.
Plugin opcode in mixer

The actual sending of the signal to the buss is performed by the [MixerSend](../opcodes/mixersend.md) opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    MixerSetLevel(isend, ibuss, kgain)
    ```

=== "Classic"
    ``` csound-orc
    MixerSetLevel isend, ibuss, kgain
    ```

### Initialization

_isend_ -- The number of the send, for example the number of the instrument sending the signal (but any integer can be used).

_ibuss_ -- The number of the buss, for example the number of the instrument receiving the signal (but any integer can be used).

Setting the gain for a buss also creates the buss.

### Performance

_kgain_ -- The level (any real number) at which the signal from the send will be mixed onto the buss. The default is 0.

Use of the mixer requires that instruments setting gains have smaller numbers than instruments sending signals, and that instruments sending signals have smaller numbers than instruments receiving those signals. However, an instrument may have any number of sends or receives. After the final signal is received, [MixerClear](../opcodes/mixerclear.md) must be invoked to reset the busses before the next kperiod.

## Examples

In the orchestra, define an instrument to control mixer levels:

``` csound-orc
instr 1
	MixerSetLevel		p4, p5, p6
endin
```

In the score, use that instrument to set mixer levels:

``` csound-sco
; SoundFonts
; to Chorus
i 1  0  0 100  200  0.9
; to Reverb
i 1  0  0  100  210  0.7
; to Output
i 1  0  0  100  220  0.3

; Kelley Harpsichord
; to Chorus
i 1  0  0  3  200  0.30
; to Reverb
i 1  0  0  3  210  0.9
; to Output
i 1  0  0  3  220  0.1

; Chorus to Reverb
i 1  0  0  200  210  0.5
; Chorus to Output
i 1  0  0  200  220  0.5
; Reverb to Output
i 1  0  0  210  220  0.2
```

Here is a complete example of the MixerSetLevel opcode. It uses the file [Mixer.csd](../examples/Mixer.csd)

``` csound-csd title="Complete example of the MixerSetLevel opcode." linenums="1"
--8<-- "examples/Mixer.csd"
```

## See also

[Mixer Opcodes](../mixer.md)

## Credits

Michael Gogins (gogins at pipeline dot com).
