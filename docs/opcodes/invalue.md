<!--
id:invalue
category:Signal I/O:Signal Input
-->
# invalue
Reads a k-rate or i-rate signal or string from a user-defined channel.

## Syntax
=== "Modern"
    ``` csound-orc
    ivalue = invalue("channel name")
    kvalue = invalue("channel name")
    Sname = invalue("channel name")
    ```

=== "Classic"
    ``` csound-orc
    ivalue invalue "channel name"
    kvalue invalue "channel name"
    Sname invalue "channel name"
    ```

### Performance

_ivalue, kvalue_ -- The value that is read from the channel.

_ Sname_ -- The string variable that is read from the channel.

_"channel name"_ -- An integer, string (in double-quotes), or string variable identifying the channel.

## Examples

Here is an example of the invalue opcode. It uses the file [invalue.csd](../examples/invalue.csd).

``` csound-csd title="Example of the invalue opcode." linenums="1"
--8<-- "examples/invalue.csd"
```

## See also

[Signal Input](../sigio/input.md)

## Credits

Author: Matt Ingalls<br>

i-rate version new in Csound 6.04
