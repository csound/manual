<!--
id:midion2
category:Real-time MIDI:Note Output
-->
# midion2
Sends noteon and noteoff messages to the MIDI OUT port when triggered by a value different than zero.

## Syntax
=== "Modern"
    ``` csound-orc
    midion2(kchn, knum, kvel, ktrig)
    ```

=== "Classic"
    ``` csound-orc
    midion2 kchn, knum, kvel, ktrig
    ```

### Performance

_kchn_ -- MIDI channel (1-16)

_knum_ -- MIDI note number (0-127)

_kvel_ -- note velocity (0-127)

_ktrig_ -- trigger input signal (normally 0)

Similar to [midion](../opcodes/midion.md), this opcode sends noteon and noteoff messages to the MIDI out port, but only when _ktrig_ is non-zero. This opcode is can work together with the output of the [trigger](../opcodes/trigger.md) opcode.

## Examples

Here is an example of the midion2 opcode. It uses the file [midion2.csd](../examples/midion2.csd).

``` csound-csd title="Example of the midion2 opcode." linenums="1"
--8<-- "examples/midion2.csd"
```

## See also

[Note-on/Note-off Output](../midi/onoff.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1998<br>

New in Csound version 3.492

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
