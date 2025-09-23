<!--
id:pset
category:Instrument Control:Initialization and Reinitialization
-->
# pset
Defines and initializes numeric arrays at orchestra load time.

## Syntax
=== "Modern"
    ``` csound-orc
    pset(icon1 [, icon2] [...])
    ```

=== "Classic"
    ``` csound-orc
    pset icon1 [, icon2] [...]
    ```

### Initialization

_icon1, icon2, ..._ -- preset values for a MIDI instrument

_pset_ (optional) defines and initializes numeric arrays at orchestra load time. It may be used as an orchestra header statement (i.e. instrument 0) or within an instrument. When defined within an instrument, it is not part of its i-time or performance operation, and only one statement is allowed per instrument. These values are available as i-time defaults. When an instrument is triggered from MIDI it only gets p1 and p2 from the event, and p3, p4, etc. will receive the actual preset values.

## Examples

Here is an example of the pset opcode. It uses the file [pset.csd](../examples/pset.csd)

``` csound-csd title="Example of the pset opcode." linenums="1"
--8<-- "examples/pset.csd"
```

Here is another example of the pset opcode, using pset with a midi file. It uses the files [pset-midi.csd](../examples/pset-midi.csd) and [midiChords.mid](../examples/midiChords.mid)

``` csound-csd title="Second example of the pset opcode." linenums="1"
--8<-- "examples/pset-midi.csd"
```

## See also

[Initialization and Reinitialization](../control/reinitn.md)

[Orchestra Header Statements](../orch/header.md)
