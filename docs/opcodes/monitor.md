<!--
id:monitor
category:Signal I/O:Signal Output
-->
# monitor
Returns the audio spout frame (if active), otherwise it returns zero.

## Syntax
=== "Modern"
    ``` csound-orc
    aout1 [,aout2 ... aoutX] = monitor()
    aarra = monitor()
    ```

=== "Classic"
    ``` csound-orc
    aout1 [,aout2 ... aoutX] monitor
    aarra monitor
    ```

### Performance

In the array form it reads all chanels to a one dimensional array.

This opcode can be used for monitoring the output signal from csound. It should not be used for processing the signal further.

See the entry for the [fout](../opcodes/fout.md) opcode for an example of usage of _monitor_.

## Examples

Here is an example of the monitor opcode. It uses the file [monitor.csd](../examples/monitor.csd).

``` csound-csd title="Example of the monitor opcode." linenums="1"
--8<-- "examples/monitor.csd"
```

## See also

[Signal Output](../sigio/output.md)

## Credits

Istvan Varga 2006

John ffitch 2016 for array form, new in 6.08
