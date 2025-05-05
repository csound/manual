<!--
id:MixerReceive
category:Mixer Opcodes
-->
# MixerReceive
Receives an arate signal that has been mixed onto a channel of a buss.

## Syntax
=== "Modern"
    ``` csound-orc
    asignal = MixerReceive(ibuss, ichannel)
    ```

=== "Classic"
    ``` csound-orc
    asignal MixerReceive ibuss, ichannel
    ```

### Initialization

_ibuss_ -- The number of the buss, for example the number of the instrument receiving the signal.

_ichannel_ -- The number of the channel. Each buss has _nchnls_ channels.

### Performance

_asignal_ -- The signal that has been mixed onto the indicated channel of the buss.

Use of the mixer requires that instruments setting gains have smaller numbers than instruments sending signals, and that instruments sending signals have smaller numbers than instruments receiving those signals. However, an instrument may have any number of sends or receives. After the final signal is received, [MixerClear](../opcodes/mixerclear.md) must be invoked to reset the busses to 0 before the next kperiod.

## Examples

``` csound-orc
instr 220 ; Master output
    ; It applies a bass enhancement, compression and fadeout
    ; to the whole piece, outputs signals, and clears the mixer.
  a1  MixerReceive 220, 0
  a2  MixerReceive 220, 1
  ; Bass enhancement
  al1 butterlp a1, 100
  al2 butterlp a2, 100
  a1 = al1*1.5 + a1
  a2 = al2*1.5 + a2 

  ; Global amplitude shape
  kenv   linseg 0., p5 / 2.0, p4, p3 - p5, p4, p5 / 2.0, 0.
  a1=a1*kenv
  a2=a2*kenv 
  
  ; Compression
  a1 dam a1, 5000, 0.5, 1, 0.2, 0.1  
  a2 dam a2, 5000, 0.5, 1, 0.2, 0.1  
  
  ; Remove DC bias
  a1blocked dcblock		a1
  a2blocked	dcblock		a2
  
  ; Output signals
  outs a1blocked, a2blocked
  MixerClear
endin
```

Here is a complete example of the MixerReceive opcode. It uses the file [Mixer.csd](../examples/Mixer.csd)

``` csound-csd title="Complete example of the MixerReceive opcode." linenums="1"
--8<-- "examples/Mixer.csd"
```

## See also

[Mixer Opcodes](../mixer.md)

## Credits

Michael Gogins (gogins at pipeline dot com).
