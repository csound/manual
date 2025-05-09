<!--
id:bformenc1
category:Signal Modifiers:Panning and Spatialization
-->
# bformenc1
Codes a signal into the ambisonic B format.

## Syntax
=== "Modern"
    ``` csound-orc
    aw, ax, ay, az = bformenc1(asig, kalpha, kbeta)
    aw, ax, ay, az, ar, as, at, au, av = bformenc1(asig, kalpha, kbeta)
    aw, ax, ay, az, ar, as, at, au, av, ak, al, am, an, ao, ap, aq = bformenc1(\
          asig, kalpha, kbeta)
    aarray[] = bformenc1(asig, kalpha, kbeta)
    ```

=== "Classic"
    ``` csound-orc
    aw, ax, ay, az bformenc1 asig, kalpha, kbeta
    aw, ax, ay, az, ar, as, at, au, av bformenc1 asig, kalpha, kbeta
    aw, ax, ay, az, ar, as, at, au, av, ak, al, am, an, ao, ap, aq bformenc1 \
        asig, kalpha, kbeta
    aarray[] bformenc1 asig, kalpha, kbeta
    ```

### Performance

_aw, ax, ay_, ... -- output cells of the B format.

_aarray_ -- output array to hold cells of the B format.

_asig_ -- input signal.

_kalpha_ -- azimuth angle in degrees (anticlockwise).

_kbeta_ -- altitude angle in degrees.

## Examples

=== "Modern"
    Here is an example of the bformenc1 opcode. It uses the file [bformenc1-modern.csd](../examples/bformenc1-modern.csd).
    ``` csound-csd title="Example of the bformenc1 opcode." linenums="1"
    --8<-- "examples/bformenc1-modern.csd"
    ```

=== "Classic"
    Here is an example of the bformenc1 opcode. It uses the file [bformenc1.csd](../examples/bformenc1.csd).
    ``` csound-csd title="Example of the bformenc1 opcode." linenums="1"
    --8<-- "examples/bformenc1.csd"
    ```

## See also

[Panning and Spatialization: Ambisonics](../sigmod/panspatl.md)

## Credits

Author: Richard Furse, Bruce Wiggins and Fons
Adriaensen, following code by Samuel Groner<br>
2008<br>

New in version 5.09

Array output new in version 6.01
