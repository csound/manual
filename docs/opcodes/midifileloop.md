<!--
id:midifileloop
category:Instrument Control:Sensing and Control
-->
# midifileloop
Sets the looping mode of a MIDI file playback. 

This opcode can be called from
anywhere, it is also a non-op if used 
in an instrument triggered by a MIDI event.

Requires the -F flag to operate. If a filename is passed to -F, it is
open with id 0 and playback starts immediately.


## Syntax
=== "Modern"
    ``` csound-orc
     midifileplay(loop:i, [id:i])
     midifileplay(loop:k, [id:i])
    ```

=== "Classic"
    ``` csound-orc
    midifileplay iloop, [id]
    midifileplay kloop, [id]    
    ```

### Initialization

_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.

_loop_ -- playback loop mode: 1 = on, 0 = off 

### Performance

_loop_ -- playback loop mode: 1 = on, 0 = off 

## Examples

Here is an example of the miditempo opcode. It uses the files [midifileloop.csd](../examples/midifileloop.csd).

``` csound-csd title="Example of the midifileloop opcode." linenums="1"
--8<-- "examples/midifileloop.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2026<br>
New in Csound 7<br>
