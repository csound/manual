<!--
id:bformenc
category:Signal Modifiers:Panning and Spatialization
status:deprecated
-->
# bformenc
Codes a signal into the ambisonic B format.

Note that this opcode is deprecated as it is inaccurate, and is replaced by the much better opcode [bformenc1](../opcodes/bformenc1.md) which replicates all the important features; also note that the gain arguments are not available in _bformenc1_.

## Syntax
``` csound-orc
aw, ax, ay, az bformenc asig, kalpha, kbeta, kord0, kord1
aw, ax, ay, az, ar, as, at, au, av bformenc asig, kalpha, kbeta, \
                                            kord0, kord1 , kord2
aw, ax, ay, az, ar, as, at, au, av, ak, al, am, an, ao, ap, aq bformenc \
    asig, kalpha, kbeta, kord0, kord1, kord2, kord3
```

### Performance

_aw, ax, ay, ..._ -- output cells of the B format.

_asig_ -- input signal.

_kalpha_ -- azimuth angle in degrees (clockwise).

_kbeta_ -- altitude angle in degrees.

_kord0_ -- linear gain of the zero order B format.

_kord1_ -- linear gain of the first order B format.

_kord2_ -- linear gain of the second order B format.

_kord3_ -- linear gain of the third order B format.

## Example

Here is an example of the bformenc opcode. It uses the file [bformenc.csd](../examples/bformenc.csd).
``` csound-csd title="Example of the bformenc opcode." linenums="1"
--8<-- "examples/bformenc.csd"
```

## Credits

Author: Samuel Groner<br>
2005<br>

New in version 5.07. Deprecated in 5.09.
