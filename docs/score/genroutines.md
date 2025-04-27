# GEN Routines

GEN routines are used as data generators for function tables. When a function table is created using the [ftgen opcode](../opcodes/ftgen.md) or the [f score statement](../scoregens/f.md), the GEN function is given as its fourth argument. A negative GEN number implies that the function is not rescaled, and maintains its original values.

## Sine/Cosine Generators:

* [GEN09](../scoregens/gen09.md) - Composite waveforms made up of weighted sums of simple sinusoids.
* [GEN10](../scoregens/gen10.md) - Composite waveforms made up of weighted sums of simple sinusoids.
* [GEN11](../scoregens/gen11.md) - Additive set of cosine partials.
* [GEN19](../scoregens/gen19.md) - Composite waveforms made up of weighted sums of simple sinusoids.
* [GEN30](../scoregens/gen30.md) - Generates harmonic partials by analyzing an existing table.
* [GEN33](../scoregens/gen33.md) - Generate composite waveforms by mixing simple sinusoids.
* [GEN34](../scoregens/gen34.md) - Generate composite waveforms by mixing simple sinusoids.

## Line/Exponential Segment Generators:

* [GEN05](../scoregens/gen05.md) - Constructs functions from segments of exponential curves.
* [GEN06](../scoregens/gen06.md) - Generates a function comprised of segments of cubic polynomials.
* [GEN07](../scoregens/gen07.md) - Constructs functions from segments of straight lines.
* [GEN08](../scoregens/gen08.md) - Generate a piecewise cubic spline curve.
* [GEN16](../scoregens/gen16.md) - Creates a table from a starting value to an ending value.
* [GEN25](../scoregens/gen25.md) - Construct functions from segments of exponential curves in breakpoint fashion.
* [GEN27](../scoregens/gen27.md) - Construct functions from segments of straight lines in breakpoint fashion.

## File Access GEN Routines:

* [GEN01](../scoregens/gen01.md) - Transfers data from a soundfile into a function table.
* [GEN23](../scoregens/gen23.md) - Reads numeric values from a text file.
* [GEN28](../scoregens/gen28.md) - Reads a text file which contains a time-tagged trajectory.
* [GEN43](../scoregens/gen43.md) - Loads a PVOCEX file containing a PV analysis.
* [GEN49](../scoregens/gen49.md) - Transfers data from an MP3 soundfile into a function table.

## Numeric Value Access GEN Routines

* [GEN02](../scoregens/gen02.md) - Transfers data from immediate pfields into a function table.
* [GEN17](../scoregens/gen17.md) - Creates a step function from given x-y pairs.
* [GEN44](../scoregens/gen44.md) - Creates a stifness matrix for scan/scanu.
* [GEN52](../scoregens/gen52.md) - Creates an interleaved multichannel table from the specified source tables, in the format expected by the _ftconv_ opcode.

## Window Function GEN Routines

* [GEN20](../scoregens/gen20.md) - Generates functions of different windows.

## Random Function GEN Routines

* [GEN21](../scoregens/gen21.md) - Generates tables of different random distributions.
* [GEN40](../scoregens/gen40.md) - Generates a random distribution using a distribution histogram.
* [GEN41](../scoregens/gen41.md) - Generates a random list of numerical pairs.
* [GEN42](../scoregens/gen42.md) - Generates a random distribution of discrete ranges of values.

## Waveshaping GEN Routines

* [GEN03](../scoregens/gen03.md) - Generates a stored function table by evaluating a polynomial.
* [GEN13](../scoregens/gen13.md) - Stores a polynomial whose coefficients derive from the Chebyshev polynomials of the first kind.
* [GEN14](../scoregens/gen14.md) - Stores a polynomial whose coefficients derive from Chebyshevs of the second kind.
* [GEN15](../scoregens/gen15.md) - Creates two tables of stored polynomial functions.

## Amplitude Scaling GEN Routines

* [GEN04](../scoregens/gen04.md) - Generates a normalizing function.
* [GEN12](../scoregens/gen12.md) - Generates the log of a modified Bessel function of the second kind.
* [GEN24](../scoregens/gen24.md) - Reads numeric values from another allocated function-table and rescales them.

## Mixing GEN Routines

* [GEN18](../scoregens/gen18.md) - Writes composite waveforms made up of pre-existing waveforms.
* [GEN31](../scoregens/gen31.md) - Mixes any waveform specified in an existing table.
* [GEN32](../scoregens/gen32.md) -  Mixes any waveform, resampled with either FFT or linear interpolation.

## Pitch and Tuning GEN Routines
* [GEN51](../scoregens/gen51.md) - fills a table with a fully customized micro-tuning scale, in the manner of Csound opcodes _cpstun_, _cpstuni_ and _cpstmid_.

## Impulse Response Routine
* [GEN53](../scoregens/gen53.md) - creates a linear-phase or minimum-phase impulse response table from a source table containing a frequency response or an impulse response.

## Named GEN Routines

Csound's GEN routines can be extended with GEN function plugins. There is currently a simple GEN plugin that provides exponential and hyperbolic tangent functions, and the sone function. There is also a generator called farey for the Farey sequence operations, and a Bézier curve generator. These GEN functions are not called by number, but by name.

* ["tanh"](../scoregens/gentanh.md) - fills a table from a hyperbolic tangent formula.
* ["exp"](../scoregens/genexp.md) - fills a table from an exponential formula.
* ["sone"](../scoregens/gensone.md) - fills a table from a sone function formula.
* ["farey"](../scoregens/genfarey.md) - fills a table from a Farey sequence.
* ["quadbezier"](../scoregens/genquadbezier.md) - fills a table with a quadratic Bézier curve.
* ["wave"](../scoregens/genwave.md) - fills a table from a wavelet transform.
* ["padsynth"](../scoregens/genpadsynth.md) - fills a table using the padsynth algorithm.
