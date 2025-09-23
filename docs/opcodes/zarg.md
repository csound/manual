<!--
id:zarg
category:Zak Patch System
-->
# zarg
Reads from a location in za space at a-rate, adds some gain.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = zarg(kndx, kgain)
    ```

=== "Classic"
    ``` csound-orc
    ares zarg kndx, kgain
    ```

### Initialization

_kndx_ -- points to the za location to be read.

_kgain_ -- multiplier for the a-rate signal.

### Performance

_zarg_ reads the array of floats at _kndx_ in za space, which are ksmps number of a-rate floats to be processed in a k cycle. _zarg_ also multiplies the a-rate signal by a k-rate value _kgain_.

## Examples

Here is an example of the zarg opcode. It uses the file [zarg.csd](../examples/zarg.csd).

``` csound-csd title="Example of the zarg opcode." linenums="1"
--8<-- "examples/zarg.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
