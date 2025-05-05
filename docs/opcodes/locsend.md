<!--
id:locsend
category:Signal Modifiers:Panning and Spatialization
-->
# locsend
Distributes the audio signals of a previous [locsig](../opcodes/locsig.md) opcode.

The number of output signals must match the number in the previous _locsig_. The output signals from _locsend_ are derived from the values given for distance and reverb in the _locsig_ and are ready to be sent to local or global reverb units (see example below). The reverb amount and the balance between the 2 or 4 channels are calculated in the same way as described in the Dodge book (an essential text!).

## Syntax
=== "Modern"
    ``` csound-orc
    a1, a2 = locsend()
    a1, a2,  a3, a4 = locsend()
    ```

=== "Classic"
    ``` csound-orc
    a1, a2 locsend
    a1, a2,  a3, a4 locsend
    ```

## Examples

``` csound-orc linenums="1"
  asig some audio signal
  kdegree            line    0, p3, 360
  kdistance          line    1, p3, 10
  a1, a2, a3, a4     locsig  asig, kdegree, kdistance, .1
  ar1, ar2, ar3, ar4 locsend
  ga1 = ga1+ar1
  ga2 = ga2+ar2
  ga3 = ga3+ar3
  ga4 = ga4+ar4
                     outq    a1, a2, a3, a4
endin

instr 99 ; reverb instrument
  a1                 reverb2 ga1, 2.5, .5
  a2                 reverb2 ga2, 2.5, .5
  a3                 reverb2 ga3, 2.5, .5
  a4                 reverb2 ga4, 2.5, .5
                     outq    a1, a2, a3, a4
  ga1=0
  ga2=0
  ga3=0
  ga4=0
```

In the above example, the signal, _asig_, is sent around a complete circle once during the duration of a note while at the same time it becomes more and more &#8220;distant&#8221; from the listeners' location. _locsig_ sends the appropriate amount of the signal internally to _locsend_. The outputs of the _locsend_ are added to global accumulators in a common Csound style and the global signals are used as inputs to the reverb units in a separate instrument. For an example, see [locsig](../opcodes/locsig.md).

_locsig_ is useful for quad and stereo panning as well as fixed placed of sounds anywhere between two loudspeakers. Below is an example of the fixed placement of sounds in a stereo field. It uses the file [locsend_stereo.csd](../examples/locsend_stereo.csd).

``` csound-csd title="Example of the locsend opcode." linenums="1"
--8<-- "examples/locsend_stereo.csd"
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
