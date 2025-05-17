<!--
id:midifilelen
category:Instrument Control:Sensing and Control
-->
# midifilelen
Returns the length of a MIDI file.

Requires the -F flag to operate. If a filename is passed to -F, it is
open with id 0.

## Syntax
=== "Modern"
    ``` csound-orc
     len:i =  midifilelen([id:i])
    ```

=== "Classic"
    ``` csound-orc
    ilen midifilelen [id]
    ```

### Initialization


_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.

The length is returned in seconds.

## Examples

Here is an example of the miditempo opcode. It uses the files [midifilelen.csd](../examples/midifilelen.csd).

``` csound-csd title="Example of the midifilelen opcode." linenums="1"
--8<-- "examples/midifilelen.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
