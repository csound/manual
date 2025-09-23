<!--
id:ampdb
category:Mathematical Operations:Amplitude Functions
-->
# ampdb
Returns the amplitude equivalent of the decibel value x. Thus:

* 60 dB = 1000
* 66 dB = 1995.262
* 72 dB = 3891.07
* 78 dB = 7943.279
* 84 dB = 15848.926
* 90 dB = 31622.764

## Syntax
``` csound-orc
ampdb(x)  (no rate restriction)
```

## Examples

=== "Modern"
    Here is an example of the ampdb opcode. It uses the file [ampdb-modern.csd](../examples/ampdb-modern.csd).
    ``` csound-csd title="Example of the ampdb opcode." linenums="1"
    --8<-- "examples/ampdb-modern.csd"
    ```

=== "Classic"
    Here is an example of the ampdb opcode. It uses the file [ampdb.csd](../examples/ampdb.csd).
    ``` csound-csd title="Example of the ampdb opcode." linenums="1"
    --8<-- "examples/ampdb.csd"
    ```

Its output should include lines like:

```
instr 1:  iamp = 316.228
instr 1:  iamp = 31622.763
instr 1:  iamp = 2511.886
instr 1:  iamp = 9999.996
```

## See also

[Amplitude Converters](../math/amp.md)
