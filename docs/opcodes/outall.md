<!--
id:outall
category:Signal I/O:Signal Output
-->
# outall
Writes a single audio value to all available audio channels.

## Syntax
=== "Modern"
    ``` csound-orc
    outall(asig)
    ```

=== "Classic"
    ``` csound-orc
    outall asig
    ```

### Performance

Sends audio samples to all accumulating output buffers (created at the beginning of performance) which serve to collect the output of all active instruments before the sound is written to disk. There can be any number of channels specified in _nchnls_ which all receive the same data.

## Examples

Here is an example of the outall opcode. It uses the file [outall.csd](../examples/outall.csd).

``` csound-csd title="Example of the outall opcode." linenums="1"
--8<-- "examples/outall.csd"
```

## See also

[Signal Output](../sigio/output.md)

## Credits

Author: John ffitch<br>
November 2020<br>

New in version 6.16
