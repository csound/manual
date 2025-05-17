<!--
id:midifileplay
category:Instrument Control:Sensing and Control
-->
# midifileplay
Starts playback of a MIDI file. 

If the file is already playing, no
action results.  This opcode can be called from
anywhere, it is also a non-op if used 
in an instrument triggered by a MIDI event.

Requires the -F flag to operate. If a filename is passed to -F, it is
open with id 0 and playback starts immediately.


## Syntax
=== "Modern"
    ``` csound-orc
     midifileplay([id:i])
    ```

=== "Classic"
    ``` csound-orc
    midifileplay [id]
    ```

### Initialization


_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.


## Examples

Here is an example of the miditempo opcode. It uses the files [midifileplay.csd](../examples/midifileplay.csd).

``` csound-csd title="Example of the midifileplay opcode." linenums="1"
--8<-- "examples/midifileplay.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
