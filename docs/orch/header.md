# Header Statements and Global Space

The Orchestra Header contains global information that applies to all instruments and defines aspects of Csound's output. It is sometimes referred to as *instr 0*, because it behaves as an instrument, but without k- or a-rate processing (i.e. only opcodes and instructions that work at i-rate are allowed).

The most essential statements given in the orchestra header are:

[sr](../opcodes/sr.md) — the sample rate (default 44100)<br>
[ksmps](../opcodes/ksmps.md) — the number of samples for one control period (default 10)<br>
NOTE: It is recommended to specify `ksmps` and let Csound calculate `kr`. `ksmps` must be an integer and should usually be a power of two.<br>
[nchnls](../opcodes/nchnls.md) — the number of audio channels (default 1)<br>
NOTE: This refers to both, output and input channels. Use [nchnls_i](../opcodes/nchnls_i.md) in case input and output do not have the same number of channels.<br>
[0dbfs](../opcodes/0dbfs.md) — the number which serves as amplitude value for zero dB full scale (default 32768).<br>
NOTE: It is recommended to set `0dbfs` to 1 as this is the standard in all audio applications nowadays.

A standard Csound header may look like this:

``` csound-orc
sr = 48000
ksmps = 32
nchnls = 2
0dbfs =  1
```

Other common header statements:

[nchnls_i](../opcodes/nchnls_i.md) — the number of input channels (if different from [nchnls](../opcodes/nchnls.md))<br>
[A4](../opcodes/A4.md) — the frequency set to pitch A4 (default 440)<br>
[seed](../opcodes/seed.md) — sets the global seed for most random generators<br>
NOTE: The syntax is `seed 0` or `seed(0)` but NOT `seed = 0`<br>
[massign](../opcodes/massign.md) — assigns incoming MIDI to a specific instrument<br>
[pgmassign](../opcodes/pgmassign.md) — assigns a MIDI program number to a specific instrument<br>
[ctrlinit](../opcodes/ctrlinit.md) — sets the initial values for a set of MIDI controllers<br>
[ftgen](../opcodes/ftgen.md) — generates a function table

The instrument header is part of the global space. This space continues between and after the instrument code, and is evaluated as a whole before any instrument is running. 

Typical statements in the global space other than the orchestra header are:  
- User Defined Opcode definitions  
- Macro definitions  
- [#include](../opcodes/include.md) statements for external files  
- setting or initializing global variables, e.g. `gaReverb init 0`  
- declaring software channels, e.g. `chn_k("watchdog", 3)`  