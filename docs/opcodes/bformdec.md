<!--
id:bformdec
category:Signal Modifiers:Panning and Spatialization
status:deprecated
-->
# bformdec
Decodes an ambisonic B format signal into loudspeaker specific signals.

Note that this opcode is deprecated as it is inaccurate, and is replaced by the much better opcode [bformdec1](../opcodes/bformdec1.md) which replicates all the important features.

## Syntax
``` csound-orc
ao1, ao2 bformdec isetup, aw, ax, ay, az [, ar, as, at, au, av \
                  [, abk, al, am, an, ao, ap, aq]]
ao1, ao2, ao3, ao4 bformdec isetup, aw, ax, ay, az [, ar, as, at, \
                            au, av [, abk, al, am, an, ao, ap, aq]]
ao1, ao2, ao3, ao4, ao5 bformdec isetup, aw, ax, ay, az [, ar, as, \
                                 at, au, av [, abk, al, am, an, ao, ap, aq]]
ao1, ao2, ao3, ao4, ao5, ao6, ao7, ao8 bformdec isetup, aw, ax, ay, az \
                                                [, ar, as, at, au, av  \
                                                [, abk, al, am, an, ao, ap, aq]]
```

### Initialization

_isetup_ -- loudspeaker setup. There are five supported setups:

1 denotes stereo setup.  There must be two output cells with loudspeaker positions  assumed to be (330/0, 30/0).

2 denotes quad setup. There must be four output cells. Loudspeaker positions assumed to be (45°/0), (135°/0), (225/0), (315/0).

3 is a 5.1 surround setup.  There must be five output cells. LFE channel is not supported. Loudspeaker positions assumed to be (330/0), (30/0), (0/0), (250/0), (110/0).

4 denotes eight loudspeaker circle setup. There must be eight output cells. Loudspeaker positions assumed to be (22.5/0), (67.5/0), (112.5/0), (157.5/0), (202.5/0), (247.5/0), (292.5/0), (337.5/0).

5 means an eight loudspeaker cubic setup. There must be eight output cells. Loudspeaker positions assumed to be (45/0), (45/30), (135/0), (135/30), (225/0), (225/30), (315/0), (315/30).

### Performance

_aw, ax, ay, ..._ -- input signal in the B format.

_ao1 .. ao8_ -- loudspeaker specific output signals.

## Example

Here is an example of the bformdec opcode. It uses the file [bformenc.csd](../examples/bformenc.csd).
``` csound-csd title="Example of the bformdec opcode." linenums="1"
--8<-- "examples/bformenc.csd"
```

## Credits

Author: Samuel Groner<br>
2005<br>

New in version 5.07. Deprecated in 5.09
