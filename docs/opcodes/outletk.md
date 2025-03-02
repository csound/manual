<!--
id:outletk
category:Signal Flow Graph Opcodes
-->
# outletk
Sends a krate signal out from an instrument to a named port.

Plugin opcode in signalflowgraph

## Syntax
``` csound-orc
outletk Sname, ksignal
```

### Initialization

_Sname_ -- String name of the outlet port. The name of the outlet is implicitly qualified by the instrument name or number, so it is valid to use the same outlet name in more than one instrument (but not to use the same outlet name twice in one instrument).

### Performance

_ksignal_ -- krate output signal

During performance, the krate output signal is sent to each instance of an instrument containing an inlet port to which this outlet has been connected using the [Examples](../../opcodes/connect)e>

Here is an example of the outletk opcode. It uses the file [outletk.csd](../../examples/outletk.csd).

``` csound-csd title="Example of the outletk opcode." linenums="1"
--8<-- "examples/outletk.csd"
```

## See also

[Signal Flow Graph Opcodes](../../signalflowgraph)

More information on this opcode: [http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html](http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html), written by Michael Gogins

## Credits

By: Michael Gogins 2009
