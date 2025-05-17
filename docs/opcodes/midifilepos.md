<!--
id:midifilepos
category:Instrument Control:Sensing and Control
-->
# midifilepos
Gets/Sets the playback position of a MIDI file. 

This opcode can be called from
anywhere, the setting function is also a non-op if used in an instrument triggered by a MIDI event.

Requires the -F flag to operate. If a filename is passed to -F, it is
open with id 0 and playback starts immediately.


## Syntax
=== "Modern"
    ``` csound-orc
     pos:i = midifilepos([id:i])
     pos:k = midifilepos([id:i])
     midifilepos(pos:i[,id:i])
     midifilepos(pos:k[,id:i])
    ```

=== "Classic"
    ``` csound-orc
    ipos midifilepos [id]
    kpos midifilepos [id]
    midifilepos ipos[,id]
    midifilepos kpos[,id]
    ```

### Initialization

_pos_ -- playback position in seconds

_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.


## Examples

Here is an example of the miditempo opcode. It uses the files [midifilepos.csd](../examples/midifilepos.csd).

``` csound-csd title="Example of the midifilepos opcode." linenums="1"
--8<-- "examples/midifilepos.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
