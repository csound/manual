# Floating-point precision

Csound can use single-precision or double-precision values for ordinary numeric variables and audio samples. This is a build choice. It is separate from the processor's 32-bit or 64-bit architecture and from the sample format of an audio file.

## Checking a build

Use [floatsize](../opcodes/floatsize.md) to check the running Csound library. It returns 4 for single precision and 8 for double precision. The startup message also identifies the sample precision.

Csound's CMake option `USE_DOUBLE` selects double precision and defaults to `ON`. Setting it to `OFF` selects single precision. This setting determines the Csound sample type `MYFLT`. Individual opcodes may use a different precision for some internal calculations.

## What the extra bits mean

| Format | Storage per value | Precision for normal values |
| --- | --- | --- |
| Single precision, binary32 | 32 bits | 24 significant binary digits |
| Double precision, binary64 | 64 bits | 53 significant binary digits |

The precision includes an implicit leading bit. The stored fraction fields have 23 and 52 bits. The remaining bits hold the sign and exponent. See the [IEEE arithmetic guide](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_math.html).

Double precision represents numbers more closely and covers a wider range of magnitudes. These bit counts do not specify a fixed audio noise floor or guarantee an audible difference.

## Rounding and accumulated error

A calculation rounds when its exact result cannot fit in the chosen format. For a correctly rounded basic operation in round-to-nearest mode, the error is at most half the spacing between adjacent representable values near that result. Exact results need no rounding.

For example, binary32 values between 1 and 2 are spaced `2^-23` apart. Binary64 spacing in that interval is `2^-52`. The spacing changes with magnitude, so an absolute error bound at this scale does not apply to every signal level.

There is no rule that each operation loses one bit or adds 6 dB of noise. Errors can reinforce or cancel each other, and later calculations can amplify them. Feedback, accumulated state and subtraction of nearly equal values need particular care. Counting operations alone cannot predict the final error or whether it will be audible. See Goldberg's [discussion of rounding error](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html).

## Choosing precision

Both builds can run in real time or render to a file. Double precision can help calculations that are sensitive to rounding. It does not guarantee better sound for every instrument or correct an unstable algorithm.

The speed difference depends on the processor, compiler, opcodes and workload. A 64-bit CPU does not imply that double-precision processing is faster. Single-precision arrays use half the sample storage, which can matter for large tables and buffers. Measure CPU use and check numerical results with the instruments and hardware you plan to use.

## Audio files

Choose the output sample format separately from the internal precision. For example, a double-precision build can write a 16-bit PCM or 32-bit floating-point file. Converting to a lower-precision output format can introduce another rounding step. Choosing a wider file format cannot restore precision already lost during processing. See [soundfile output options](../invoke/cs-options-by-category.md).

## Further reading

The [March 2019 mailing-list discussion](https://ml.csound.1bpm.net/mailinglist.csound/thread/12301) by Robin Gareus and Steven Yi explains why fixed operation-count and speed claims are unsuitable for this topic.
