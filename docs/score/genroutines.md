# **GEN Routines**

GEN routines are used as data generators for function tables. When a function table is created using the [f score statement](../../scoregens/f), the GEN function is given as its fourth argument. A negative GEN number implies that the function is not rescaled, and maintains its original values.

## Sine/Cosine Generators:

* [GEN09](../../scoregens/gen09) - Composite waveforms made up of weighted sums of simple sinusoids.
* [GEN10](../../scoregens/gen10) - Composite waveforms made up of weighted sums of simple sinusoids.
* [GEN11](../../scoregens/gen11) - Additive set of cosine partials.
* [GEN19](../../scoregens/gen19) - Composite waveforms made up of weighted sums of simple sinusoids.
* [GEN30](../../scoregens/gen30) - Generates harmonic partials by analyzing an existing table.
* [GEN33](../../scoregens/gen33) - Generate composite waveforms by mixing simple sinusoids.
* [GEN34](../../scoregens/gen34) - Generate composite waveforms by mixing simple sinusoids.

## Line/Exponential Segment Generators:

* [GEN05](../../scoregens/gen05) - Constructs functions from segments of exponential curves.
* [GEN06](../../scoregens/gen06) - Generates a function comprised of segments of cubic polynomials.
* [GEN07](../../scoregens/gen07) - Constructs functions from segments of straight lines.
* [GEN08](../../scoregens/gen08) - Generate a piecewise cubic spline curve.
* [GEN16](../../scoregens/gen16) - Creates a table from a starting value to an ending value.
* [GEN25](../../scoregens/gen25) - Construct functions from segments of exponential curves in breakpoint fashion.
* [GEN27](../../scoregens/gen27) - Construct functions from segments of straight lines in breakpoint fashion.

## File Access GEN Routines:

* [GEN01](../../scoregens/gen01) -  Transfers data from a soundfile into a function table.
* [GEN23](../../scoregens/gen23) - Reads numeric values from a text file.
* [GEN28](../../scoregens/gen28) -  Reads a text file which contains a time-tagged trajectory.
* [GEN43](../../scoregens/gen43) - Loads a PVOCEX file containing a PV analysis.
* [GEN49](../../scoregens/gen49) - Transfers data from an MP3 soundfile into a function table.

## Numeric Value Access GEN Routines

* [GEN02](../../scoregens/gen02) -  Transfers data from immediate pfields into a function table.
* [GEN17](../../scoregens/gen17) - Creates a step function from given x-y pairs.
* [GEN44](../../scoregens/gen44) - Creates a stifness matrix for scan/scanu.
* [GEN52](../../scoregens/gen52) - Creates an interleaved multichannel table from the specified source tables, in the format expected by the _ftconv_ opcode.

## Window Function GEN Routines

* [GEN20](../../scoregens/gen20) -  Generates functions of different windows.

## Random Function GEN Routines

* [GEN21](../../scoregens/gen21) -  Generates tables of different random distributions.
* [GEN40](../../scoregens/gen40) - Generates a random distribution using a distribution histogram.
* [GEN41](../../scoregens/gen41) -  Generates a random list of numerical pairs.
* [GEN42](../../scoregens/gen42) - Generates a random distribution of discrete ranges of values.

## Waveshaping GEN Routines

* [GEN03](../../scoregens/gen03) -  Generates a stored function table by evaluating a polynomial.
* [GEN13](../../scoregens/gen13) - Stores a polynomial whose coefficients derive from the Chebyshev polynomials of the first kind.
* [GEN14](../../scoregens/gen14) -  Stores a polynomial whose coefficients derive from Chebyshevs of the second kind.
* [GEN15](../../scoregens/gen15) - Creates two tables of stored polynomial functions.

## Amplitude Scaling GEN Routines

* [GEN04](../../scoregens/gen04) -  Generates a normalizing function.
* [GEN12](../../scoregens/gen12) - Generates the log of a modified Bessel function of the second kind.
* [GEN24](../../scoregens/gen24) -  Reads numeric values from another allocated function-table and rescales them.

## Mixing GEN Routines

* [GEN18](../../scoregens/gen18) -  Writes composite waveforms made up of pre-existing waveforms.
* [GEN31](../../scoregens/gen31) - Mixes any waveform specified in an existing table.
* [GEN32](../../scoregens/gen32) -   Mixes any waveform, resampled with either FFT or linear interpolation.

## Pitch and Tuning GEN Routines
* [GEN51](../../scoregens/gen51) - fills a table with a fully customized micro-tuning scale, in the manner of Csound opcodes _cpstun_, _cpstuni_ and _cpstmid_.

## Named GEN Routines

Csound's GEN routines can be extended with GEN function plugins. There is currently a simple GEN plugin that provides exponential and hyperbolic tangent functions, and the sone function. There is also a generator called farey for the Farey sequence operations, and a Bézier curve generator. These GEN functions are not called by number, but by name.

* ["tanh"](../../scoregens/gentanh) - fills a table from a hyperbolic tangent formula.
* ["exp"](../../scoregens/genexp) - fills a table from an exponential formula.
* ["sone"](../../scoregens/gensone) - fills a table from a sone function formula.
* ["farey"](../../scoregens/genfarey) - fills a table from a Farey sequence.
* ["quadbezier"](../../scoregens/genquadbezier) - fills a table with a quadratic Bézier curve.
* ["wave"](../../scoregens/genwave) - fills a table from a wavelet transform.
* ["padsynth"](../../scoregens/genpadsynth) - fills a table using the padsynth algorithm.
