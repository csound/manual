<!--
id:outleta
category:Signal Flow Graph Opcodes
-->
# outleta
Sends an arate signal out from an instrument to a named port.

Plugin opcode in signalflowgraph

## Syntax
=== "Modern"
    ``` csound-orc
    outleta(Sname, asignal)
    ```

=== "Classic"
    ``` csound-orc
    outleta Sname, asignal
    ```

### Initialization

_Sname_ -- String name of the outlet port. The name of the outlet is implicitly qualified by the instrument name or number, so it is valid to use the same outlet name in more than one instrument (but not to use the same outlet name twice in one instrument).

### Performance

_asignal_ -- audio output signal

During performance, the audio output signal is sent to each instance of an instrument containing an inlet port to which this outlet has been connected using the connect opcode. The signals of all the outlets connected to an inlet are summed in the inlet.

## Examples

Here is an example of the outleta opcode. It uses the file [outleta.csd](../examples/outleta.csd).

``` csound-csd title="Example of the outleta opcode." linenums="1"
--8<-- "examples/outleta.csd"
```

## See also

[Signal Flow Graph Opcodes](../signalflowgraph.md)

More information on this opcode: [http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html](http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html), written by Michael Gogins

## Credits

By: Michael Gogins 2009
