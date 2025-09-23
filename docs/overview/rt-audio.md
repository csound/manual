# Real-Time Audio

 The following information applies mostly to csound being run directly from the command line. Front-ends implement these features in different ways, but knowledge of them is necessary in some of them.

The [-i](../invoke/cs-options-by-category.md#-i-file-inputfile) and [-o](../invoke/cs-options-by-category.md#-o-file-outputfile) flags can be used to specify realtime output instead of the ordinary non-realtime file output. You should use `-o dac` for realtime output and `-i adc` for realtime input. Naturally, you can use either one or both if your hardware supports it. You can also specify the hardware you want to use by appending a device number or name to the flag (See [-i](../invoke/cs-options-by-category.md#-i-file-inputfile) and [-o)](../invoke/cs-options-by-category.md#-o-file-outputfile)).

You might also need to use the [-+rtaudio](../invoke/cs-options-by-category.md#-rtaudiostring) flag to specify the driver interface to be used. Csound defaults to using Portaudio, which is cross-plaform and reliable, but for better performance, you might need to use ALSA or JACK on linux, and CoreAudio on Mac. You can use ASIO on Windows if your version of Portaudio has been compiled with ASIO support.

You can see a list of available devices by giving a device number which is out of range, for instance `-o dac99`. This will also reveal if you have ASIO available if you are using PortAudio.

### Period & Buffer Sizes

Period and buffer sizes will vary greatly from one machine to another. Lower buffer sizes will result in lower latency, but might cause breakups or clicks in the audio. The Csound flags which control period and buffer sizes are [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum) and [-B](../invoke/cs-options-by-category.md#-b-num-hardwarebufsampsnum), respectively. Buffer size is hardware dependant, and some experimentation may be necessary to find the optimal balance between low latency performance and uninterrupted audio output. The values given to [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum) and [-B](../invoke/cs-options-by-category.md#-b-num-hardwarebufsampsnum) should be powers of two, and the value of [-B](../invoke/cs-options-by-category.md#-b-num-hardwarebufsampsnum) should be at least one power of two higher than that of [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum).

Currently, with [-B](../invoke/cs-options-by-category.md#) set to 512, audio output latency is about 12 milliseconds, fast enough for reasonably responsive keyboad playing. Even shorter latencies, are feasible on some systems.

### Control Rate

Low values for *ksmps* will in general give a higher quality of synthesis, but will consume more system resources. There is no hard and fast rule for setting *ksmps* - different orchestras will require different control rates. A waveguide instrument will need a *ksmps* of 1 (and may not be suitable for realtime use), whereas a simple FM synth may be run with a higher *ksmps* without noticeable degradation of sound. If the FM synth were to be used to play a monophonic bassline, a very low *ksmps* may be used, however more complex note clusters will require a higher *ksmps*. A well-tuned Linux system should be capable of running even complex polyphonic synths with *ksmps* values as low as 4 or 8. If full duplex audio is required, [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum) must be an integer multiple of *ksmps*. Bearing this in mind, a rule of thumb might be to only use powers of two for *ksmps*.

Some settings differ according to platform. See next pages for information for each platform.

### Optimizing Audio I/O Latency

To achieve the lowest latency possible without audio break ups, a combination of variables needs to be tweaked. The final values will be platform and system dependent, and will also depend on the complexity of the audio calculations performed. You need to adjust ksmps in the orchestra, as well as the software ([-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum)) and harware buffer ([-B](../invoke/cs-options-by-category.md#-b-num-hardwarebufsampsnum)) sizes.

Usually the simplest solution is the following:

1. Set *ksmps* to a value with a good tradeoff between quality and performance, without adjusting [-B](../invoke/cs-options-by-category.md#-b-num-hardwarebufsampsnum) at all.
2. Set [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum) to a negative power of two of this value.

    To get the optimal values, start with something you think is going to be too low, ie -1, and then continue "upwards", -2, -4 and so on, until you stop getting x-runs (glitches). The real value of [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum) will be the absolute value of _-b * ksmps_.

3. Reduce the hardware buffer ([-B](../invoke/cs-options-by-category.md#-b-num-hardwarebufsampsnum)). Bring it down from the default (1024 on Linux, 4096 on Mac OS X, 16384 on Windows), halving it each time, until you start to get x-runs (glitches) again. Then take it back up again until performance is continuous.

This process assumes you have a 16-bit soundcard. If you have a 24-bit soundcard, then [-B](../invoke/cs-options-by-category.md#) should be 3/2, or 3 times [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum), rather than 2 or 4 times. Csound works with 32-bit floats, or 64-bit doubles whereas most soundcards are 16 or 24-bit integer. [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum) is the internal buffer, so it's dealing with the 32 or 64-bit side of things, whereas [-B](../invoke/cs-options-by-category.md#-b-num-hardwarebufsampsnum) is the hardware buffer, so it's dealing with the 16 or 24-bit side. The csound default for floats is _-B = 4 * -b_. This is a sane value for a 16 bit card. You can usually get away with _-B = 2 * -b_, but this is the absolute minimum. For example, if you set _-b1024 -B2048_, csound will tell you that:

```
audio buffered in 1024 sample-frame blocks
      writing 4096-byte blocks to dac
```

4096 bytes is 32768 bits. 32768/32 = 1024, our sample-frame size, 1024 * 32/16 = 2048, our buffer size. Were we to reduce the value of [-B](../invoke/cs-options-by-category.md#-b-num-hardwarebufsampsnum), we would need to reduce the value of [-b](../invoke/cs-options-by-category.md#) by a corresponding amount in order to continue to write 16-bit integers to dac. The minimum size of [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum) is (_-B * bitrate_)/32. That is to say that the minimum ratio of [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum) to [-B](../invoke/cs-options-by-category.md#-b-num-hardwarebufsampsnum) should be:

```
    16-bit: 1:2
    24-bit: 2:3
    32-bit: 1:1
```

While there is no theoretical maximum ratio, it makes no sense to have a very high ratio here, as the software buffer has to fill the hardware buffer before returning. If the ratio is high, it will take a long time, defeating the purpose of setting a small value for [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum).

The value of [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum) is something that will need to be varied depending on the complexity of the instrument you're working with, but because it's intimately related to the value of *ksmps*, it's better to synchronise it with [ksmps](../opcodes/ksmps.md) and go from there. One way to do it is to decide how long the release on your envelopes might need to be at maximum (for desired effect), set the release on all envelopes to maximum, give yourself a generous value for [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum), and then play. If it breaks up, double ksmps, repeat until smooth, then bring the value of [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum) down as far as possible.

The value of [-B](../invoke/cs-options-by-category.md#-b-num-hardwarebufsampsnum) is primarily determined by operating system and soundcard. Figure out (using above method) how low you can go, and use that value (or one higher for safety). If you have problems you'll know that it's probably because of an inappropriate value for *ksmps*, too low a value for [-b](../invoke/cs-options-by-category.md#-b-num-iobufsampsnum), or denormals (see [denorm](../opcodes/denorm.md)).
