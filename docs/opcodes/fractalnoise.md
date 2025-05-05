<!--
id:fractalnoise
category:Signal Generators:Random (Noise) Generators
-->
# fractalnoise
A fractal noise generator.

Plugin opcode in fractalnoise.

Implemented as a white noise filtered by a cascade of 15 first-order filters.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = fractalnoise(kamp, kbeta)
    ```

=== "Classic"
    ``` csound-orc
    ares fractalnoise kamp, kbeta
    ```

### Performance

_kamp_ -- amplitude.

_kbeta_ -- spectral parameter related to the fractal dimension

* 0 - white
* 1 - pink
* 2 - brown

## Examples

Here is an example of the fractalnoise opcode. It uses the file [fractalnoise.csd](../examples/fractalnoise.csd).

``` csound-orc title="Example of the fractalnoise opcode." linenums="1"
--8<-- "examples/fractalnoise.csd"
```

References

1.   R. Saletti. A comparison between two methods to generate 1/(f^gamma) noise. In Proc. IEEE, volume 74, pp. 1595-1596, November 1986.
2.   G. Corsini and R. Saletti. A 1/(f^gamma) power spectrum noise sequence generator. IEEE Trans. on Instrumentation and Measurement, 37(4):615-619, December 1988.
3.   The Sounding Object, edited by Davide Rocchesso and Federico Fontana, Edizioni di Mondo Estremo. Chapter 8 by Federico Avanzini, pp. 154-157.

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Tito Latini<br>
January 2012<br>

New in Csound version 5.16
