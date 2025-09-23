<!--
id:wterrain
category:Signal Generators:Wave Terrain Synthesis
-->
# wterrain
A simple wave-terrain synthesis opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = wterrain(kamp, kpch, k_xcenter, k_ycenter, k_xradius, k_yradius, \
                    itabx, itaby)
    ```

=== "Classic"
    ``` csound-orc
    aout wterrain kamp, kpch, k_xcenter, k_ycenter, k_xradius, k_yradius, \
                  itabx, itaby
    ```

### Initialization

_itabx, itaby_ -- The two tables that define the terrain.

### Performance

The output is the result of drawing an ellipse with axes _k_xradius_ and _k_yradius_ centered at (_k_xcenter_, _k_ycenter_), and traversing it at frequency _kpch_.

## Examples

Here is an example of the wterrain opcode. It uses the file [wterrain.csd](../examples/wterrain.csd).

``` csound-csd title="Example of the wterrain opcode." linenums="1"
--8<-- "examples/wterrain.csd"
```

## See Also

[Wave Terrain Synthesis](../siggen/waveterr.md)

## Credits

Author: Matthew Gillard<br>
New in version 4.19<br>
