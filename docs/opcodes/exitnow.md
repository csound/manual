<!--
id:exitnow
category:Instrument Control:Realtime Performance Control
-->
# exitnow
Exit Csound as fast as possible, with no cleaning up.

In Csound4 calls an exit function to leave Csound as fast as possible. On Csound5 and later it exits back to the driving code.

## Syntax
=== "Modern"
    ``` csound-orc
    exitnow([ivalue])
    ```

=== "Classic"
    ``` csound-orc
    exitnow [ivalue]
    ```

Initialisation

Stops Csound on the _initialisation_ cycle, returning the result ivalue, which defaults to zero. Note that it is usual for this opcode to be alone in an instrument.

## Examples

Here is an example of the exitnow opcode. It uses the file [exitnow.csd](../examples/exitnow.csd).

``` csound-csd title="Example of the exitnow opcode." linenums="1"
--8<-- "examples/exitnow.csd"
```

## See also

[Real-time Performance Control](../control/realtime.md)
