<!--
id:inletk
category:Signal Flow Graph Opcodes
-->
# inletk
Receives a krate signal into an instrument from a named port.

Plugin opcode in signalflowgraph

## Syntax
=== "Modern"
    ``` csound-orc
    ksignal = inletk(Sname)
    ```

=== "Classic"
    ``` csound-orc
    ksignal inletk Sname
    ```

### Initialization

_Sname_ -- String name of the inlet port. The name of the inlet is implicitly qualified by the instrument name or number, so it is valid to use the same inlet name in more than one instrument (but not to use the same inlet name twice in one instrument).

### Performance

_ksignal_ -- krate input signal

During performance, the krate inlet signal is received from each instance of an instrument containing an outlet port to which this inlet has been connected using the connect opcode. The signals of all the outlets connected to an inlet are summed in the inlet.

## Examples

Here is an example of the inletk opcode. It uses the file [inletk.csd](../examples/inletk.csd).

``` csound-csd title="Example of the inletk opcode." linenums="1"
--8<-- "examples/inletk.csd"
```

## See also

[Signal Flow Graph Opcodes](../signalflowgraph.md)

More information on this opcode: [http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html](http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html), written by Michael Gogins

## Credits

By: Michael Gogins 2009
