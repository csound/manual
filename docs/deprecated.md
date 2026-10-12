<!-- Don't modify this file.
 It is generated automatically by makeAppendices.py-->
# **Deprecated Opcodes**

The following opcodes are deprecated. They are still distributed with Csound for backward compatibility. The new opcodes which are to be used in place of the deprecated ones are indicated within each of the following entries.

[OSCsend_lo](opcodes/OSCsend_lo.md) - Sends OSC messages using the older name for oscsendlo.<br>
[bformdec](opcodes/bformdec.md) - Decodes an ambisonic B format signal into loudspeaker specific signals.<br>
[bformenc](opcodes/bformenc.md) - Codes a signal into the ambisonic B format.<br>
[chnclear_array](opcodes/chnclear_array.md) - Sets the contents of one or more array channels to zero.<br>
[copy2ftab](opcodes/copy2ftab.md) - Copies values from an array to a function table at performance time.<br>
[copy2ttab](opcodes/copy2ttab.md) - Copies values from a function table to an array at performance time.<br>
[fin](opcodes/fin.md) - Read signals from a file at a-rate.<br>
[hrtfer](opcodes/hrtfer.md) - Creates 3D audio for two speakers.<br>
[inq](opcodes/inq.md) - Reads quad audio data from an external device or stream.<br>
[ins](opcodes/ins.md) - Reads stereo audio data from an external device or stream.<br>
[ktableseg](opcodes/ktableseg.md) - Deprecated.<br>
[lentab](opcodes/lentab.md) - Returns a dimension's length or the number of dimensions in a k-rate array.<br>
[maxtab](opcodes/maxtab.md) - Returns the maximum value in a k-rate array and optionally its index.<br>
[mintab](opcodes/mintab.md) - Returns the minimum value in a k-rate array and optionally its index.<br>
[mp3in](opcodes/mp3in.md) - Reads mono or stereo audio data from an external MP3 file.<br>
[mp3len](opcodes/mp3len.md) - Returns the length of an MP3 sound file.<br>
[out32](opcodes/out32.md) - Writes 32-channel audio data to an external device or stream.<br>
[outh](opcodes/outh.md) - Writes 6-channel audio data to an external device or stream.<br>
[outo](opcodes/outo.md) - Writes 8-channel audio data to an external device or stream.<br>
[outq1](opcodes/outq1.md) - Writes samples to quad channel 1 of an external device or stream.<br>
[outq2](opcodes/outq2.md) - Writes samples to quad channel 2 of an external device or stream.<br>
[outq3](opcodes/outq3.md) - Writes samples to quad channel 3 of an external device or stream.<br>
[outq4](opcodes/outq4.md) - Writes samples to quad channel 4 of an external device or stream.<br>
[outq](opcodes/outq.md) - Writes 4-channel audio data to an external device or stream.<br>
[outs1](opcodes/outs1.md) - Writes samples to stereo channel 1 of an external device or stream.<br>
[outs2](opcodes/outs2.md) - Writes samples to stereo channel 2 of an external device or stream.<br>
[outs](opcodes/outs.md) - Writes stereo audio data to an external device or stream.<br>
[outx](opcodes/outx.md) - Writes 16-channel audio data to an external device or stream.<br>
[pop](opcodes/pop.md) - Pops values from the global stack.<br>
[pop_f](opcodes/pop_f.md) - Pops an f-sig frame from the global stack.<br>
[print_type](opcodes/print_type.md) - Prints the type of a variable or expression.<br>
[ptable3](opcodes/ptable3.md) - Accesses table values by direct indexing with cubic interpolation.<br>
[ptable](opcodes/ptable.md) - Accesses table values by direct indexing.<br>
[ptablei](opcodes/ptablei.md) - Accesses table values by direct indexing with linear interpolation.<br>
[ptableiw](opcodes/ptableiw.md) - Writes a value to a function table at initialization.<br>
[ptablew](opcodes/ptablew.md) - Change the contents of existing function tables of any length.<br>
[push](opcodes/push.md) - Pushes a value into the global stack.<br>
[push_f](opcodes/push_f.md) - Pushes an f-sig frame into the global stack.<br>
[scalet](opcodes/scalet.md) - Rescales part of a k-rate array in place.<br>
[sclag](opcodes/sc_lag.md) - Exponential lag with 60dB lag time.<br>
[sclagud](opcodes/sc_lagud.md) - Exponential Lag (Deprecated).<br>
[scphasor](opcodes/sc_phasor.md) - A resettable linear ramp between two levels (renamed as trigphasor).<br>
[sctrig](opcodes/sc_trig.md) - Timed trigger (Replaced by trighold).<br>
[sndload](opcodes/sndload.md) - Loads a sound file into memory for use by *loscilx*.<br>
[soundout](opcodes/soundout.md) - Deprecated.<br>
[soundouts](opcodes/soundouts.md) - Deprecated.<br>
[specaddm](opcodes/specaddm.md) - Perform a weighted add of two input spectra.<br>
[specdiff](opcodes/specdiff.md) - Finds the positive difference values between consecutive spectral frames.<br>
[specdisp](opcodes/specdisp.md) - Displays the magnitude values of the spectrum.<br>
[specfilt](opcodes/specfilt.md) - Filters each channel of an input spectrum.<br>
[spechist](opcodes/spechist.md) - Accumulates the values of successive spectral frames.<br>
[specptrk](opcodes/specptrk.md) - Estimates the pitch of the most prominent complex tone in the spectrum.<br>
[specscal](opcodes/specscal.md) - Scales an input spectral datablock with spectral envelopes.<br>
[specsum](opcodes/specsum.md) - Sums the magnitudes across all channels of the spectrum.<br>
[spectrum](opcodes/spectrum.md) - Generate a constant-Q, exponentially-spaced DFT across all octaves of a multiply-downsampled control or audio input signal.<br>
[stack](opcodes/stack.md) - Initializes and sets the size of the global stack.<br>
[sumtab](opcodes/sumtab.md) - Returns the sum of a k-rate array.<br>
[tabgen](opcodes/tabgen.md) - Creates a k-rate array containing an arithmetic sequence at initialization.<br>
[tableiw](opcodes/tableiw.md) - Deprecated as of version 3.<br>
[tabmap](opcodes/tabmap.md) - Applies a function to each element of a k-rate array.<br>
[tabmap_i](opcodes/tabmap_i.md) - Maps a function over a k-rate array at initialization only.<br>
[tabmapi](opcodes/tabmapi.md) - Provides the older alias for initialization-only array mapping.<br>
[tabslice](opcodes/tabslice.md) - Copies selected elements from a k-rate array during performance.<br>
[tb](opcodes/tb.md) - Table Read Access inside expressions.<br>
[vbap16](opcodes/vbap16.md) - Distributes an audio signal among 16 channels.<br>
[vbap4](opcodes/vbap4.md) - Distributes an audio signal among 4 channels.<br>
[vbap4move](opcodes/vbap4move.md) - Distributes an audio signal among 4 channels with moving virtual sources.<br>
[vbap8](opcodes/vbap8.md) - Distributes an audio signal among 8 channels.<br>
[vbap8move](opcodes/vbap8move.md) - Distributes an audio signal among 8 channels with moving virtual sources.<br>
[xscanmap](opcodes/xscanmap.md) - Allows the position and velocity of a node in a scanned process to be read.<br>
[xscans](opcodes/xscans.md) - Fast scanned synthesis waveform and the wavetable generator.<br>
[xscansmap](opcodes/xscansmap.md) - Allows the position and velocity of a node in a scanned process to be read.<br>
[xscanu](opcodes/xscanu.md) - Compute the waveform and the wavetable for use in scanned synthesis.<br>
[xyin](opcodes/xyin.md) - Sense the cursor position in an output window.<br>
