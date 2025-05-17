<!--
id:midifilerewind
category:Instrument Control:Sensing and Control
-->
# midifilerewind
Rewinds playback of a MIDI file. 

=If file playback is finished, the
file position is set back to the start in paused state, otherwise
playback continues from start. This opcode can be called from
anywhere, it is a non-op if used in an instrument triggered by a MIDI event.

Requires the -F flag to operate. If a filename is passed to -F, it is
open with id 0 and playback starts immediately.


## Syntax
=== "Modern"
    ``` csound-orc
     midifilerewind([id:i])
    ```

=== "Classic"
    ``` csound-orc
    midifilerewind [id]
    ```

### Initialization


_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.


## Examples

Here is an example of the miditempo opcode. It uses the files [midifilerewind.csd](../examples/midifilerewind.csd).

``` csound-csd title="Example of the midifilerewind opcode." linenums="1"
--8<-- "examples/midifilerewind.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
