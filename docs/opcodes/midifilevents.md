<!--
id:midifilevents
category:Instrument Control:Sensing and Control
-->
# midifilevents
Returns the number of events in a MIDI file.

Requires the -F flag to operate. If a filename is passed to -F, it is
open with id 0.


## Syntax
=== "Modern"
    ``` csound-orc
     num:i =  midifilevents([id:i])
    ```

=== "Classic"
    ``` csound-orc
    inum midifilevents [id]
    ```

### Initialization


_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.


## Examples

Here is an example of the miditempo opcode. It uses the files [midifilevents.csd](../examples/midifilevents.csd).

``` csound-csd title="Example of the midifilevents opcode." linenums="1"
--8<-- "examples/midifilevents.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
