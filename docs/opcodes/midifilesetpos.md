<!--
id:midifilesetpos
category:Instrument Control:Sensing and Control
-->
# midifilesetpos
Sets the playback position of a MIDI file. If file playback is finished, the
file position is set to the position in paused state, otherwise
playback continues from the requested position. This opcode can be called from
anywhere, it is also a non-op if used in an instrument is triggered by a MIDI event.

Requires the -F flag to operate. If a filename is passed to -F, it is
open with id 0 and playback starts immediately.


## Syntax
=== "Modern"
    ``` csound-orc
     midifilesetpos(pos:i[,id:i])
     midifilesetpos(pos:k[,id:i])
    ```

=== "Classic"
    ``` csound-orc
    midifilesetpos ipos[,id]
    midifilesetpos kpos[,id]
    ```

### Initialization

_pos_ -- playback position in seconds in the range [0, end-of-file).

_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.


## Examples

Here is an example of the miditempo opcode. It uses the files [midifilesetpos.csd](../examples/midifilesetpos.csd).

``` csound-csd title="Example of the midifilesetpos opcode." linenums="1"
--8<-- "examples/midifilesetpos.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
