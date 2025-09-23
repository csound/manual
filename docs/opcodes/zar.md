<!--
id:zar
category:Zak Patch System
-->
# zar
Reads from a location in za space at a-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = zar(kndx)
    ```

=== "Classic"
    ``` csound-orc
    ares zar kndx
    ```

### Performance

_kndx_ -- points to the za location to be read.

_zar_ reads the array of floats at _kndx_ in za space, which are ksmps number of a-rate floats to be processed in a k cycle.

## Examples

Here is an example of the zar opcode. It uses the file [zar.csd](../examples/zar.csd).

``` csound-csd title="Example of the zar opcode." linenums="1"
--8<-- "examples/zar.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
