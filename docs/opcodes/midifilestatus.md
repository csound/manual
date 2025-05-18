<!--
id:midifilestatus
category:MIDI files:MIDI input and Initialization
-->
# midifilestatus
Returns the playback status of MIDI file input.

Returns the current playback status at k-rate, of the input MIDI file, 1 if file is playing, 0 if the end-of-the file has been reached.

## Syntax
=== "Modern"
    ``` csound-orc
    status:k = midifilestatus([id:k])
    ```

=== "Classic"
    ``` csound-orc
    kstatus midifilestatus [id:k]
    ```

_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Victor Lazzarini<br>
March 2006<br>
New in Csound6<br>
