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

The examples print the result of `ampdb` and use `ampdbfs` for the oscillator amplitude. With `0dbfs = 1`, both functions return the same amplitude. The score supplies levels in dBFS.

The printed amplitudes are approximately:

```
0.01
1
0.0794
0.316
```

## See also

[Amplitude Converters](../math/amp.md)
