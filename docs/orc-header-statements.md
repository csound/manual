# Header Statements and Global Space

The Orchestra Header contains global information that applies to all instruments and defines aspects of Csound's output. It is sometimes referred to as *instr 0*, because it behaves as an instrument, but without k- or a-rate processing (i.e. only opcodes and instructions that work at i-rate are allowed).

The most essential statements given in the orchestra header are:

`sr` the sample rate (default 44100)  
`ksmps` the number of samples for one control period (default 10)  
NOTE: It is recommended to specify `ksmps` and let Csound calculate `kr`. `ksmps` must be an integer and should usually be a power of two.  
`nchnls` the number of audio channels (default 1)  
NOTE: This refers to both, output and input channels. Use `nchnls_i` in case input and output do not have the same number of channels.  
`0dbfs` the number which serves as amplitude value for zero dB full scale (default 32768).  
NOTE: It is recommended to set `0dbfs` to 1 as this is the standard in all audio applications nowadays.

A standard Csound header may look like this:

``` csound-orc
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1
```

Other common header statements:

`nchnls_i` the number of input channels (if different from `nchnls`)  
[`A4`](opcodes/A4.md) the frequency set to pitch A4 (default 440)  
`seed` sets the global seed for most random generators  
NOTE: The syntax is `seed 0` or `seed(0)` but NOT `seed = 0`  
`massign` assigns incoming midi to a specific instrument  
`pgmassign` assigns a MIDI program number to a specific instrument  
`ctrlinit` sets the initial values for a set of MIDI controllers  
`ftgen` generates a function table

The instrument header is part of the global space. This space continues between and after the instrument code, and is evaluated as a whole before any instrument is running. 

Typical statements in the global space other than the orchestra header are:  
- User Defined Opcode definitions  
- Macro definitions  
- `#include` statements for external files  
- setting or initializing global variables, e.g. `gaReverb init 0`  
- declaring software channels, e.g. `chn_k("watchdog",3)`  