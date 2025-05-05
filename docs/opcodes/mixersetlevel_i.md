<!--
id:MixerSetLevel_i
category:Mixer Opcodes
-->
# MixerSetLevel_i
Sets the level at which signals from the send are added to the buss.

Plugin opcode in mixer

This opcode, because all parameters are irate, may be used in the orchestra header. The actual sending of the signal to the buss is performed by the [MixerSend](../opcodes/mixersend.md) opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    MixerSetLevel_i(isend, ibuss, igain)
    ```

=== "Classic"
    ``` csound-orc
    MixerSetLevel_i isend, ibuss, igain
    ```

### Initialization

_isend_ -- The number of the send, for example the number of the instrument sending the signal (but any integer can be used).

_ibuss_ -- The number of the buss, for example the number of the instrument receiving the signal (but any integer can be used).

_igain_ -- The level (any real number) at which the signal from the send will be mixed onto the buss. The default is 0.

Setting the gain for a buss also creates the buss.

### Performance

Use of the mixer requires that instruments setting gains have smaller numbers than instruments sending signals, and that instruments sending signals have smaller numbers than instruments receiving those signals. However, an instrument may have any number of sends or receives. After the final signal is received, [MixerClear](../opcodes/mixerclear.md) must be invoked to reset the busses before the next kperiod.

## Examples

In the orchestra header, set the gain for the send from buss 3 to buss 4:

``` csound-orc
MixerSetLevel_i		3, 4, 0.76
```

## See also

[Mixer Opcodes](../mixer.md)

## Credits

Michael Gogins (gogins at pipeline dot com).
