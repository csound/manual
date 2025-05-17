<!--
id:midifileopem
category:Instrument Control:Sensing and Control
-->
# midifileopen
Open a midifile for playback.


## Syntax
=== "Modern"
    ``` csound-orc
     midfileopen(name:S[,port:i])
    ```

=== "Classic"
    ``` csound-orc
    midifileopen Sname[,iport]
    ```

## Examples

Here is an example of the miditempo opcode. It uses the files [midifileopen.csd](../examples/midifileopen.csd).

``` csound-csd title="Example of the midifileopen opcode." linenums="1"
--8<-- "examples/midifileopen.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
