<!--
id:midifilepause
category:Instrument Control:Sensing and Control
-->
# midifilepause
Pauses MIDI file playback. 

If already paused, not action is
executed. This opcode is a non-op in MIDI-triggered instrument events.

Requires the -F flag to operate. If a filename is passed to -F, it is
open with id 0 and playback starts immediately.


## Syntax
=== "Modern"
    ``` csound-orc
     midifilepause([id:i])
    ```

=== "Classic"
    ``` csound-orc
    midifilepause [id]
    ```

### Initialization


_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.


## Examples

Here is an example of the miditempo opcode. It uses the files [midifilepause.csd](../examples/midifilepause.csd).

``` csound-csd title="Example of the midifilepause opcode." linenums="1"
--8<-- "examples/midifilepause.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
