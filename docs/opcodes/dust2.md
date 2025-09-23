<!--
id:dust2
category:Signal Generators:Random (Noise) Generators
-->
# dust2
Generates random impulses from -1 to 1.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = dust2(kamp, kdensity)
    kres = dust2(kamp, kdensity)
    ```

=== "Classic"
    ``` csound-orc
    ares dust2 kamp, kdensity
    kres dust2 kamp, kdensity
    ```

### Performance

_kamp_ -- amplitude.

_kdensity_ -- average number of impulses per second.

## Examples

Here is an example of the dust2 opcode. It uses the file [dust2.csd](../examples/dust2.csd).

``` csound-orc title="Example of the dust2 opcode." linenums="1"
--8<-- "examples/dust2.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Based on James McCartney's Dust2 (SuperCollider)<br>
Author: Tito Latini<br>
January 2012<br>

New in Csound version 5.16

k-rate version fixed to documentation and SuperCollider, version 6.09
