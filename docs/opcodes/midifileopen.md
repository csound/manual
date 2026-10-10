<!--
id:midifileopen
category:Instrument Control:Sensing and Control
-->
# midifileopen
Open a MIDI file for playback. 

This opcode can be called from
anywhere, it is non-op if used in an instrument triggered by a MIDI
event.


## Syntax
=== "Modern"
    ``` csound-orc
     id:i = midifileopen(name:S[,port:i])
    ```

=== "Classic"
    ``` csound-orc
    iid midifileopen Sname[,iport]
    ```

### Initialization

_name_ -- MIDI file name.

_port_ (optional, default=0) -- MIDI channel port mapping: 16 * port + channel, where channel is 1–16

Returns a MIDI file id to use with other opcodes.

## Examples

Here is an example of the midifileopen opcode. It uses the files [midifileopen.csd](../examples/midifileopen.csd).

``` csound-csd title="Example of the midifileopen opcode." linenums="1"
--8<-- "examples/midifileopen.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
