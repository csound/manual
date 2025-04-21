# How Csound works

Csound processes and generates output using "unit generators" (ugens) called opcodes. These opcodes are used to define instruments in the orchestra. When you run Csound, the engine loads the base Opcodes, and the opcodes contained in separate loadable "opcode libraries" . It then interprets the orchestra (through the orchestra reader). The engine sets up an instrument processing chain, which then receives events from the score or in real-time. The processing chain uses the input/output modules to generate output. There are modules that can write to file, or generate real-time audio and/or midi output.

![The Csound5 Modular structure.](../img/engine.png)


## Csound's processing buffers

Csound processes audio in sample blocks called buffers. There are three separate buffer layers:

**spout** = Csound's innermost software buffer, contains `ksmps` sample frames. Csound processes real-time control events once every `ksmps` sample frames.

**-b** = Csound's intermediate software buffer (the "software" buffer), in sample frames. Should be (but does not need to be) an integral multiple of `ksmps` (can be equal to `ksmps`, too). Once per `ksmps` sample frames, Csound copies spout to the `-b` buffer. Once per `-b` sample frames, Csound copies the `-b` buffer to the `-B` "hardware" buffer.

**-B** = The sound card's internal buffer (the "hardware" buffer), in sample frames. Should be (and may need to be) an integral multiple of `-b`. If Csound misses delivering a `-b` one time, the extra `-b` sample frames in `-b` are still there for the sound card to keep playing while Csound catches up. But they can be of the same size if you're willing to bet Csound can always keep up with the sound card.
