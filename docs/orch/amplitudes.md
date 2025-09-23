# Amplitude values in Csound

Amplitude values in Csound are always relative to the [0dbfs](../opcodes/0dbfs.md) value representing the peak available amplitude before clipping, in either an AD/DA codec, or in a soundfile with a defined range (which both WAVE and AIFF are). In the original Csound, this value was always 32767, corresponding to the bipolar range of a 16bit soundfile or 16bit AD/DA codec, Csound's only possible output back then. This remains the default peak amplitude for Csound, for backward compatibility and you will find some of this manual's examples still use this value (hence you find large amplitude values like 10000).

The [0dbfs](../opcodes/0dbfs.md) value enables Csound to produce appropriately scaled values to whatever output format is being used, whether 24bit integer, 32bit floats, or even 32bit integers. Put another way, the literal amplitude values you write in a Csound instrument only match those written literally to the file if the [0dbfs](../opcodes/0dbfs.md) value in Csound corresponds exactly to that of the output sample format. The consequence of this approach is that you can write a piece with a certain amplitude and have it render correctly and identically (setting aside of course the better dynamic range of the high-res formats) whether written to an integer or floats file, or rendered in real-time.

> :memo: **Note**
>
> The one exception to this is if you choose to write to a "raw" (headerless) file format. In such cases the internal [0dbfs](../opcodes/0dbfs.md) value is meaningless, and whatever values you use are written unmodified. This does enable arbitrary data to be generated or processed by Csound. It is a relatively exotic thing to do, but some users need it.

You can choose to redefine the [0dbfs](../opcodes/0dbfs.md) value in the orchestra header, purely for your own convenience or preference. Many people will choose 1.0 (the standard for SAOL, other software like Pure Data, and for many plugin standards such as VST, LADSPA, CoreAudio AudioUnits, etc), but any value is possible.

The common factor in defining amplitudes is the decibel (dB) scale, with 0dBFS always understood as digital peak; hence "0dbfs" means "0dB Full-Scale value". This measure is different to actual amplitude values, since amplitude values are a linear scale which show the actual oscillation around 0, so they can be positive or negative. Decibel values are an absolute logarithmic scale, but can be useful for most opcodes as well. You can convert amplitude to and from decibels using the [ampdb](../opcodes/ampdb.md), [ampdbfs](../opcodes/ampdbfs.md), [dbamp](../opcodes/dbamp.md) and [dbfsamp](../opcodes/dbfsamp.md) functions. This way, Csound enables the programmer to express all amplitudes in dB - lower amplitudes will then be represented by negative dB values. This reflects industry practice (e.g. in level meters in mixers, etc).

For example the same dB level of -6dB (half the amplitude) or -20dB are actually a different linear amplitude according to 0dbfs like this:

**dBFS in relation to amplitude**

| dBFS   | 0dbfs = 32767 (default) | 0dbfs = 1 | 0dbfs = 1000 (unusual) |
|--------|-------------------------|-----------|------------------------|
|   0 dB | 32767                   | 1         | 1000                   |
|  -6 dB | 16384                   | 0.5       |  500                   |
| -20 dB | 3276.7                  | 0.1       |  100                   |


Some Csound users might therefore be minded to express all levels in dBFS, and obviate any confusion or ambiguity of level that may otherwise arise when using explicit amplitude values. The decibel scale reflects the response of the ear pretty closely, and that when you want to express a really quiet level, it might be easier and more expressive to write "-46dB" than "0.005" or "163.8".

The reason for using 0dbfs is very simple: digital peak equates to maximum level regardless of sample resolution. If you then define a signal at -110dB you will lose it if rendering to a 16bit file, but retain it (audibly or not) if rendering to 24bit or better. In other words, there is a fixed ceiling, but a moveable floor - you can define sounds as quietly as you like (e.g. envelope tails), in a predictable way, and preserve them or not (without changing the orch code at all), depending on the resolution (file or audio i/o) you render to.