<!--
id:dust
category:Signal Generators:Random (Noise) Generators
-->
# dust
Generates random impulses from 0 to 1.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = dust(kamp, kdensity)
    kres = dust(kamp, kdensity)
    ```

=== "Classic"
    ``` csound-orc
    ares dust kamp, kdensity
    kres dust kamp, kdensity
    ```

### Performance

_kamp_ -- amplitude.

_kdensity_ -- average number of impulses per second.

## Examples

Here is an example of the dust opcode. It uses the file [dust.csd](../examples/dust.csd).

``` csound-orc title="Example of the dust opcode." linenums="1"
--8<-- "examples/dust.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Based on James McCartney's Dust ugen (SuperCollider)<br>
Author: Tito Latini<br>
January 2012<br>

New in Csound version 5.16

k-rate version fixed to documentation and SuperCollider,
version 6.09
