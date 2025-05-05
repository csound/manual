<!--
id:pgmassign
category:Real-time MIDI:Input
-->
# pgmassign
Assigns an instrument number to a specified MIDI program.

By default, the instrument is the same as the program number. If the selected instrument is zero or negative or does not exist, the program change is ignored. This opcode is normally used in the orchestra header. Although, like [massign](../opcodes/massign.md), it also works in instruments.

## Syntax
=== "Modern"
    ``` csound-orc
    pgmassign(ipgm, inst[, ichn])
    pgmassign(ipgm, "insname"[, ichn])
    ```

=== "Classic"
    ``` csound-orc
    pgmassign ipgm, inst[, ichn]
    pgmassign ipgm, "insname"[, ichn]
    ```

### Initialization

_ipgm_ -- MIDI program number (1 to 128). A value of zero selects all programs.

_inst_ -- instrument number. If set to zero, or negative, MIDI program changes to _ipgm_ are ignored. Currently, assignment to an instrument that does not exist has the same effect. This may be changed in a later release to print an error message.

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

_&#8220;ichn&#8221;_ (optional, defaults to zero) -- channel number. If zero, program changes are assigned on all channels.

You can disable the turning on of any instruments by using the following in the header:

``` csound-orc
massign 0, 0
pgmassign 0, 0
```

## Examples

Here is an example of the pgmassign opcode. It uses the file [pgmassign.csd](../examples/pgmassign.csd).

``` csound-csd title="Example of the pgmassign opcode." linenums="1"
--8<-- "examples/pgmassign.csd"
```

Here is an example of the pgmassign opcode that will ignore program change events. It uses the file [pgmassign_ignore.csd](../examples/pgmassign_ignore.csd).

``` csound-csd title="Example of the pgmassign opcode that will ignore program change events." linenums="1"
--8<-- "examples/pgmassign_ignore.csd"
```

Here is an advanced example of the pgmassign opcode. It uses the file [pgmassign_advanced.csd](../examples/pgmassign_advanced.csd).

Do not forget that you must include the [-F flag](../invoke/cs-options-alphabetically.md#-f-file-midifilefile) when using an external MIDI file like &#8220;pgmassign_advanced.mid&#8221;.

``` csound-csd title="An advanced example of the pgmassign opcode." linenums="1"
--8<-- "examples/pgmassign_advanced.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

[Orchestra Header Statements](../orch/header.md)

## Credits

Author: Istvan Varga<br>
May 2002<br>

New in version 4.20
