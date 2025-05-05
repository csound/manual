<!--
id:zkr
category:Zak Patch System
-->
# zkr
Reads from a location in zk space at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = zkr(kndx)
    ```

=== "Classic"
    ``` csound-orc
    kres zkr kndx
    ```

### Initialization

_kndx_ -- points to the zk location to be read.

### Performance

_zkr_ reads the array of floats at _kndx_ in zk space.

## Examples

Here is an example of the zkr opcode. It uses the file [zkr.csd](../examples/zkr.csd).

``` csound-csd title="Example of the zkr opcode." linenums="1"
--8<-- "examples/zkr.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
