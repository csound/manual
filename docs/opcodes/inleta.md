<!--
id:inleta
category:Signal Flow Graph Opcodes
-->
# inleta
Receives an arate signal into an instrument through a named port.

Plugin opcode in signalflowgraph

## Syntax
=== "Modern"
    ``` csound-orc
    asignal = inleta(Sname)
    ```

=== "Classic"
    ``` csound-orc
    asignal inleta Sname
    ```

### Initialization

_Sname_ -- String name of the inlet port. The name of the inlet is implicitly qualified by the instrument name or number, so it is valid to use the same inlet name in more than one instrument (but not to use the same inlet name twice in one instrument).

### Performance

_asignal_ -- audio input signal

During performance, the arate inlet signal is received from each instance of an instrument containing an outlet port to which this inlet has been connected using the connect opcode. The signals of all the outlets connected to an inlet are summed in the inlet.

## Examples

Here is an example of the inleta opcode. It uses the file [inleta.csd](../examples/inleta.csd).

``` csound-csd title="Example of the inleta opcode." linenums="1"
--8<-- "examples/inleta.csd"
```

## See also

[Signal Flow Graph Opcodes](../signalflowgraph.md)

More information on this opcode: [http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html](http://www.csoundjournal.com/issue13/signalFlowGraphOpcodes.html), written by Michael Gogins

## Credits

By: Michael Gogins 2009
