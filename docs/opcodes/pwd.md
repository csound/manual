<!--
id:pwd
category:Miscellaneous
-->
# pwd
Asks the underlying operating system for the current directory (folder) name as a string.

Plugin opcode in cs_date.

_pwd_ runs at i-time only.

## Syntax
=== "Modern"
    ``` csound-orc
    Sres = pwd()
    ```

=== "Classic"
    ``` csound-orc
    Sres pwd
    ```

### Performance

_Sres_ -- the returned string.

## Examples

Here is an example of the pwd opcode. It uses the file [pwd.csd](../examples/pwd.csd).

``` csound-csd title="Example of the pwd opcode." linenums="1"
--8<-- "examples/pwd.csd"
```

## See also

[Miscellaneous opcodes](../miscopcodes.md)

## Credits

Author: John ffitch<br>
July 2012<br>

New in version 5.18
