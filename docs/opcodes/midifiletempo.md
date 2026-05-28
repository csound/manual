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

NB: MIDI files can have variable tempo settings recorded in it,
because of this we have to accommodate changes in tempo
using this opcode with what is already given in a file. Using
negative values for the tempo parameter allow us to simply use
the opcode as a tempo scaler (see below).

Setting a BPM, however, requires a more careful combination
of the two tempo sources. Using this opcode causes any 
changes in tempo recorded in the MIDI file to become relative 
rather than absolute. 

For example, if we run a file whose current recorded tempo is x BPM, and
change this to y BPM using this opcode, any subsequent changes given in a 
MIDI file will adjust the recorded tempo by a relative factor of y/x. For
example, with a start tempo of 120, a change to 100 yields a 10/12 
factor to the file BPMs. In this case a change to 240 causes the absolute
tempo to be set at 200. A change found in the file 
to 100 sets the tempo at 83.3, etc. 

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

_tempo_ -- if positive, the bpm to set (see note above). If negative, the absolute
value is used as a tempo scaling parameter (playback speed).

_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.

#### Performance

_tempo_ -- if positive, the bpm to set (see note above). If negative, the absolute
value is used as a tempo scaling parameter (playback speed).

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
