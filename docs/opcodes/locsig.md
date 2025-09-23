<!--
id:locsig
category:Signal Modifiers:Panning and Spatialization
-->
# locsig
Takes an input signal and distributes between 2 or 4 channels.

It uses values in degrees to calculate the balance between adjacent channels. It also takes arguments for distance (used to attenuate signals that are to sound as if they are some distance further than the loudspeaker itself), and for the amount the signal that will be sent to reverberators. This unit is based upon the example in the Charles Dodge/Thomas Jerse book, _Computer Music_, page 320.

## Syntax
=== "Modern"
    ``` csound-orc
    a1, a2 = locsig(asig, kdegree, kdistance, kreverbsend)
    a1, a2,  a3, a4 = locsig(asig, kdegree, kdistance, kreverbsend)
    ```

=== "Classic"
    ``` csound-orc
    a1, a2 locsig asig, kdegree, kdistance, kreverbsend
    a1, a2,  a3, a4 locsig asig, kdegree, kdistance, kreverbsend
    ```

### Performance

_kdegree_ -- value between 0 and 360 for placement of the signal in a 2 or 4 channel space configured as: a1=0, a2=90, a3=180, a4=270 (kdegree=45 would balanced the signal equally between a1 and a2). _locsig_ maps _kdegree_ to sin and cos functions to derive the signal balances (e.g.: asig=1, kdegree=45, a1=a2=.707).

_kdistance_ -- value &gt;= 1 used to attenuate the signal and to calculate reverb level to simulate distance cues.  As _kdistance_ gets larger the sound should get softer and somewhat more reverberant (assuming the use of _locsend_ in this case).

_kreverbsend_ -- the percentage of the direct signal that will be factored along with the distance and degree values to derive signal amounts that can be sent to a reverb unit such as _reverb_, or _reverb2_.

## Examples

Here is an example of the locsig opcode. It uses the file [locsig_quad.csd](../examples/locsig_quad.csd).

``` csound-csd title="Example of the locsig opcode." linenums="1"
--8<-- "examples/locsig_quad.csd"
```

In the above example, the signal, _aout_, is sent around a complete circle once during the duration of a note while at the same time it becomes more and more "distant" from the listeners' location. _locsig_ sends the appropriate amount of the signal internally to _locsend_. The outputs of the _locsend_ are added to global accumulators in a common Csound style and the global signals are used as inputs to the reverb units in a separate instrument.

_locsig_ is useful for quad and stereo panning as well as fixed placed of sounds anywhere between two loudspeakers. Below is an example of the fixed placement of sounds in a stereo field.

``` csound-orc linenums="1"
instr 1
  a1, a2             locsig  asig, p4, p5, .1
  ar1, ar2           locsend
  ga1 = ga1+ar1
  ga2 = ga2+ar2
                     outs a1, a
endin
instr 99 
  ; reverb....
endin
```

A few notes:

``` csound-sco
;place the sound in the left speaker and near:
i1 0 1 0 1

;place the sound in the right speaker and far:
i1 1 1 90 25

;place the sound equally between left and right and in the middle ground distance:
i1 2 1 45 12
e
```

The next example shows a simple intuitive use of the distance value to simulate Doppler shift. The same value is used to scale the frequency as is used as the distance input to _locsig_.

``` csound-orc linenums="1"
kdistance          line    1, p3, 10
kfreq = (ifreq * 340) / (340 + kdistance)
asig               oscili  iamp, kfreq, 1
kdegree            line    0, p3, 360
a1, a2, a3, a4     locsig  asig, kdegree, kdistance, .1
ar1, ar2, ar3, ar4 locsend
```

## See also

[Panning and Spatialization: Amplitude spatialization](../sigmod/panspatl.md)

## Credits

Author: Richard Karpen<br>
Seattle, WA USA<br>
1998<br>

New in Csound version 3.48
