<!--
id:getseed
category:Signal Generators:Random (Noise) Generators
-->
# getseed
Reads the global seed value.

Returns the global seed value used for all _x-class noise generators_.

## Syntax
=== "Modern"
    ``` csound-orc
    ians = getseed()
    kans = getseed()
    ```

=== "Classic"
    ``` csound-orc
    ians getseed
    kans getseed
    ```

### Performance

Reads the global seed value of the internal pseudo-random number generator.

## Examples

Here is an example of the getseed opcode. It uses the file [getseed.csd](../examples/getseed.csd).

``` csound-orc title="Example of the getseed opcode." linenums="1"
--8<-- "examples/getseed.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: John ffitch<br>
University of Bath/NUIM/Codemist Ltd.<br>
Bath, UK<br>
August 2015<br>

New in Csound6.06
