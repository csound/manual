<!--
id:ampdbfs
category:Mathematical Operations:Amplitude Functions
-->
# ampdbfs
Returns the amplitude for a decibel value relative to full scale. The result depends on [0dbfs](0dbfs.md).

With `0dbfs = 1`, `ampdbfs(0)` returns 1 and `ampdbfs(-20)` returns 0.1.

## Syntax
``` csound-orc
ampdbfs(x)  (no rate restriction)
```

## Examples

=== "Modern"
    Here is an example of the ampdbfs opcode. It uses the file [ampdbfs-modern.csd](../examples/ampdbfs-modern.csd).
    ``` csound-csd title="Example of the ampdbfs opcode." linenums="1"
    --8<-- "examples/ampdbfs-modern.csd"
    ```

=== "Classic"
    Here is an example of the ampdbfs opcode. It uses the file [ampdbfs.csd](../examples/ampdbfs.csd).
    ``` csound-csd title="Example of the ampdbfs opcode." linenums="1"
    --8<-- "examples/ampdbfs.csd"
    ```

Its output should include lines like:

```
instr 1:  iamp = 0.891
instr 1:  iamp = 0.562
instr 1:  iamp = 0.501
instr 1:  iamp = 0.100
```

## See also

[Amplitude Converters](../math/amp.md)

New in Csound version 4.10
