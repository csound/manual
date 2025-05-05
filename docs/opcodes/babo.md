<!--
id:babo
category:Signal Modifiers:Reverberation
-->
# babo
A physical model reverberator.

_babo_  stands  for  **ba**ll-within-the-**bo**x.   It is a physical model reverberator based on the paper by Davide  Rocchesso "The  Ball  within  the Box: a sound-processing metaphor", Computer Music Journal,  Vol  19,  N.4,  pp.45-47,  Winter 1995.

The resonator geometry can be defined, along with some response characteristics, the position of the listener within the resonator, and the position of the sound source.

_babo2_ was introduced to fix the issue of the direct sound parameter (see expert parameters), which is a non-op in the original opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    a1, a2 = babo(asig, ksrcx, ksrcy, ksrcz, irx, iry, irz [, idiff] [, ifno])
    a1, a2 = babo2(asig, ksrcx, ksrcy, ksrcz, irx, iry, irz [, idiff] [, ifno])
    ```

=== "Classic"
    ``` csound-orc
    a1, a2 babo asig, ksrcx, ksrcy, ksrcz, irx, iry, irz [, idiff] [, ifno]
    a1, a2 babo2 asig, ksrcx, ksrcy, ksrcz, irx, iry, irz [, idiff] [, ifno]
    ```

### Initialization

_irx, iry, irz_ -- the  coordinates of the geometry of the resonator (length of the edges in meters)

_idiff_ -- is  the  coefficient  of  diffusion  at  the walls,  which regulates the amount of diffusion (0-1, where 0 = no diffusion, 1 = maximum diffusion - default: 1)

_ifno_ -- expert  values  function:  a function number that holds all the additional parameters  of the resonator. This is typically a GEN2--type function used in non-rescaling mode. They are as follows:

* _decay_ -- main decay of the resonator (default: 0.99)
* _hydecay_ -- high frequency decay of the resonator (default: 0.1)
* _rcvx, rcvy, rcvz_ -- the coordinates of the position of the receiver (the listener) (in  meters;  0,0,0 is the resonator center)
* _rdistance_ -- the  distance in meters between the two pickups (your ears,  for  example  - default: 0.3)
* _direct_ -- the attenuation of the direct signal (0-1, default: 0.5). This is a non-op in babo, but has been introduced in babo2.
* _early_diff_ -- the attenuation coefficient of the  early reflections (0-1, default: 0.8)

### Performance

_asig_ -- the input signal

_ksrcx, ksrcy, ksrcz_ -- the virtual coordinates of the source of sound (the input signal). These are allowed to move at k-rate and provide all the necessary variations in terms of response of the resonator.

## Examples

Here is a simple example of the babo opcode. It uses the file [babo.csd](../examples/babo.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="A simple example of the babo opcode." linenums="1"
--8<-- "examples/babo.csd"
```

Here is an advanced example of the babo opcode. It uses the file [babo_expert.csd](../examples/babo_expert.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="An advanced example of the babo opcode." linenums="1"
--8<-- "examples/babo_expert.csd"
```

## See also

[Reverberation](../sigmod/reverbtn.md)

## Credits

Author: Paolo Filippi<br>
Padova, Italy<br>
1999<br>

Nicola Bernardini<br>
Rome, Italy<br>
2000<br>

New in Csound version 4.09
