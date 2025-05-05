<!--
id:outvalue
category:Signal I/O:Signal Output
-->
# outvalue
Sends an i-rate or k-rate signal or string to a user-defined channel.

## Syntax
=== "Modern"
    ``` csound-orc
    outvalue("channel name", ivalue)
    outvalue("channel name", kvalue)
    outvalue("channel name", "string")
    ```

=== "Classic"
    ``` csound-orc
    outvalue "channel name", ivalue
    outvalue "channel name", kvalue
    outvalue "channel name", "string"
    ```

### Performance

_"channel name"_ -- An integer or string (in double-quotes) representing channel.

_ivalue, kvalue_ -- The value that is sent to the channel.

_string_ -- The string or string variable that is sent to the channel.

## Examples

Here is an example of the outvalue opcode. It uses the file [outvalue.csd](../examples/outvalue.csd).

``` csound-csd title="Example of the outvalue opcode." linenums="1"
--8<-- "examples/outvalue.csd"
```

## See also

[Signal Output](../sigio/output.md)

## Credits

Author: Matt Ingalls<br>

i-rate version new in Csound 6.04
