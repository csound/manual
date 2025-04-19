# **Sample Playback**

Opcodes that implement sample playback and looping are:

* [bbcutm](../opcodes/bbcutm.md)
* [bbcuts](../opcodes/bbcuts.md)
* [flooper](../opcodes/flooper.md)
* [flooper2](../opcodes/flooper2.md)
* [loscil](../opcodes/loscil.md)
* [loscil3](../opcodes/loscil3.md)
* [loscilx](../opcodes/loscilx.md)
* [lphasor](../opcodes/lphasor.md)
* [lposcil](../opcodes/lposcil.md)
* [lposcil3](../opcodes/lposcil3.md)
* [lposcila](../opcodes/lposcila.md)
* [lposcilsa](../opcodes/lposcilsa.md)
* [lposcilsa2](../opcodes/lposcilsa2.md)
* [sndloop](../opcodes/sndloop.md)
* [waveset](../opcodes/waveset.md)

See also the [Signal Input](../sigio/input.md) section for other ways to input sound.

## **Soundfonts**

Beginning with Csound Version 4.07, Csound supports the SoundFont2 sample file format. SoundFont2 (or SF2) is a widespread standard which allows encoding banks of wavetable-based sounds into a binary file. In order to understand the usage of these opcodes, the user must have some knowledge of the SF2 format, so a brief description of this format follows.

The SF2 format is made by generator and modulator objects. All current Csound opcodes regarding SF2 support the generator function only.

There are several levels of generators having a hierarchical structure. The most basic kind of generator object is a sample. Samples may or may not be be looped, and are associated with a MIDI note number, called the base-key. When a sample is associated with a range of MIDI note numbers, a range of velocities, a transposition (coarse and fine tuning), a scale tuning, and a level scaling factor, the sample and its associations make up a &#8220;split.&#8221; A set of splits, together with a name, make up an &#8220;instrument.&#8221; When an instrument is associated with a key range, a velocity range, a level scaling factor, and a transposition, the instrument and its associations make up a &#8220;layer.&#8221; A set of layers, together with a name, makes up a &#8220;preset.&#8221; Presets are normally the final sound-generating structures ready for the user. They generate sound according to the settings of their lower-level components.

<figure markdown="span">
![](../images/SF.png)
<figcaption></figcaption>
</figure>

Both sample data and structure data is embedded in the same SF2 binary file. A single SF2 file can contain up to a maximum of 128 banks of 128 preset programs, for a total of 16384 presets in one SF2 file. The maximum number of layers, instruments, splits, and samples is not defined, and probably is only limited by the computer's memory.

Soundfonts can be viewed and edited by programs like Polyphone ([GPL3, https://www.polyphone-soundfonts.com/](https://www.polyphone-soundfonts.com/)) or Swami ([GPL2, http://www.swamiproject.org](http://www.swamiproject.org))

#### Fluid Opcodes

The fluid family of opcodes wraps Peter Hannape's SoundFont 2 player, FluidSynth: *fluidEngine* for instantiating a FluidSynth engine, *fluidSetInterpMethod* for setting interpolation method for a channel in a FluidSynth engine, *fluidLoad* for loading SoundFonts, *fluidProgramSelect* for assigning presets from a SoundFont to a FluidSynth engine's MIDI channel, *fluidNote* for playing a note on a FluidSynth engine's MIDI channel, *fluidCCi* for sending a controller message at i-time to a FluidSynth engine's MIDI channel, *fluidCCk* for sending a controller message at k-rate to a FluidSynth engine's MIDI channel. *fluidControl* for playing and controlling loaded Soundfonts (using 'raw' MIDI messages), *fluidOut* for receiving audio from a single FluidSynth engine, and *fluidAllOut* for receiving audio from all FluidSynth engines. These opcodes are available as plugins in *fluidOpcodes* from the plugins repository.


#### "Original" Soundfont opcodes

These opcodes can also use soundfonts to generate sound. sfplay etc. were created for one purpose -- to access the instruments and samples in SoundFonts. The fluid opcodes were created for another purpose -- to use SoundFonts more or less the way they were designed to be used, i.e. using keyboard mappings, layers, internal processing, etc.

* [sfilist](../opcodes/sfilist.md)
* [sfinstr](../opcodes/sfinstr.md)
* [sfinstr3](../opcodes/sfinstr3.md)
* [sfinstr3m](../opcodes/sfinstr3m.md)
* [sfinstrm](../opcodes/sfinstrm.md)
* [sfload](../opcodes/sfload.md)
* [sfpassign](../opcodes/sfpassign.md)
* [sfplay](../opcodes/sfplay.md)
* [sfplay3](../opcodes/sfplay3.md)
* [sfplay3m](../opcodes/sfplay3m.md)
* [sfplaym](../opcodes/sfplaym.md)
* [sflooper](../opcodes/sflooper.md)
* [sfplist](../opcodes/sfplist.md)
* [sfpreset](../opcodes/sfpreset.md)
