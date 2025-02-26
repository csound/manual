# **MIDI/Score Interoperability opcodes**

The following opcodes can be used to design instruments that work interchangably for real-time MIDI and score events:

* [midichannelaftertouch](../../opcodes/midichannelaftertouch)
* [midichn](../../opcodes/midichn)
* [midicontrolchange](../../opcodes/midicontrolchange)
* [mididefault](../../opcodes/mididefault)
* [midinoteoff](../../opcodes/midinoteoff)
* [midinoteoncps](../../opcodes/midinoteoncps)
* [midinoteonkey](../../opcodes/midinoteonkey)
* [midinoteonoct](../../opcodes/midinoteonoct)
* [midinoteonpch](../../opcodes/midinoteonpch)
* [midipitchbend](../../opcodes/midipitchbend)
* [midipolyaftertouch](../../opcodes/midipolyaftertouch)
* [midiprogramchange](../../opcodes/midiprogramchange).

> :memo: **Adapting a score-activated Csound instrument.**
>
> To adapt an ordinary Csound instrument designed for score activation for score/MIDI interoperability:
>
> * Change all [linen](../../opcodes/linen), [linseg](../../opcodes/linseg), and [expseg](../../opcodes/expseg) opcodes to [linenr](../../opcodes/linenr), [linsegr](../../opcodes/linsegr), and [expsegr](../../opcodes/expsegr), respectively, except for a de-clicking or damping envelope. This will not materially change score-driven performance.
> * Add the following lines at the beginning of the instrument definition:
> ``` csound-orc
>  ; Ensures that a MIDI-activated instrument
>  ; will have a positive p3 field.
>  mididefault 60, p3 
>  ; Puts MIDI key translated to cycles per
>  ; second into p4, and MIDI velocity into p5
>  midinoteoncps p4, p5
> ```
> Obviously, _midinoteoncps_ could be changed to _midinoteonoct_ or any of the other options, and the choice of p-fields is arbitrary.


> :memo: **MIDI Realtime Input/Ouput command line options**
>
> New [MIDI I/O flags](../../command) in Csound 5.02, can replace most uses of these MIDI interop opcodes, and make usage easier.
