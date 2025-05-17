<!--
id:midifiletempo
category:Instrument Control:Sensing and Control
-->
# midifiletempo
Sets the playback tempo of a MIDI file. 

This opcode can be called from
anywhere, it is a non-op if used in an instrument triggered by a MIDI event.

Requires the -F flag to operate. If a filename is passed to -F, it is
open with id 0 and playback starts immediately.


## Syntax
=== "Modern"
    ``` csound-orc
     midifiletempo(tempo:i[,id:i])
     midifiletempo(tempo:k[,id:i])
    ```

=== "Classic"
    ``` csound-orc
    midifiletempo itempo[,id]
    midifiletempo ktempo[,id]
    ```

### Initialization

_tempo_ -- if positive, the bpm to set. If negative, the absolute
value is used as a tempo scaling parameter (playback speed).

_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.


## Examples

Here is an example of the miditempo opcode. It uses the files [midifiletempo.csd](../examples/midifiletempo.csd).

``` csound-csd title="Example of the midifiletempo opcode." linenums="1"
--8<-- "examples/midifiletempo.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
