<!--
id:timedseq
category:Instrument Control:Sensing and Control
-->
# timedseq
Time Variant Sequencer.

An event-sequencer in which time can be controlled by a time-pointer. Sequence data are stored into a table.

## Syntax
=== "Modern"
    ``` csound-orc
    ktrig = timedseq(ktimpnt, ifn, kp1 [,kp2, kp3, ...,kpN])
    ```

=== "Classic"
    ``` csound-orc
    ktrig timedseq ktimpnt, ifn, kp1 [,kp2, kp3, ...,kpN]
    ```

### Initialization

_ifn_ -- number of table containing sequence data.

### Performance

_ktri_ -- output trigger signal

_ktimpnt_ -- time pointer into sequence file, in seconds.

_kp1,...,kpN_ -- output p-fields of notes. kp2 meaning is relative action time and kp3 is the duration of notes in seconds.

_timedseq_ is a sequencer that allows to schedule notes starting from a user sequence, and depending from an external timing given by a time-pointer value (ktimpnt argument). User should fill table ifn with a list of notes, that can be provided in an external text file by using GEN23, or by typing it directly in the orchestra (or score) file with GEN02. The format of the text file containing the sequence is made up simply by rows containing several numbers separated by space (similarly to normal Csound score).  The first value of each row must be a positive or null value, except for a special case that will be explained below. This first value is normally used to define the instrument number corresponding to that particular note (like normal score). The second value of each row must contain the action time of corresponding note and the third value its duration. This is an example:

```
0 0    0.25 1  93
0 0.25 0.25 2  63
0 0.5  0.25 3  91
0 0.75 0.25 4  70
0 1    0.25 5  83
0 1.25 0.25 6  75
0 1.5  0.25 7  78
0 1.75 0.25 8  78
0 2    0.25 9  83
0 2.25 0.25 10 70
0 2.5  0.25 11 54
0 2.75 0.25 12 80
-1 3   -1   -1 -1  ;; last row of the sequence
```

In this example, the first value of each row is always zero (it is a dummy value, but this p-field can be used, for example, to express a MIDI channel or an instrument number), except the last row, that begins with -1. This value (-1) is a special value, that indicates the end of sequence. It has itself an action time, because sequences can be looped. So the previous sequence has a default duration of 3 seconds, being value 3 the last action time of the sequence.

It is important that ALL lines contains the same number of values (in the example all rows contains exactly 5 values). The number of values contained by each row, MUST be the number of kpXX output arguments (notice that, even if kp1, kp2 etc. are placed at the right of the opcode, they are output arguments, not input arguments).

ktimpnt argument provide the real temporization of the sequence. Actually the passage of time through sequence is specified by ktimpnt itself, which represents the time in seconds. ktimpnt must always be positive, but can move forwards or backwards in time, be stationary or discontinuous, as a pointer into the sequence file, in the same way of pvoc or lpread. When ktimpnt crosses the action time of a note, a trigger signal is sent to ktrig output argument, and kp1, kp2,...kpN arguments are updated with the values of that note. This information can then be used with schedkwhen to actually activate note events. Notice that kp1,...kpn data can be further processed (for example delayed with delayk, transposed, etc.) before feeding schedkwhen.

_ktimpnt_ can be controlled by a linear signal, for example:

``` csound-orc
ktimpnt line     0, p3, 3  ; original sequence duration was 3 secs
ktrig   timedseq ktimpnt, 1, kp1, kp2, kp3, kp4, kp5
        schedkwhen   ktrig, 105, 2, 0, kp3, kp4, kp5
```

in this case the complete sequence (with original duration of 3 seconds) will be played in _p3_ seconds.

You can loop a sequence by controlling it with a phasor:

``` csound-orc
kphs    phasor   1/3
ktimpnt =        kphs * 3
ktrig   timedseq ktimpnt ,1 ,kp1, kp2, kp3, kp4, kp5
        schedkwhen   ktrig, 105, 2, 0, kp3, kp4, kp5
```

Obviously you can play only a fragment of the sequence,  read it backward, and non-linearly access sequence data in the same way of pvoc and lpread opcodes.

With timedseq opcode you can do almost all things of a normal score, except you have the following limitations:

1.  You cannot have two notes exactly starting with the same action time; actually at least a k-cycle should separate timing of two notes (otherwise the schedkwhen mechanism eats one of them).
2.  All notes of the sequence must have the same number of p-fields (even if they activate different instruments).

You can remedy this limitation by filling with dummy values notes that belongs to instruments with less p-fields than other ones.

## Examples

Here is a complete example of the timedseq opcode. It uses the file [timedseq.csd](../examples/timedseq.csd).

``` csound-csd title="Example of the timedseq opcode." linenums="1"
--8<-- "examples/timedseq.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Gabriel Maldonado
