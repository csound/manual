<!--
id:gainslider
category:Signal Generators:Linear and Exponential Generators
-->
# gainslider
An implementation of a logarithmic gain curve which is similar to the gainslider~ object from Cycling 74 Max / MSP.

This opcode is intended for use to multiply by an audio signal to give a console mixer like feel. There is no bounds in the source code so you can for example give higher than 127 values for extra amplitude but possibly clipped audio.

## Syntax
=== "Modern"
    ``` csound-orc
    kout = gainslider(kindex)
    ```

=== "Classic"
    ``` csound-orc
    kout gainslider kindex
    ```

### Performance

_kindex_ -- Index value. Nominal range from 0-127. For example a range of 0-152 will give you a range from -&#8734; to +18.0 dB.

_kout_ -- Scaled output.

## Examples

Here is an example of the gainslider opcode. It uses the file [gainslider.csd](../examples/gainslider.csd).

``` csound-orc title="Example of the gainslider opcode." linenums="1"
--8<-- "examples/gainslider.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: David Akbari<br>
October<br>
2006<br>
