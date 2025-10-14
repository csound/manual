<!-- Don't modify this file.
 It is generated automatically by makeAppendices.py-->
# **Orchestra Opcodes and Operators**

[!=](../opcodes/notequal.md) - Determines if one value is not equal to another.<br>
[!](../opcodes/opnot.md) - Logical NOT operator.<br>
[&amp;&amp;](../opcodes/opand.md) - Logical AND operator.<br>
[&amp;](../opcodes/opbitand.md) - Bitwise AND operator.<br>
[&ast;](../opcodes/multiplies.md) - Multiplication operator.<br>
[&circ;](../opcodes/raises.md) - &#8220;Power of&#8221; operator.<br>
[&dollar;NAME](../opcodes/dollar.md) - Calls a defined macro.<br>
[&gt;&gt;](../opcodes/opbitshr.md) - Bitshift right operator.<br>
[&gt;=](../opcodes/greaterequal.md) - Determines if one value is greater than or equal to another.<br>
[&gt;](../opcodes/greaterthan.md) - Determines if one value is greater than another.<br>
[&lt;&lt;](../opcodes/opbitshl.md) - Bitshift left operator.<br>
[&lt;=](../opcodes/lessequal.md) - Determines if one value is less than or equal to another.<br>
[&lt;](../opcodes/lessthan.md) - Determines if one value is less than another.<br>
[&num;define](../opcodes/define.md) - Defines a macro.<br>
[&num;ifdef](../opcodes/ifdef.md) - Conditional reading of code.<br>
[&num;ifndef](../opcodes/ifndef.md) - Conditional reading of code.<br>
[&num;include](../opcodes/include.md) - Includes an external file for processing.<br>
[&num;undef](../opcodes/undef.md) - Un-defines a macro.<br>
[&percnt;](../opcodes/modulus.md) - Modulus operator.<br>
[&sol;](../opcodes/divides.md) - Division operator.<br>
[&verbar;&verbar;](../opcodes/opor.md) - Logical OR operator.<br>
[&verbar;](../opcodes/opbitor.md) - Bitwise OR operator.<br>
[+=](../opcodes/plusbecomes.md) - Performs add and assignment.<br>
[+](../opcodes/adds.md) - Addition operator.<br>
[-](../opcodes/subtracts.md) - Subtraction operator.<br>
[0dbfs](../opcodes/0dbfs.md) - Sets the value of 0 decibels using full scale amplitude.<br>
[==](../opcodes/equals.md) - Compares two values for equality.<br>
[=](../opcodes/assign.md) - Performs a simple assignment.<br>
[A4](../opcodes/A4.md) - Sets the base frequency for pitch A4.<br>
[ATSadd](../opcodes/ATSadd.md) - Uses the data from an ATS analysis file to perform additive synthesis using an internal array of interpolating oscillators.<br>
[ATSaddnz](../opcodes/ATSaddnz.md) - Uses the data from an ATS analysis file to perform noise resynthesis using a modified randi function.<br>
[ATSbufread](../opcodes/ATSbufread.md) - Reads data from and ATS data file and stores it in an internal data table of frequency, amplitude pairs.<br>
[ATScross](../opcodes/ATScross.md) - _ATScross_ uses data from an ATS analysis file and data from an [ATSbufread](../opcodes/ATSbufread.md) to perform cross synthesis.<br>
[ATSinfo](../opcodes/ATSinfo.md) - Reads data out of the header of an ATS file.<br>
[ATSinterpread](../opcodes/ATSinterpread.md) - Allows a user to determine the frequency envelope of any [ATSbufread](../opcodes/ATSbufread.md).<br>
[ATSpartialtap](../opcodes/ATSpartialtap.md) - Returns a frequency, amplitude pair from an [ATSbufread](../opcodes/ATSbufread.md) opcode.<br>
[ATSread](../opcodes/ATSread.md) - Reads data from an ATS file.<br>
[ATSreadnz](../opcodes/ATSreadnz.md) - reads data from an ATS file.<br>
[ATSsinnoi](../opcodes/ATSsinnoi.md) - _ATSsinnoi_ reads data from an ATS data file and uses the information to synthesize sines and noise together.<br>
[K35_hpf](../opcodes/k35_hpf.md) - Zero-delay feedback implementation of Korg35 resonant high-pass filter.<br>
[K35_lpf](../opcodes/k35_lpf.md) - Zero-delay feedback implementation of Korg35 resonant low-pass filter.<br>
[MixerClear](../opcodes/mixerclear.md) - Resets all channels of a buss to 0.<br>
[MixerGetLevel](../opcodes/mixergetlevel.md) - Gets the level at which signals from the send are being added to the buss.<br>
[MixerReceive](../opcodes/mixerreceive.md) - Receives an arate signal that has been mixed onto a channel of a buss.<br>
[MixerSend](../opcodes/mixersend.md) - Mixes an arate signal into a channel of a buss.<br>
[MixerSetLevel](../opcodes/mixersetlevel.md) - Sets the level at which signals from the send are added to the buss.<br>
[MixerSetLevel_i](../opcodes/mixersetlevel_i.md) - Sets the level at which signals from the send are added to the buss.<br>
[OSCbundle](../opcodes/OSCbundle.md) - Sends data to other processes using the OSC protocol by packing messages in a bundle.<br>
[OSCcount](../opcodes/OSCcount.md) - Gives the Count of OSC messages currently unread but received by the current listeners.<br>
[OSCinitM](../opcodes/OSCinitM.md) - Start a multicast listening process to a particular port, which can be used by OSClisten.<br>
[OSCinit](../opcodes/OSCinit.md) - Start a listening process for OSC messages to a particular port.<br>
[OSClisten](../opcodes/OSClisten.md) - Listen for OSC messages to a particular path, either from a custom-defined OSC server or from the Csound UDP server.<br>
[OSCraw](../opcodes/OSCraw.md) - Listen for all OSC messages at a given port.<br>
[OSCsend](../opcodes/OSCsend.md) - Sends data to other listening processes using the OSC protocol.<br>
[S](../opcodes/ops.md) - Returns a string containg the numeric value of its argument.<br>
[\#](../opcodes/opnonequiv.md) - Bitwise NON EQUIVALENCE operator.<br>
[a](../opcodes/opa.md) - Converts a k-sig or k-array parameter to an a-sig output.<br>
[abs](../opcodes/abs.md) - Returns the absolute value of its input.<br>
[active](../opcodes/active.md) - Returns the number of active instances of an instrument with options to ignore releasing instances.<br>
[adsr](../opcodes/adsr.md) - Calculates the classical ADSR envelope using linear segments.<br>
[adsyn](../opcodes/adsyn.md) - Output is an additive set of individually controlled sinusoids, using an oscillator bank.<br>
[adsynt2](../opcodes/adsynt2.md) - Performs additive synthesis with an arbitrary number of partials, not necessarily harmonic.<br>
[adsynt](../opcodes/adsynt.md) - Performs additive synthesis with an arbitrary number of partials, not necessarily harmonic.<br>
[aftouch](../opcodes/aftouch.md) - Get the current after-touch value for this channel.<br>
[allpole](../opcodes/allpole.md) - Allpole filter implementation using direct convolution.<br>
[alpass](../opcodes/alpass.md) - Reverberates an input signal with a flat frequency response.<br>
[alwayson](../opcodes/alwayson.md) - Activates the indicated instrument in the orchestra header, without need for an i statement.<br>
[ampdb](../opcodes/ampdb.md) - Returns the amplitude equivalent of the decibel value x.<br>
[ampdbfs](../opcodes/ampdbfs.md) - Returns the amplitude equivalent (in 16-bit signed integer scale) of the full scale decibel (dB FS) value _x_.<br>
[ampmidi](../opcodes/ampmidi.md) - Get the velocity of the current MIDI event.<br>
[ampmidicurve](../opcodes/ampmidicurve.md) - Maps an input MIDI velocity number to an output gain factor with a maximum value of 1, modifying the output gain by a dynamic range and a shaping exponent.<br>
[ampmidid](../opcodes/ampmidid.md) - Musically map MIDI velocity to peak amplitude within a specified dynamic range in decibels.<br>
[apoleparams](../opcodes/apoleparams.md) - Extracts allpole filter parameters from coefficients.<br>
[arduinoReadF](../opcodes/arduinoReadF.md) - Read integer data from an arduino port using the Csound-Arduino protocol.<br>
[arduinoRead](../opcodes/arduinoRead.md) - Read integer data from an arduino port using the Csound-Arduino protocol.<br>
[arduinoStart](../opcodes/arduinoStart.md) - Open a serial port for use with the Arduino protocol.<br>
[arduinoStop](../opcodes/arduinoStop.md) - Close a serial port using Arduino protocol.<br>
[areson](../opcodes/areson.md) - A notch filter whose transfer functions are the complements of the reson opcode.<br>
[aresonk](../opcodes/aresonk.md) - A notch filter whose transfer functions are the complements of the reson opcode.<br>
[arg](../opcodes/arg.md) - Returns the argument of a complex number.<br>
[array](../opcodes/array.md) - Converts an input into an array, optionally creating it.<br>
[atone](../opcodes/atone.md) - A hi-pass filter whose transfer functions are the complements of the [tone](../opcodes/tone.md) opcode.<br>
[atonek](../opcodes/atonek.md) - A hi-pass filter whose transfer functions are the complements of the [tonek](../opcodes/tonek.md) opcode.<br>
[atonex](../opcodes/atonex.md) - Emulates a stack of filters using the atone opcode.<br>
[autocorr](../opcodes/autocorr.md) - This opcode takes in an input array and computes its autocorrelation.<br>
[babo](../opcodes/babo.md) - A physical model reverberator.<br>
[balance2](../opcodes/balance2.md) - Adjust one audio signal according to the values of another.<br>
[balance](../opcodes/balance.md) - Adjust one audio signal according to the values of another.<br>
[bamboo](../opcodes/bamboo.md) - Semi-physical model of a bamboo sound.<br>
[barmodel](../opcodes/barmodel.md) - Creates a tone similar to a struck metal bar.<br>
[bbcutm](../opcodes/bbcutm.md) - Generates breakbeat-style cut-ups of a mono audio stream.<br>
[bbcuts](../opcodes/bbcuts.md) - Generates breakbeat-style cut-ups of a stereo audio stream.<br>
[betarand](../opcodes/betarand.md) - Beta distribution random number generator (positive values only).<br>
[bexprnd](../opcodes/bexprnd.md) - Exponential distribution random number generator.<br>
[bformdec1](../opcodes/bformdec1.md) - Decodes an ambisonic B format signal into loudspeaker specific signals.<br>
[bformdec2](../opcodes/bformdec2.md) - Decodes an Ambisonics B format signal into loudspeaker specific signals, with dual--band decoding and near--field compensation.<br>
[bformenc1](../opcodes/bformenc1.md) - Codes a signal into the ambisonic B format.<br>
[binit](../opcodes/binit.md) - PVS tracks to amplitude+frequency conversion.<br>
[biquad](../opcodes/biquad.md) - A sweepable general purpose biquadratic digital filter.<br>
[biquada](../opcodes/biquada.md) - A sweepable general purpose biquadratic digital filter with a-rate parameters.<br>
[birnd](../opcodes/birnd.md) - Returns a random number in a bi-polar range.<br>
[bob](../opcodes/bob.md) - Runge-Kutte numerical simulation of the Moog analog resonant filter.<br>
[bpf](../opcodes/bpf.md) - Break point function with linear interpolation.<br>
[bpfcos](../opcodes/bpfcos.md) - Break point function with cosine (easy-in/easy-out) interpolation.<br>
[bqrez](../opcodes/bqrez.md) - A second-order multi-mode filter.<br>
[break](../opcodes/break.md) - A syntactic looping construction used in for, while, and until loops.<br>
[butbp](../opcodes/butbp.md) - Same as the [butterbp](../opcodes/butterbp.md) opcode.<br>
[butbr](../opcodes/butbr.md) - Same as the [butterbr](../opcodes/butterbr.md) opcode.<br>
[buthp](../opcodes/buthp.md) - Same as the [butterhp](../opcodes/butterhp.md) opcode.<br>
[butlp](../opcodes/butlp.md) - Same as the [butterlp](../opcodes/butterlp.md) opcode.<br>
[butterbp](../opcodes/butterbp.md) - A band-pass Butterworth filter.<br>
[butterbr](../opcodes/butterbr.md) - A band-reject Butterworth filter.<br>
[butterhp](../opcodes/butterhp.md) - A high-pass Butterworth filter.<br>
[butterlp](../opcodes/butterlp.md) - A low-pass Butterworth filter.<br>
[button](../opcodes/button.md) - Sense on-screen controls.<br>
[buzz](../opcodes/buzz.md) - Output is a set of harmonically related sine partials.<br>
[c2r](../opcodes/c2r.md) - Real to complex format conversion.<br>
[cabasa](../opcodes/cabasa.md) - Semi-physical model of a cabasa sound.<br>
[cauchy](../opcodes/cauchy.md) - Cauchy distribution random number generator.<br>
[cauchyi](../opcodes/cauchyi.md) - Cauchy distribution random number generator with interpolation between values.<br>
[cbrt](../opcodes/cbrt.md) - Cubic root function.<br>
[ceil](../opcodes/ceil.md) - Returns the smallest integer not less than *x*.<br>
[cell](../opcodes/cell.md) - Cellular Automaton.<br>
[cent](../opcodes/cent.md) - Calculates a factor to raise/lower a frequency by a given amount of cents.<br>
[centroid](../opcodes/centroid.md) - Calculate the spectral centroid of an audio signal on a given trigger.<br>
[ceps](../opcodes/ceps.md) - Calculate the cepstrum of an array input, optionally filtering coefficients.<br>
[cepsinv](../opcodes/cepsinv.md) - Calculate the inverse cepstrum of an array.<br>
[cggoto](../opcodes/cggoto.md) - Conditionally transfer control to _label_ on every pass.<br>
[chanctrl](../opcodes/chanctrl.md) - Get the current value of a MIDI channel controller and optionally map it onto specified range.<br>
[changed2](../opcodes/changed2.md) - k-rate signal change detector.<br>
[changed](../opcodes/changed.md) - k-rate signal change detector.<br>
[chani](../opcodes/chani.md) - Reads data from a channel of the inward software bus.<br>
[chano](../opcodes/chano.md) - Send data to a channel of the outward software bus.<br>
[chebyshevpoly](../opcodes/chebyshevpoly.md) - Efficiently evaluates the sum of Chebyshev polynomials of arbitrary order.<br>
[checkbox](../opcodes/checkbox.md) - Sense on-screen controls.<br>
[chn](../opcodes/chn.md) - Declare a channel of the named software bus.<br>
[chnclear](../opcodes/chnclear.md) - Clears a number of audio output channel of the named software bus.<br>
[chnexport](../opcodes/chnexport.md) - Export a global variable as a channel of the bus.<br>
[chnget](../opcodes/chnget.md) - Reads data from a channel of the inward named software bus.<br>
[chnmix](../opcodes/chnmix.md) - Writes audio data to the named software bus, mixing to the previous output.<br>
[chnparams](../opcodes/chnparams.md) - Query parameters of a channel (if it does not exist, all returned values are zero).<br>
[chnset](../opcodes/chnset.md) - Writes data to a channel of the named software bus.<br>
[cigoto](../opcodes/cigoto.md) - During the i-time pass only, conditionally transfer control to the statement labeled by _label_.<br>
[ckgoto](../opcodes/ckgoto.md) - During the p-time passes only, conditionally transfer control to the statement labeled by _label_.<br>
[clear](../opcodes/clear.md) - Zeroes a list of audio signals.<br>
[clfilt](../opcodes/clfilt.md) - Implements the classical standard analog filter types: low-pass and high-pass.<br>
[clip](../opcodes/clip.md) - Clips an a-rate signal to a predefined limit, in a &#8220;soft&#8221; manner, using one of three methods.<br>
[clockoff](../opcodes/clockoff.md) - Stops one of a number of internal clocks.<br>
[clockon](../opcodes/clockon.md) - Starts one of a number of internal clocks.<br>
[cmp](../opcodes/cmp.md) - Compares audio signals or arrays.<br>
[cmplxprod](../opcodes/cmplxprod.md) - Complex  product of two arrays of the same size and in real-imaginary interleaved format.<br>
[cngoto](../opcodes/cngoto.md) - Transfers control on every pass when the condition is _not_ true.<br>
[cntCreate](../opcodes/cntcreate.md) - Create a counter object.<br>
[cntCycles](../opcodes/cntcycles.md) - Get the number of times a counter has cycled.<br>
[cntDelete](../opcodes/cntDelete.md) - Delete a counter and render any memory used.<br>
[cntDelete_i](../opcodes/cntDelete_i.md) - Delete a counter.<br>
[cntRead](../opcodes/cntread.md) - Read current value of a counter object without changing it.<br>
[cntReset](../opcodes/cntreset.md) - Resets a counter object to its initial state.<br>
[cntState](../opcodes/cntstate.md) - Gives the range and increment of a counter.<br>
[comb](../opcodes/comb.md) - Reverberates an input signal with a &#8220;colored&#8221; frequency response.<br>
[combinv](../opcodes/combinv.md) - Reverberates an input signal with a &#8220;colored&#8221; frequency response.<br>
[compilecsd](../opcodes/compilecsd.md) - Compiles a new orchestra from an ASCII file.<br>
[compileorc](../opcodes/compileorc.md) - Compiles a new orchestra from an ASCII file.<br>
[compilestr](../opcodes/compilestr.md) - Compiles a new orchestra passed in as an ASCII string.<br>
[compress2](../opcodes/compress2.md) - Compress, limit, expand, duck or gate an audio signal.<br>
[compress](../opcodes/compress.md) - Compress, limit, expand, duck or gate an audio signal.<br>
[conj](../opcodes/complex.md) - Returns a complex number, optionally in polar form.<br>
[conj](../opcodes/conj.md) - Returns the conjugate of a complex number.<br>
[connect](../opcodes/connect.md) - Connects a source outlet to a sink inlet.<br>
[continue](../opcodes/continue.md) - A syntactic looping construction used in for, while, and until loops.<br>
[control](../opcodes/control.md) - Configurable slider controls for realtime user input.<br>
[convle](../opcodes/convle.md) - Same as the [convolve](../opcodes/convolve.md) opcode.<br>
[convolve](../opcodes/convolve.md) - Convolves a signal and an impulse response.<br>
[copya2ftab](../opcodes/copya2ftab.md) - The _copya2ftab_ opcode takes a k-array and copies the contents to an f-table.<br>
[copyf2array](../opcodes/copyf2array.md) - The _copyf2array_ opcode takes an f-table and copies the contents to a t-var.<br>
[cos](../opcodes/cos.md) - Returns the cosine of _x_ (_x_ in radians).<br>
[cosh](../opcodes/cosh.md) - Returns the hyperbolic cosine of _x_ (_x_ in radians).<br>
[cosinv](../opcodes/cosinv.md) - Returns the arccosine of _x_ (_x_ in radians).<br>
[cosseg](../opcodes/cosseg.md) - Trace a series of line segments between specified points with cosine interpolation.<br>
[cossegb](../opcodes/cossegb.md) - Trace a series of line segments between specified absolute points with
cosine interpolation.<br>
[cossegr](../opcodes/cossegr.md) - Trace a series of line segments between specified points with
cosine interpolation, including a release segment.<br>
[count](../opcodes/count.md) - Get the next value from a counter.<br>
[count_i](../opcodes/count_i.md) - Get the next value from a counter.<br>
[cps2pch](../opcodes/cps2pch.md) - Converts a pitch-class value into cycles-per-second (Hz) for equal divisions of the octave.<br>
[cpsmidi](../opcodes/cpsmidi.md) - Get the note number of the current MIDI event, expressed in cycles-per-second.<br>
[cpsmidib](../opcodes/cpsmidib.md) - Get the note number of the current MIDI event and modify it by the current pitch-bend value, express it in cycles-per-second.<br>
[cpsmidinn](../opcodes/cpsmidinn.md) - Converts a Midi note number value to cycles-per-second.<br>
[cpsoct](../opcodes/cpsoct.md) - Converts an octave-point-decimal value to cycles-per-second.<br>
[cpspch](../opcodes/cpspch.md) - Converts a pitch-class value to cycles-per-second.<br>
[cpstmid](../opcodes/cpstmid.md) - Get a MIDI note number (allows customized micro-tuning scales).<br>
[cpstun](../opcodes/cpstun.md) - Returns micro-tuning values at k-rate.<br>
[cpstuni](../opcodes/cpstuni.md) - Returns micro-tuning values at init-rate.<br>
[cpsxpch](../opcodes/cpsxpch.md) - Converts a pitch-class value into cycles-per-second (Hz) for equal divisions of any interval.<br>
[cpumeter](../opcodes/cpumeter.md) - Reports the usage of cpu either total or per core to monitor how close to max-out the processing is.<br>
[cpuprc](../opcodes/cpuprc.md) - Control allocation of cpu resources on a per-instrument basis, to optimize realtime output.<br>
[create](../opcodes/create.md) - Creates a new instrument definition, instrument instance, or opcode object.<br>
[cross2](../opcodes/cross2.md) - Cross synthesis using FFT's.<br>
[crossfm](../opcodes/crossfm.md) - Two oscillators, mutually frequency and/or phase modulated by each other.<br>
[crunch](../opcodes/crunch.md) - Semi-physical model of a crunch sound.<br>
[ctrl14](../opcodes/ctrl14.md) - Allows a floating-point 14-bit MIDI signal scaled with a minimum and a maximum range.<br>
[ctrl21](../opcodes/ctrl21.md) - Allows a floating-point 21-bit MIDI signal scaled with a minimum and a maximum range.<br>
[ctrl7](../opcodes/ctrl7.md) - Allows a floating-point 7-bit MIDI signal scaled with a minimum and a maximum range.<br>
[ctrlinit](../opcodes/ctrlinit.md) - Sets the initial values for a set of MIDI controllers.<br>
[ctrlpreset](../opcodes/ctrlpreset.md) - Defines a preset for MIDI controllers.<br>
[ctrlprint](../opcodes/ctrlprint.md) - Print the saved values of MIDI controllers from an array to the console or a file.<br>
[ctrlprintpresets](../opcodes/ctrlprintpresets.md) - Prints the current collection of presets for MIDI controllers in a format that can be used in an orchestra, to the console or a file.<br>
[ctrlsave](../opcodes/ctrlsave.md) - Recovers the current values of MIDI controllers to a k-array.<br>
[ctrlselect](../opcodes/ctrlselect.md) - Loads a preset of values for MIDI controllers from a previous ctrlpreset call.<br>
[cuserrnd](../opcodes/cuserrnd.md) - Continuous USER-defined-distribution RaNDom generator.<br>
[dam](../opcodes/dam.md) - A dynamic compressor/expander.<br>
[date](../opcodes/date.md) - Returns the number seconds since a base date, using the operating system's clock.<br>
[dates](../opcodes/dates.md) - Returns as a string the date and time specified.<br>
[db](../opcodes/db.md) - Returns the amplitude equivalent for a given decibel amount.<br>
[dbamp](../opcodes/dbamp.md) - Returns the decibel equivalent of the raw amplitude _x_.<br>
[dbfsamp](../opcodes/dbfsamp.md) - Returns the decibel equivalent of the raw amplitude _x_, relative to full scale amplitude.<br>
[dcblock2](../opcodes/dcblock2.md) - Implements a DC blocking filter with improved DC attenuation.<br>
[dcblock](../opcodes/dcblock.md) - Implements the DC blocking filter.<br>
[dconv](../opcodes/dconv.md) - A direct convolution opcode.<br>
[dct](../opcodes/dct.md) - Discrete Cosine Transform of a sample array (type-II DCT).<br>
[dctinv](../opcodes/dctinv.md) - Inverse Discrete Cosine Transform of a sample array (type-III DCT).<br>
[deinterleave](../opcodes/deinterleave.md) - Deinterleaves arrays by picking alternate data from its input.<br>
[delay1](../opcodes/delay1.md) - Delays an input signal by one sample.<br>
[delay](../opcodes/delay.md) - Delays an input signal by some time interval.<br>
[delayk](../opcodes/delayk.md) - Delays an input signal by some time interval.<br>
[delayr](../opcodes/delayr.md) - Reads from an automatically established digital delay line.<br>
[delayw](../opcodes/delayw.md) - Writes the audio signal to a digital delay line.<br>
[deltap3](../opcodes/deltap3.md) - Taps a delay line at variable offset times, uses cubic interpolation.<br>
[deltap](../opcodes/deltap.md) - Taps a delay line at variable offset times.<br>
[deltapi](../opcodes/deltapi.md) - Taps a delay line at variable offset times, uses interpolation.<br>
[deltapn](../opcodes/deltapn.md) - Taps a delay line at variable offset times.<br>
[deltapx](../opcodes/deltapx.md) - Read from or write to a delay line with interpolation.<br>
[deltapxw](../opcodes/deltapxw.md) - Mixes the input signal to a delay line.<br>
[denorm](../opcodes/denorm.md) - Mixes low level (~1e-20 for floats, and ~1e-56 for doubles) noise to a list of a-rate signals.<br>
[diff](../opcodes/diff.md) - Modify a signal by differentiation.<br>
[diode_ladder](../opcodes/diode_ladder.md) - Zero-delay feedback implementation of a 4 pole (24 dB/oct) diode low-pass filter.<br>
[directory](../opcodes/directory.md) - Reads a directory and outputs to a string array a list of file names.<br>
[diskgrain](../opcodes/diskgrain.md) - Synchronous granular synthesis, using a soundfile as source.<br>
[diskin2](../opcodes/diskin2.md) - Reads audio data from a file, and can alter its pitch using one of several available interpolation types, as well as convert the sample rate to match the orchestra sr setting.<br>
[diskin](../opcodes/diskin.md) - Reads audio data from an external device or stream and can alter its pitch.<br>
[dispfft](../opcodes/dispfft.md) - Displays the Fourier Transform of an audio or control signal.<br>
[display](../opcodes/display.md) - Displays the audio or control signals as an amplitude vs.<br>
[distort1](../opcodes/distort1.md) - Modified hyperbolic tangent distortion.<br>
[distort](../opcodes/distort.md) - Distort an audio signal via waveshaping and optional clipping.<br>
[divz](../opcodes/divz.md) - Safely divides two numbers.<br>
[doppler](../opcodes/doppler.md) - A fast and robust method for approximating sound propagation, achieving convincing Doppler shifts without having to solve equations.<br>
[dot](../opcodes/dot.md) - Calculates the dot product of two arrays.<br>
[downsamp](../opcodes/downsamp.md) - Modify a signal by down-sampling.<br>
[dripwater](../opcodes/dripwater.md) - Semi-physical model of a water drop.<br>
[dumpk2](../opcodes/dumpk2.md) - Periodically writes two orchestra control-signal values to a named external file in a specific format.<br>
[dumpk3](../opcodes/dumpk3.md) - Periodically writes three orchestra control-signal values to a named external file in a specific format.<br>
[dumpk4](../opcodes/dumpk4.md) - Periodically writes four orchestra control-signal values to a named external file in a specific format.<br>
[dumpk](../opcodes/dumpk.md) - Periodically writes an orchestra control-signal value to a named external file in a specific format.<br>
[duserrnd](../opcodes/duserrnd.md) - Discrete USER-defined-distribution RaNDom generator.<br>
[dust2](../opcodes/dust2.md) - Generates random impulses from -1 to 1.<br>
[dust](../opcodes/dust.md) - Generates random impulses from 0 to 1.<br>
[elapsedcycles](../opcodes/elapsedcycles.md) - Read absolute time, in k-rate cycles, since the start of the performance.<br>
[elapsedtime](../opcodes/elapsedtime.md) - Read absolute time, in seconds, since the start of the performance.<br>
[else](../opcodes/else.md) - Executes a block of code when an "if.<br>
[elseif](../opcodes/elseif.md) - Defines another "if.<br>
[endif](../opcodes/endif.md) - Closes a block of code that begins with an ["if.<br>
[endin](../opcodes/endin.md) - Ends the current instrument block.<br>
[endop](../opcodes/endop.md) - Marks the end of an user-defined opcode block.<br>
[envlpx](../opcodes/envlpx.md) - Applies an envelope consisting of 3 segments.<br>
[envlpxr](../opcodes/envlpxr.md) - The _envlpx_ opcode with a final release segment.<br>
[ephasor](../opcodes/ephasor.md) - Produces two outputs: a periodic phase signal and a periodic exponential decaying signal.<br>
[eqfil](../opcodes/eqfil.md) - Equalizer filter.<br>
[evalstr](../opcodes/evalstr.md) - Evaluates a string containing Csound code, returning a value from the global space (instr 0).<br>
[event](../opcodes/event.md) - Generates a score event from an instrument.<br>
[event_i](../opcodes/event_i.md) - Generates a score event from an instrument.<br>
[eventcycles](../opcodes/eventcycles.md) - Read absolute time in k-rate cycles, since the start of an instance of an instrument.<br>
[eventtime](../opcodes/eventtime.md) - Read absolute time, in seconds, since the start of an instance of an instrument.<br>
[eventtype](../opcodes/eventtype.md) - Returns the event type for an instrument.<br>
[exciter](../opcodes/exciter.md) - A non-linear filter system to excite the signal.<br>
[exitnow](../opcodes/exitnow.md) - Exit Csound as fast as possible, with no cleaning up.<br>
[exp](../opcodes/exp.md) - Returns e raised to the xth power.<br>
[expcurve](../opcodes/expcurve.md) - Generates a normalised exponential curve in range 0 to 1 of arbitrary steepness.<br>
[expon](../opcodes/expon.md) - Trace an exponential curve between specified points.<br>
[exprand](../opcodes/exprand.md) - Exponential distribution random number generator (positive values only).<br>
[exprandi](../opcodes/exprandi.md) - Exponential distribution random number generator with interpolation (positive values only).<br>
[expseg](../opcodes/expseg.md) - Trace a series of exponential segments between specified points.<br>
[expsega](../opcodes/expsega.md) - An exponential segment generator operating at a-rate.<br>
[expsegb](../opcodes/expsegb.md) - Trace a series of exponential segments between specified absolute points.<br>
[expsegba](../opcodes/expsegba.md) - An exponential segment generator operating at a-rate with absolute times.<br>
[expsegr](../opcodes/expsegr.md) - Trace a series of exponential segments between specified points including a release segment.<br>
[fareylen](../opcodes/fareylen.md) - Returns the length of a Farey Sequence.<br>
[fareyleni](../opcodes/fareyleni.md) - Returns the length of a Farey Sequence.<br>
[fft](../opcodes/fft.md) - Complex-to-complex Fast Fourier Transform.<br>
[fftinv](../opcodes/ifft.md) - Complex-to-complex Inverse Fast Fourier Transform.<br>
[ficlose](../opcodes/ficlose.md) - Closes a previously opened file.<br>
[filebit](../opcodes/filebit.md) - Returns the number of bits in each sample in a sound file.<br>
[filelen](../opcodes/filelen.md) - Returns the length of a sound file.<br>
[filenchnls](../opcodes/filenchnls.md) - Returns the number of channels in a sound file.<br>
[filepeak](../opcodes/filepeak.md) - Returns the peak absolute value of a sound file.<br>
[filescal](../opcodes/filescal.md) - Phase-locked vocoder processing with onset detection/processing, 'tempo-scaling'.<br>
[filesr](../opcodes/filesr.md) - Returns the sample rate of a sound file.<br>
[filevalid](../opcodes/filevalid.md) - Checks that a file can be read at initialisation or performance time.<br>
[fillarray](../opcodes/fillarray.md) - Generate a vector (one-dimensional k-rate array) with a sequence of
numeric or string values.<br>
[filter2](../opcodes/filter2.md) - General purpose custom filter.<br>
[fin](../opcodes/fin.md) - Read signals from a file at a-rate.<br>
[fini](../opcodes/fini.md) - Read signals from a file at i-rate.<br>
[fink](../opcodes/fink.md) - Read signals from a file at k-rate.<br>
[fiopen](../opcodes/fiopen.md) - Opens a file in a specific mode.<br>
[flanger](../opcodes/flanger.md) - A user controlled flanger.<br>
[flashtxt](../opcodes/flashtxt.md) - Allows text to be displayed from instruments like sliders etc.<br>
[flooper2](../opcodes/flooper2.md) - Function-table-based crossfading looper.<br>
[flooper](../opcodes/flooper.md) - Function-table-based crossfading looper.<br>
[floor](../opcodes/floor.md) - Returns the largest integer not greater than *x*.<br>
[fmanal](../opcodes/fmanal.md) - AM/FM analysis from quadrature signal.<br>
[fmax](../opcodes/fmax.md) - Returns the maximum of its two arguments.<br>
[fmb3](../opcodes/fmb3.md) - Uses FM synthesis to create a Hammond B3 organ sound.<br>
[fmbell](../opcodes/fmbell.md) - Uses FM synthesis to create a tublar bell sound.<br>
[fmin](../opcodes/fmin.md) - Returns the minimum of its two arguments.<br>
[fmmetal](../opcodes/fmmetal.md) - Uses FM synthesis to create a &#8220;Heavy Metal&#8221; sound.<br>
[fmod](../opcodes/fmod.md) - Computes the remainder of the division of its first argument by the second.<br>
[fmpercfl](../opcodes/fmpercfl.md) - Uses FM synthesis to create a percussive flute sound.<br>
[fmrhode](../opcodes/fmrhode.md) - Uses FM synthesis to create a Fender Rhodes electric piano sound.<br>
[fmvoice](../opcodes/fmvoice.md) - FM Singing Voice Synthesis.<br>
[fmwurlie](../opcodes/fmwurlie.md) - Uses FM synthesis to create a Wurlitzer electric piano sound.<br>
[fof2](../opcodes/fof2.md) - Produces sinusoid bursts including k-rate incremental indexing with each successive burst.<br>
[fof](../opcodes/fof.md) - Produces sinusoid bursts useful for formant and granular synthesis.<br>
[fofilter](../opcodes/fofilter.md) - Formant filter.<br>
[fog](../opcodes/fog.md) - Audio output is a succession of grains derived from data in a stored function table.<br>
[fold](../opcodes/fold.md) - Adds artificial foldover to an audio signal.<br>
[follow2](../opcodes/follow2.md) - Another controllable envelope extractor using the algorithm attributed to Jean-Marc Jot.<br>
[follow](../opcodes/follow.md) - Envelope follower unit generator.<br>
[for](../opcodes/for.md) - A syntactic looping construction.<br>
[foscil](../opcodes/foscil.md) - A basic frequency modulated oscillator.<br>
[foscili](../opcodes/foscili.md) - Basic frequency modulated oscillator with linear interpolation.<br>
[fout](../opcodes/fout.md) - Outputs a-rate signals to a specified file of an arbitrary number of channels.<br>
[fouti](../opcodes/fouti.md) - Outputs i-rate signals of an arbitrary number of channels to a specified file.<br>
[foutir](../opcodes/foutir.md) - Outputs i-rate signals from an arbitrary number of channels to a specified file.<br>
[foutk](../opcodes/foutk.md) - Outputs k-rate signals of an arbitrary number of channels to a specified file, in raw (headerless) format.<br>
[fprintks](../opcodes/fprintks.md) - Similar to [printks](../opcodes/printks.md) but prints to a file.<br>
[fprints](../opcodes/fprints.md) - Similar to [prints](../opcodes/prints.md) but prints to a file.<br>
[frac](../opcodes/frac.md) - Returns the fractional part of a decimal number.<br>
[fractalnoise](../opcodes/fractalnoise.md) - A fractal noise generator.<br>
[framebuffer](../opcodes/framebuffer.md) - Read audio signals into 1 dimensional k-rate arrays and vice-versa with a specified buffer size.<br>
[freeverb](../opcodes/freeverb.md) - Opcode version of Jezar's Freeverb.<br>
[ftaudio](../opcodes/ftaudio.md) - Write a previously-allocated table to an audio file in a variety of formats.<br>
[ftchnls](../opcodes/ftchnls.md) - Returns the number of channels in a stored function table.<br>
[ftconv](../opcodes/ftconv.md) - Low latency multichannel convolution, using a function table as impulse response source.<br>
[ftcps](../opcodes/ftcps.md) - Returns the base frequency of a stored function table in Hz.<br>
[ftexists](../opcodes/ftexists.md) - Query if a given table exists.<br>
[ftfree](../opcodes/ftfree.md) - Deletes function table.<br>
[ftgen](../opcodes/ftgen.md) - Generate a score function table from within the orchestra.<br>
[ftgenonce](../opcodes/ftgenonce.md) - Generate a function table from within an instrument definition, without duplication of data.<br>
[ftgentmp](../opcodes/ftgentmp.md) - Generate a score function table from within the orchestra, which is deleted at the end of the note.<br>
[ftlen](../opcodes/ftlen.md) - Returns the size of a stored function table.<br>
[ftload](../opcodes/ftload.md) - Load a set of previously-allocated tables from a file.<br>
[ftloadk](../opcodes/ftloadk.md) - Load a set of previously-allocated tables from a file.<br>
[ftlptim](../opcodes/ftlptim.md) - Returns the loop segment start-time of a stored function table number.<br>
[ftmorf](../opcodes/ftmorf.md) - Uses an index into a table of ftable numbers to morph between adjacent tables in the list.<br>
[ftom](../opcodes/ftom.md) - Convert frequency to midi note number, taking global value of A4 into account.<br>
[ftprint](../opcodes/ftprint.md) - Print the contents of a table (for debugging).<br>
[ftsamplebank](../opcodes/ftsamplebank.md) - Reads a directory for sound files and loads them to a series of GEN01 function tables.<br>
[ftsave](../opcodes/ftsave.md) - Save a set of previously-allocated tables to a file.<br>
[ftsavek](../opcodes/ftsavek.md) - Save a set of previously-allocated tables to a file.<br>
[ftset](../opcodes/ftset.md) - Sets multiple elements of a table to a given value.<br>
[ftslice](../opcodes/ftslice.md) - Copy a slice from an f-table to another f-table at performance.<br>
[ftslicei](../opcodes/ftslicei.md) - Copy a slice from an f-table to another f-table at init.<br>
[ftsr](../opcodes/ftsr.md) - Returns the sampling-rate of a stored function table.<br>
[gain](../opcodes/gain.md) - Adjusts the amplitude audio signal according to a root-mean-square value.<br>
[gainslider](../opcodes/gainslider.md) - An implementation of a logarithmic gain curve which is similar to the gainslider~ object from Cycling 74 Max / MSP.<br>
[gauss](../opcodes/gauss.md) - Gaussian distribution random number generator.<br>
[gaussi](../opcodes/gaussi.md) - Gaussian distribution random number generator with controlled interpolation between values.<br>
[gausstrig](../opcodes/gausstrig.md) - Random impulses around a certain frequency.<br>
[gbuzz](../opcodes/gbuzz.md) - Output is a set of harmonically related cosine partials.<br>
[genarray](../opcodes/genarray.md) - Generate a vector (one-dimensional k-rate or i-rate array) with an arithmetic sequence.<br>
[genarray_i](../opcodes/genarray_i.md) - Generate a vector (one-dimensional k-rate) with an arithmetic sequence at initialisation time.<br>
[gendy](../opcodes/gendy.md) - Dynamic stochastic approach to waveform synthesis conceived by Iannis Xenakis.<br>
[gendyc](../opcodes/gendyc.md) - Dynamic stochastic approach to waveform synthesis using cubic interpolation.<br>
[gendyx](../opcodes/gendyx.md) - Variation of the dynamic stochastic approach to waveform synthesis conceived by Iannis Xenakis.<br>
[getcfg](../opcodes/getcfg.md) - Return various configuration settings in Svalue as a string at init time.<br>
[getcol](../opcodes/getcol.md) - Gets a given column from a 2-dimensional array as a vector.<br>
[getftargs](../opcodes/getftargs.md) - Fill a string variable with the arguments used to create a function table at k-rate.<br>
[getrow](../opcodes/getrow.md) - Gets a given row from a 2-dimensional array as a vector.<br>
[getseed](../opcodes/getseed.md) - Reads the global seed value.<br>
[gogobel](../opcodes/gogobel.md) - Audio output is a tone related to the striking of a cow bell or similar.<br>
[goto](../opcodes/goto.md) - Transfer control to _label_ on every pass.<br>
[grain2](../opcodes/grain2.md) - Easy-to-use granular synthesis texture generator.<br>
[grain3](../opcodes/grain3.md) - Generate granular synthesis textures with more user control.<br>
[grain](../opcodes/grain.md) - Generates granular synthesis textures.<br>
[granule](../opcodes/granule.md) - A more complex granular synthesis texture generator.<br>
[gtadsr](../opcodes/gtadsr.md) - A gated linear attack-decay-sustain with exponential release.<br>
[gtf](../opcodes/gtf.md) - Apply a gammatone filter of various orders to an audio signal.<br>
[guiro](../opcodes/guiro.md) - Semi-physical model of a guiro sound.<br>
[harmon2](../opcodes/harmon234.md) - Analyze an audio input and generate harmonizing voices in synchrony with formants preserved.<br>
[harmon](../opcodes/harmon.md) - Analyze an audio input and generate harmonizing voices in synchrony.<br>
[hilbert2](../opcodes/hilbert2.md) - A DFT-based implementation of a Hilbert transformer.<br>
[hilbert](../opcodes/hilbert.md) - A Hilbert transformer.<br>
[hrtfearly](../opcodes/hrtfearly.md) - Generates 3D binaural audio with high-fidelity early reflections in a parametric room using a Phase Truncation algorithm.<br>
[hrtfer](../opcodes/hrtfer.md) - Creates 3D audio for two speakers.<br>
[hrtfmove2](../opcodes/hrtfmove2.md) - Generates dynamic 3d binaural audio for headphones using a Woodworth based spherical head model with improved low frequency phase accuracy.<br>
[hrtfmove](../opcodes/hrtfmove.md) - Generates dynamic 3d binaural audio for headphones using magnitude interpolation and phase truncation.<br>
[hrtfreverb](../opcodes/hrtfreverb.md) - A binaural, dynamic FDN based diffuse-field reverberator.<br>
[hrtfstat](../opcodes/hrtfstat.md) - Generates static 3d binaural audio for headphones using a Woodworth based spherical head model with improved low frequency phase accuracy.<br>
[hsboscil](../opcodes/hsboscil.md) - An oscillator which takes tonality and brightness as arguments, relative to a base frequency.<br>
[hvs1](../opcodes/hvs1.md) - Allows one-dimensional Hyper Vectorial Synthesis (HVS) controlled by externally-updated k-variables.<br>
[hvs2](../opcodes/hvs2.md) - Allows two-dimensional Hyper Vectorial Synthesis (HVS) controlled by externally-updated k-variables.<br>
[hvs3](../opcodes/hvs3.md) - Allows three-dimensional Hyper Vectorial Synthesis (HVS) controlled by externally-updated k-variables.<br>
[hypot](../opcodes/hypot.md) - Euclidean distance function.<br>
[i](../opcodes/opi.md) - Returns an init-type equivalent of a k-rate argument or array element or directly returns an i-rate argument.<br>
[if](../opcodes/if.md) - Branches conditionally at initialization or during performance time.<br>
[igoto](../opcodes/igoto.md) - During the i-time pass only, unconditionally transfer control to the statement labeled by _label_.<br>
[ihold](../opcodes/ihold.md) - Causes a finite-duration note to become a &#8220;held&#8221; note.<br>
[imag](../opcodes/imag.md) - Returns the imaginary part of a complex number.<br>
[in32](../opcodes/in32.md) - Reads a 32-channel audio signal from an external device or stream.<br>
[in](../opcodes/in.md) - Reads mono audio data from an external device or stream.<br>
[inch](../opcodes/inch.md) - Reads from numbered channels in an external audio signal or stream.<br>
[inh](../opcodes/inh.md) - Reads six-channel audio data from an external device or stream.<br>
[init](../opcodes/init.md) - Initialises one or more objects.<br>
[initc14](../opcodes/initc14.md) - Initializes the controllers used to create a 14-bit MIDI value.<br>
[initc21](../opcodes/initc21.md) - Initializes the controllers used to create a 21-bit MIDI value.<br>
[initc7](../opcodes/initc7.md) - Initializes the controller used to create a 7-bit MIDI value.<br>
[inleta](../opcodes/inleta.md) - Receives an arate signal into an instrument through a named port.<br>
[inletf](../opcodes/inletf.md) - Receives an frate signal (fsig) into an instrument from a named port.<br>
[inletk](../opcodes/inletk.md) - Receives a krate signal into an instrument from a named port.<br>
[inletkid](../opcodes/inletkid.md) - Receives a krate signal into an instrument from a named port.<br>
[inletv](../opcodes/inletv.md) - Receives an arate array signal into an instrument through a named port.<br>
[ino](../opcodes/ino.md) - Reads eight-channel audio data from an external device or stream.<br>
[inq](../opcodes/inq.md) - Reads quad audio data from an external device or stream.<br>
[inrg](../opcodes/inrg.md) - Reads audio from a range of adjacent audio channels from the audio input device.<br>
[ins](../opcodes/ins.md) - Reads stereo audio data from an external device or stream.<br>
[insglobal](../opcodes/insglobal.md) - An opcode which can be used to implement a remote orchestra.<br>
[insremot](../opcodes/insremot.md) - An opcode which can be used to implement a remote orchestra.<br>
[instr](../opcodes/instr.md) - Starts an instrument block.<br>
[int](../opcodes/int.md) - Extracts an integer from a decimal number.<br>
[integ](../opcodes/integ.md) - Modify a signal by integration.<br>
[interleave](../opcodes/interleave.md) - Interleaves arrays into a a single one by placing the input data in alternate positions.<br>
[interp](../opcodes/interp.md) - Converts a control signal to an audio signal using linear interpolation.<br>
[invalue](../opcodes/invalue.md) - Reads a k-rate or i-rate signal or string from a user-defined channel.<br>
[inx](../opcodes/inx.md) - Reads a 16-channel audio signal from an external device or stream.<br>
[inz](../opcodes/inz.md) - Reads multi-channel audio samples into a ZAK array from an external device or stream.<br>
[jitter2](../opcodes/jitter2.md) - Generates a segmented line with user-controllable random segments.<br>
[jitter](../opcodes/jitter.md) - Generates a segmented line whose segments are randomly generated.<br>
[joystick](../opcodes/joystick.md) - Reads data from a Linux joystick controller.<br>
[jspline](../opcodes/jspline.md) - A jitter-spline generator.<br>
[k](../opcodes/opk.md) - Converts a i-rate parameter to an k-rate value or an a-rate value to a k-rate value by down-sampling.<br>
[kgoto](../opcodes/kgoto.md) - During the p-time passes only, unconditionally transfer control to the statement labeled by _label_.<br>
[kr](../opcodes/kr.md) - Sets the control rate.<br>
[ksmps](../opcodes/ksmps.md) - Sets the number of samples in a control period.<br>
[lag](../opcodes/lag.md) - Exponential Lag.<br>
[lagud](../opcodes/lagud.md) - Exponential Lag.<br>
[lastcycle](../opcodes/lastcycle.md) - Indicates whether an event is in its last performance cycle.<br>
[lenarray](../opcodes/lenarray.md) - Evaluates the size or number of dimensions of an array.<br>
[lfo](../opcodes/lfo.md) - A low frequency oscillator of various shapes.<br>
[lfsr](../opcodes/lfsr.md) - Linear Feedback Shift Register (LFSR).<br>
[limit1](../opcodes/limit1.md) - Limits the value of an argument to the range [0,1].<br>
[limit](../opcodes/limit.md) - Sets the lower and upper limits of the value it processes.<br>
[lincos](../opcodes/lincos.md) - Linear to cosine interpolation.<br>
[line](../opcodes/line.md) - Trace a straight line between specified points.<br>
[linen](../opcodes/linen.md) - Applies a straight line rise and decay pattern to an input amp signal.<br>
[linenr](../opcodes/linenr.md) - The _linen_ opcode extended with a final release segment.<br>
[lineto](../opcodes/lineto.md) - Generate glissandos starting from a control signal.<br>
[linlin](../opcodes/linlin.md) - Linear to linear interpolation.<br>
[linrand](../opcodes/linrand.md) - Linear distribution random number generator (positive values only).<br>
[linseg](../opcodes/linseg.md) - Trace a series of line segments between specified points.<br>
[linsegb](../opcodes/linsegb.md) - Trace a series of line segments between specified absolute points.<br>
[linsegr](../opcodes/linsegr.md) - Trace a series of line segments between specified points including a release segment.<br>
[liveconv](../opcodes/liveconv.md) - Partitioned convolution with dynamically reloadable impulse response.<br>
[locsend](../opcodes/locsend.md) - Distributes the audio signals of a previous [locsig](../opcodes/locsig.md) opcode.<br>
[locsig](../opcodes/locsig.md) - Takes an input signal and distributes between 2 or 4 channels.<br>
[log10](../opcodes/log10.md) - Returns the base 10 log of _x_ (_x_ positive only).<br>
[log2](../opcodes/log2.md) - Returns the base 2 log of _x_ (_x_ positive only).<br>
[log](../opcodes/log.md) - Returns the natural log of _x_ (_x_ positive only).<br>
[logbtwo](../opcodes/logbtwo.md) - Performs a logarithmic base two calculation.<br>
[logcurve](../opcodes/logcurve.md) - This opcode implements a formula for generating a normalised logarithmic curve in range 0 - 1.<br>
[loop_ge](../opcodes/loop_ge.md) - Construction of looping operations.<br>
[loop_gt](../opcodes/loop_gt.md) - Construction of looping operations.<br>
[loop_le](../opcodes/loop_le.md) - Construction of looping operations.<br>
[loop_lt](../opcodes/loop_lt.md) - Construction of looping operations.<br>
[loopseg](../opcodes/loopseg.md) - Generate control signal consisting of linear segments delimited by two or more specified points.<br>
[loopsegp](../opcodes/loopsegp.md) - Control signals based on linear segments.<br>
[looptseg](../opcodes/looptseg.md) - Generate control signal consisting of exponential or linear segments delimited by two or more specified points.<br>
[loopxseg](../opcodes/loopxseg.md) - Generate control signal consisting of exponential segments delimited by two or more specified points.<br>
[lorenz](../opcodes/lorenz.md) - Implements the Lorenz system of equations.<br>
[loscil3](../opcodes/loscil3.md) - Read sampled sound from a table using cubic interpolation.<br>
[loscil](../opcodes/loscil.md) - Read sampled sound (mono or stereo) from a table.<br>
[loscilx](../opcodes/loscilx.md) - Read sampled sound (up to 16 channels) from a table, with optional sustain and release looping.<br>
[lowpass2](../opcodes/lowpass2.md) - A resonant second-order lowpass filter.<br>
[lowres](../opcodes/lowres.md) - Another resonant lowpass filter.<br>
[lowresx](../opcodes/lowresx.md) - Simulates layers of serially connected resonant lowpass filters.<br>
[lpcanal](../opcodes/lpcanal.md) - Streaming linear prediction analysis.<br>
[lpcfilter](../opcodes/lpcfilter.md) - Streaming linear prediction all-pole filter whose coefficients are obtained from streaming linear prediction analysis.<br>
[lpf18](../opcodes/lpf18.md) - A 3-pole sweepable resonant lowpass filter.<br>
[lpfreson](../opcodes/lpfreson.md) - Resynthesises a signal from the data passed internally by a previous _lpread_, applying formant shifting.<br>
[lphasor](../opcodes/lphasor.md) - Generates a table index for sample playback (e.g. with [tablexkt](../opcodes/tablexkt.md)).<br>
[lpinterp](../opcodes/lpinterp.md) - Computes a new set of poles from the interpolation between two analysis.<br>
[lposcil3](../opcodes/lposcil3.md) - Read sampled sound (mono or stereo) from a table, with looping, and high precision.<br>
[lposcil](../opcodes/lposcil.md) - Read sampled sound (mono or stereo) from a table, with looping, and high precision.<br>
[lposcila](../opcodes/lposcila.md) - Read sampled sound from a table with looping and high precision.<br>
[lposcilsa2](../opcodes/lposcilsa2.md) - Read stereo sampled sound from a table with looping and high precision.<br>
[lposcilsa](../opcodes/lposcilsa.md) - Read stereo sampled sound from a table with looping and high precision.<br>
[lpread](../opcodes/lpread.md) - Reads a control file of time-ordered information frames.<br>
[lpreson](../opcodes/lpreson.md) - RResynthesises a signal from the data passed internally by a previous _lpread_.<br>
[lpshold](../opcodes/lpshold.md) - Generate control signal consisting of held segments.<br>
[lpsholdp](../opcodes/lpsholdp.md) - Control signals based on held segments.<br>
[lpslot](../opcodes/lpslot.md) - Selects the slot to be use by further lp opcodes.<br>
[lufs](../opcodes/lufs.md) - Momentary, Integrated and Short-Term Loudness meter in LUFS.<br>
[mac](../opcodes/mac.md) - Multiplies and accumulates a- and k-rate signals.<br>
[maca](../opcodes/maca.md) - Multiply and accumulate a-rate signals only.<br>
[madsr](../opcodes/madsr.md) - Calculates the classical ADSR envelope using the [linsegr](../opcodes/linsegr.md) mechanism.<br>
[mags](../opcodes/mags.md) - Obtains the magnitudes of a complex-number array.<br>
[mandel](../opcodes/mandel.md) - Mandelbrot set.<br>
[mandol](../opcodes/mandol.md) - An emulation of a mandolin.<br>
[maparray](../opcodes/maparray.md) - Apply a function of one argument to every element of a vector (one-dimensional k-rate array).<br>
[marimba](../opcodes/marimba.md) - Physical model related to the striking of a wooden block as found in a marimba.<br>
[massign](../opcodes/massign.md) - Assigns a MIDI channel number to a Csound instrument.<br>
[max](../opcodes/max.md) - Produces a signal that is the maximum of any number of input signals.<br>
[max_k](../opcodes/max_k.md) - Local maximum (or minimum) value of an incoming asig signal, checked in the time interval between ktrig has become true twice.<br>
[maxabs](../opcodes/maxabs.md) - Produces a signal that is the maximum of the absolute values of any number of input signals.<br>
[maxabsaccum](../opcodes/maxabsaccum.md) - Accumulates the maximum of the absolute values of audio signals.<br>
[maxaccum](../opcodes/maxaccum.md) - Accumulates the maximum value of audio signals.<br>
[maxalloc](../opcodes/maxalloc.md) - Limits the number of allocations of an instrument.<br>
[maxarray](../opcodes/maxarray.md) - Returns the maximum value in a k-rate array, and optional its index.<br>
[mclock](../opcodes/mclock.md) - Sends a MIDI CLOCK message.<br>
[mdelay](../opcodes/mdelay.md) - A MIDI delay opcode.<br>
[median](../opcodes/median.md) - A median filter, a variant FIR lowpass filter.<br>
[mediank](../opcodes/mediank.md) - A median filter, a variant FIR lowpass filter.<br>
[metro2](../opcodes/metro2.md) - Trigger Metronome with Swing and Accents.<br>
[metro](../opcodes/metro.md) - Trigger Metronome.<br>
[metrobpm](../opcodes/metrobpm.md) - Trigger Metronome with optional gate.<br>
[mfb](../opcodes/mfb.md) - Mel scale filterbank for spectral magnitudes.<br>
[midglobal](../opcodes/midglobal.md) - An opcode which can be used to implement a remote midi orchestra.<br>
[midiarp](../opcodes/midiarp.md) - Generates arpeggios based on currently held MIDI notes.<br>
[midic14](../opcodes/midic14.md) - Allows a floating-point 14-bit MIDI signal scaled with a minimum and a maximum range.<br>
[midic21](../opcodes/midic21.md) - Allows a floating-point 21-bit MIDI signal scaled with a minimum and a maximum range.<br>
[midic7](../opcodes/midic7.md) - Allows a floating-point 7-bit MIDI signal scaled with a minimum and a maximum range.<br>
[midichannelaftertouch](../opcodes/midichannelaftertouch.md) - Gets a MIDI channel's aftertouch value.<br>
[midichn](../opcodes/midichn.md) - Returns the MIDI channel number (1 - 16) from which the note was activated.<br>
[midicontrolchange](../opcodes/midicontrolchange.md) - Gets a MIDI control change value.<br>
[midictrl](../opcodes/midictrl.md) - Get the current value (0-127) of a specified MIDI controller.<br>
[mididefault](../opcodes/mididefault.md) - Changes values, depending on MIDI activation.<br>
[midifilein](../opcodes/midifilein.md) - Returns a generic MIDI message from a MIDI file.<br>
[midifilelen](../opcodes/midifilelen.md) - Returns the length of a MIDI file.<br>
[midifilemute](../opcodes/midifilemute.md) - Toggle-mutes playback of a MIDI file (without pausing playback).<br>
[midifileopen](../opcodes/midifileopen.md) - Open a MIDI file for playback.<br>
[midifilepause](../opcodes/midifilepause.md) - Pauses MIDI file playback.<br>
[midifileplay](../opcodes/midifileplay.md) - Starts playback of a MIDI file.<br>
[midifilepos](../opcodes/midifilepos.md) - Gets/Sets the playback position of a MIDI file.<br>
[midifilerewind](../opcodes/midifilerewind.md) - Rewinds playback of a MIDI file.<br>
[midifilestatus](../opcodes/midifilestatus.md) - Returns the playback status of MIDI file input.<br>
[midifiletempo](../opcodes/midifiletempo.md) - Sets the playback tempo of a MIDI file.<br>
[midifilevents](../opcodes/midifilevents.md) - Returns the number of events in a MIDI file.<br>
[midiin](../opcodes/midiin.md) - Returns a generic MIDI message received by the MIDI IN port.<br>
[midinoteoff](../opcodes/midinoteoff.md) - Gets a MIDI noteoff value.<br>
[midinoteoncps](../opcodes/midinoteoncps.md) - Gets a MIDI note number as a cycles-per-second frequency.<br>
[midinoteonkey](../opcodes/midinoteonkey.md) - Gets a MIDI note number value.<br>
[midinoteonoct](../opcodes/midinoteonoct.md) - Gets a MIDI note number value as octave-point-decimal value.<br>
[midinoteonpch](../opcodes/midinoteonpch.md) - Gets a MIDI note number as a pitch-class value.<br>
[midion2](../opcodes/midion2.md) - Sends noteon and noteoff messages to the MIDI OUT port when triggered by a value different than zero.<br>
[midion](../opcodes/midion.md) - Generates MIDI note messages at k-rate.<br>
[midiout](../opcodes/midiout.md) - Sends a generic MIDI message to the MIDI OUT port.<br>
[midiout_i](../opcodes/midiout_i.md) - Sends a generic MIDI message to the MIDI OUT port.<br>
[midipitchbend](../opcodes/midipitchbend.md) - Gets a MIDI pitchbend value.<br>
[midipolyaftertouch](../opcodes/midipolyaftertouch.md) - Gets a MIDI polyphonic aftertouch value.<br>
[midiprogramchange](../opcodes/midiprogramchange.md) - Gets a MIDI program change value.<br>
[miditempo](../opcodes/miditempo.md) - Returns the current tempo at k-rate, of either the MIDI file (if available) or the score.<br>
[midremot](../opcodes/midremot.md) - An opcode which can be used to implement a remote midi orchestra.<br>
[min](../opcodes/min.md) - Produces a signal that is the minimum of any number of input signals.<br>
[minabs](../opcodes/minabs.md) - Produces a signal that is the minimum of the absolute values of any number of input signals.<br>
[minabsaccum](../opcodes/minabsaccum.md) - Accumulates the minimum of the absolute values of audio signals.<br>
[minaccum](../opcodes/minaccum.md) - Accumulates the minimum value of audio signals.<br>
[minarray](../opcodes/minarray.md) - Returns the minimum value in a k-rate array, and optional its index.<br>
[mincer](../opcodes/mincer.md) - Phase-locked vocoder processing.<br>
[mirror](../opcodes/mirror.md) - Reflects the signal that exceeds the low and high thresholds.<br>
[mode](../opcodes/mode.md) - A filter that simulates a mass-spring-damper system.<br>
[modmatrix](../opcodes/modmatrix.md) - Modulation matrix opcode with optimizations for sparse matrices.<br>
[monitor](../opcodes/monitor.md) - Returns the audio spout frame (if active), otherwise it returns zero.<br>
[moog](../opcodes/moog.md) - An emulation of a mini-Moog synthesizer.<br>
[moogladder2](../opcodes/moogladder2.md) - Moog ladder lowpass filter.<br>
[moogladder](../opcodes/moogladder.md) - Moog ladder lowpass filter.<br>
[moogvcf2](../opcodes/moogvcf2.md) - A digital emulation of the Moog diode ladder filter configuration.<br>
[moogvcf](../opcodes/moogvcf.md) - A digital emulation of the Moog diode ladder filter configuration.<br>
[moscil](../opcodes/moscil.md) - Sends a stream of the MIDI notes.<br>
[mp3in](../opcodes/mp3in.md) - Reads mono or stereo audio data from an external MP3 file.<br>
[mp3len](../opcodes/mp3len.md) - Returns the length of an MP3 sound file.<br>
[mp3scal](../opcodes/mp3scal.md) - Phase-locked vocoder processing with onset detection/processing, 'tempo-scaling'.<br>
[mpulse](../opcodes/mpulse.md) - Generates a set of impulses.<br>
[mrtmsg](../opcodes/mrtmsg.md) - Send system real-time messages to the MIDI OUT port.<br>
[ms2st](../opcodes/ms2st.md) - Mid-Side to stereo Conversion with a width control.<br>
[mtof](../opcodes/mtof.md) - Convert a midi note number value to frequency, taking global value of A4 into account.<br>
[mton](../opcodes/mton.md) - Convert midi note number to string note name, with an accuracy of 1 cent.<br>
[multitap](../opcodes/multitap.md) - Multitap delay line implementation.<br>
[mute](../opcodes/mute.md) - Mutes/unmutes new instances of a given instrument.<br>
[mvchpf](../opcodes/mvchpf.md) - Moog voltage-controlled highpass filter emulation.<br>
[mvclpf1](../opcodes/mvclpf1.md) - Moog voltage-controlled lowpass filter emulation.<br>
[mvclpf2](../opcodes/mvclpf2.md) - Moog voltage-controlled lowpass filter emulation.<br>
[mvclpf3](../opcodes/mvclpf3.md) - Moog voltage-controlled lowpass filter emulation.<br>
[mvclpf4](../opcodes/mvclpf4.md) - Moog voltage-controlled lowpass filter emulation.<br>
[mvmfilter](../opcodes/mvmfilter.md) - A filter with pronounced resonance and controllable decay time.<br>
[mxadsr](../opcodes/mxadsr.md) - Calculates the classical ADSR envelope using the [expsegr](../opcodes/expsegr.md) mechanism.<br>
[nchnls](../opcodes/nchnls.md) - Sets the number of channels of audio output.<br>
[nchnls_hw](../opcodes/nchnls_hw.md) - Returns the number of audio channels in the underlying hardware.<br>
[nchnls_i](../opcodes/nchnls_i.md) - Sets the number of channels of audio input.<br>
[nestedap](../opcodes/nestedap.md) - Three different nested all-pass filters, useful for implementing reverbs.<br>
[nlfilt2](../opcodes/nlfilt2.md) - A filter with a non-linear effect and blowup protection.<br>
[nlfilt](../opcodes/nlfilt.md) - A filter with a non-linear effect.<br>
[noise](../opcodes/noise.md) - A white noise generator with an IIR lowpass filter.<br>
[noteoff](../opcodes/noteoff.md) - Send a noteoff message to the MIDI OUT port.<br>
[noteon](../opcodes/noteon.md) - Send a noteon message to the MIDI OUT port.<br>
[noteondur2](../opcodes/noteondur2.md) - Sends a noteon and a noteoff MIDI message both with the same channel, number and velocity.<br>
[noteondur](../opcodes/noteondur.md) - Sends a noteon and a noteoff MIDI message both with the same channel, number and velocity.<br>
[notnum](../opcodes/notnum.md) - Get a note number from a MIDI event.<br>
[nreverb](../opcodes/nreverb.md) - A reverberator consisting of 6 parallel comb-lowpass filters.<br>
[nrpn](../opcodes/nrpn.md) - Sends a NPRN (Non-Registered Parameter Number) message to the MIDI OUT port each time one of the input arguments changes.<br>
[nsamp](../opcodes/nsamp.md) - Returns the number of samples loaded into a stored function table number.<br>
[nstance](../opcodes/nstance.md) - Schedules a new instrument instance, storing the instance handle in a variable.<br>
[nstrnum](../opcodes/nstrnum.md) - Returns the number of a named instrument.<br>
[nstrstr](../opcodes/nstrstr.md) - Returns the string of a named instr from its number or an empty string if no such association exists.<br>
[ntof](../opcodes/ntof.md) - Convert note name to frequency.<br>
[ntom](../opcodes/ntom.md) - Convert note name to midi note number.<br>
[ntrpol](../opcodes/ntrpol.md) - Calculates the weighted mean value (i.e. linear interpolation) of two input signals.<br>
[octave](../opcodes/octave.md) - Calculates a factor to raise/lower a frequency by a given amount of octaves.<br>
[octcps](../opcodes/octcps.md) - Converts a cycles-per-second value to octave-point-decimal.<br>
[octmidi](../opcodes/octmidi.md) - Get the note number, in octave-point-decimal units, of the current MIDI event.<br>
[octmidib](../opcodes/octmidib.md) - Get the note number of the current MIDI event and modify it by the current pitch-bend value, express it in octave-point-decimal.<br>
[octmidinn](../opcodes/octmidinn.md) - Converts a Midi note number value to octave-point-decimal.<br>
[octpch](../opcodes/octpch.md) - Converts a pitch-class value to octave-point-decimal.<br>
[olabuffer](../opcodes/olabuffer.md) - Sum overlapping frames of audio as k-rate arrays and read as an audio signal.<br>
[opcode](../opcodes/opcode.md) - Defines the start of user-defined opcode block.<br>
[opcodeinfo](../opcodes/opcodeinfo.md) - Prints information on an opcode definition and its overloads.<br>
[oscbnk](../opcodes/oscbnk.md) - Mixes the output of any number of oscillators.<br>
[oscil1](../opcodes/oscil1.md) - Accesses table values by incremental sampling.<br>
[oscil1i](../opcodes/oscil1i.md) - Accesses table values by incremental sampling with linear interpolation.<br>
[oscil3](../opcodes/oscil3.md) - A simple oscillator with cubic interpolation.<br>
[oscil](../opcodes/oscil.md) - A simple oscillator without any interpolation.<br>
[oscili](../opcodes/oscili.md) - A simple oscillator with linear interpolation.<br>
[oscilikt](../opcodes/oscilikt.md) - A linearly interpolated oscillator that allows changing the table number at k-rate.<br>
[osciliktp](../opcodes/osciliktp.md) - A linearly interpolated oscillator that allows allows phase modulation.<br>
[oscilikts](../opcodes/oscilikts.md) - A linearly interpolated oscillator with sync status that allows changing the table number at k-rate.<br>
[osciln](../opcodes/osciln.md) - Accesses table values at a user-defined frequency.<br>
[oscils](../opcodes/oscils.md) - A simple, fast sine oscillator.<br>
[oscilx](../opcodes/oscilx.md) - Same as the [osciln](../opcodes/osciln.md) opcode.<br>
[otafilter](../opcodes/otafilter.md) - Resonant 4pole non-linear lowpass filter.<br>
[out32](../opcodes/out32.md) - Writes 32-channel audio data to an external device or stream.<br>
[out](../opcodes/out.md) - Writes audio data to an external device or stream, either from audio variables or from an audio array.<br>
[outall](../opcodes/outall.md) - Writes a single audio value to all available audio channels.<br>
[outc](../opcodes/outc.md) - Writes audio data with an arbitrary number of channels to an external device or stream.<br>
[outch](../opcodes/outch.md) - Writes multi-channel audio data, with user-controllable channels, to an external device or stream.<br>
[outh](../opcodes/outh.md) - Writes 6-channel audio data to an external device or stream.<br>
[outiat](../opcodes/outiat.md) - Sends MIDI aftertouch messages at i-rate.<br>
[outic14](../opcodes/outic14.md) - Sends 14-bit MIDI controller output at i-rate.<br>
[outic](../opcodes/outic.md) - Sends MIDI controller output at i-rate.<br>
[outipat](../opcodes/outipat.md) - Sends polyphonic MIDI aftertouch messages at i-rate.<br>
[outipb](../opcodes/outipb.md) - Sends MIDI pitch-bend messages at i-rate.<br>
[outipc](../opcodes/outipc.md) - Sends MIDI program change messages at i-rate.<br>
[outkat](../opcodes/outkat.md) - Sends MIDI aftertouch messages at k-rate.<br>
[outkc14](../opcodes/outkc14.md) - Sends 14-bit MIDI controller output at k-rate.<br>
[outkc](../opcodes/outkc.md) - Sends MIDI controller messages at k-rate.<br>
[outkpat](../opcodes/outkpat.md) - Sends polyphonic MIDI aftertouch messages at k-rate.<br>
[outkpb](../opcodes/outkpb.md) - Sends MIDI pitch-bend messages at k-rate.<br>
[outkpc](../opcodes/outkpc.md) - Sends MIDI program change messages at k-rate.<br>
[outleta](../opcodes/outleta.md) - Sends an arate signal out from an instrument to a named port.<br>
[outletf](../opcodes/outletf.md) - Sends a frate signal (fsig) out from an instrument to a named port.<br>
[outletk](../opcodes/outletk.md) - Sends a krate signal out from an instrument to a named port.<br>
[outletkid](../opcodes/outletkid.md) - Sends a krate signal out from an instrument to a named port.<br>
[outletv](../opcodes/outletv.md) - Sends an arate array signal out from an instrument to a named port.<br>
[outo](../opcodes/outo.md) - Writes 8-channel audio data to an external device or stream.<br>
[outq1](../opcodes/outq1.md) - Writes samples to quad channel 1 of an external device or stream.<br>
[outq2](../opcodes/outq2.md) - Writes samples to quad channel 2 of an external device or stream.<br>
[outq3](../opcodes/outq3.md) - Writes samples to quad channel 3 of an external device or stream.<br>
[outq4](../opcodes/outq4.md) - Writes samples to quad channel 4 of an external device or stream.<br>
[outq](../opcodes/outq.md) - Writes 4-channel audio data to an external device or stream.<br>
[outrg](../opcodes/outrg.md) - Outputs audio to a range of adjacent audio channels on the audio output device.<br>
[outs1](../opcodes/outs1.md) - Writes samples to stereo channel 1 of an external device or stream.<br>
[outs2](../opcodes/outs2.md) - Writes samples to stereo channel 2 of an external device or stream.<br>
[outs](../opcodes/outs.md) - Writes stereo audio data to an external device or stream.<br>
[outvalue](../opcodes/outvalue.md) - Sends an i-rate or k-rate signal or string to a user-defined channel.<br>
[outx](../opcodes/outx.md) - Writes 16-channel audio data to an external device or stream.<br>
[outz](../opcodes/outz.md) - Writes multi-channel audio data from a ZAK array to an external device or stream.<br>
[oversample](../opcodes/oversample.md) - Sets the local sampling rate value in a user-defined opcode block.<br>
[p](../opcodes/p.md) - Show the value in a given p-field.<br>
[pan2](../opcodes/pan2.md) - Distribute an audio signal across two channels with a choice of methods.<br>
[pan](../opcodes/pan.md) - Distribute an audio signal amongst four channels with localization control.<br>
[pareq](../opcodes/pareq.md) - Implementation of Zoelzer's parametric equalizer filters, with some modifications by the author.<br>
[part2txt](../opcodes/part2txt.md) - Write a text file containing partial tracks data.<br>
[partials](../opcodes/partials.md) - Partial track spectral analysis.<br>
[partikkel](../opcodes/partikkel.md) - Granular synthesizer with "per grain" control over many of its parameters.<br>
[partikkelget](../opcodes/partikkelget.md) - Get mask index for a specific mask parameter of a running _partikkel_ instance.<br>
[partikkelset](../opcodes/partikkelset.md) - Set mask index for a specific mask parameter of a running _partikkel_ instance.<br>
[partikkelsync](../opcodes/partikkelsync.md) - Outputs _partikkel_'s grain scheduler clock pulse and phase to synchronize several instances of the _partikkel_ opcode to the same clock source.<br>
[passign](../opcodes/passign.md) - Assigns a range of p-fields to ivariables, or i- or k-array.<br>
[paulstretch](../opcodes/paulstretch.md) - Extreme time-stretching algorithm by Nasca Octavian Paul.<br>
[pcauchy](../opcodes/pcauchy.md) - Cauchy distribution random number generator (positive values only).<br>
[pchbend](../opcodes/pchbend.md) - Get the current pitch-bend value for this channel.<br>
[pchmidi](../opcodes/pchmidi.md) - Get the note number of the current MIDI event, expressed in pitch-class units.<br>
[pchmidib](../opcodes/pchmidib.md) - Get the note number of the current MIDI event and modify it by the current pitch-bend value, express it in pitch-class units.<br>
[pchmidinn](../opcodes/pchmidinn.md) - Converts a Midi note number value to octave point pitch-class units.<br>
[pchoct](../opcodes/pchoct.md) - Converts an octave-point-decimal value to pitch-class.<br>
[pchtom](../opcodes/pchtom.md) - Convert pch to midi note number.<br>
[pconvolve](../opcodes/pconvolve.md) - Convolution based on a uniformly partitioned overlap-save algorithm.<br>
[pcount](../opcodes/pcount.md) - Returns the number of pfields belonging to a note event.<br>
[pdclip](../opcodes/pdclip.md) - Performs linear clipping on an audio signal or a phasor.<br>
[pdhalf](../opcodes/pdhalf.md) - Distorts a phasor for reading the two halves of a table at different rates.<br>
[pdhalfy](../opcodes/pdhalfy.md) - Distorts a phasor for reading two unequal portions of a table in equal periods.<br>
[peak](../opcodes/peak.md) - Maintains the output equal to the highest absolute value received.<br>
[perf](../opcodes/perf.md) - Execute a performance pass on an instrument or opcode.<br>
[pgmassign](../opcodes/pgmassign.md) - Assigns an instrument number to a specified MIDI program.<br>
[phaser1](../opcodes/phaser1.md) - First-order allpass filters arranged in a series.<br>
[phaser2](../opcodes/phaser2.md) - Second-order allpass filters arranged in a series.<br>
[phasor](../opcodes/phasor.md) - Produce a normalized moving phase value.<br>
[phasorbnk](../opcodes/phasorbnk.md) - Produce an arbitrary number of normalized moving phase values, accessable by an index.<br>
[phs](../opcodes/phs.md) - Obtains the phases of a complex-number array.<br>
[pindex](../opcodes/pindex.md) - Returns the value of a specified pfield.<br>
[pinker](../opcodes/pinker.md) - Generates pink noise (-3dB/oct response) by the _NewShade of Pink_ algorithm of Stefan Stenzel.<br>
[pinkish](../opcodes/pinkish.md) - Generates approximate pink noise (-3dB/oct response).<br>
[pitch](../opcodes/pitch.md) - Tracks the pitch of a signal.<br>
[pitchamdf](../opcodes/pitchamdf.md) - Follows the pitch of a signal based on the AMDF method (Average Magnitude Difference Function).<br>
[planet](../opcodes/planet.md) - Simulates a planet orbiting in a binary star system.<br>
[platerev](../opcodes/platerev.md) - Models the reverberation of a rectangular metal plate with settable physical characteristics when excited by audio signal(s).<br>
[plltrack](../opcodes/plltrack.md) - Tracks the pitch of a signal.<br>
[pluck](../opcodes/pluck.md) - Produces a naturally decaying plucked string or drum sound.<br>
[poisson](../opcodes/poisson.md) - Poisson distribution random number generator (positive values only).<br>
[pol2rect](../opcodes/pol2rect.md) - Converts an input array in magnitude-phase format to real-imaginary format.<br>
[polar](../opcodes/polar.md) - Returns a complex number in polar format.<br>
[polyaft](../opcodes/polyaft.md) - Returns the polyphonic after-touch pressure of the selected note number, optionally mapped to an user-specified range.<br>
[polynomial](../opcodes/polynomial.md) - Efficiently evaluates a polynomial of arbitrary order.<br>
[pop](../opcodes/pop.md) - Pops values from the global stack.<br>
[pop_f](../opcodes/pop_f.md) - Pops an f-sig frame from the global stack.<br>
[port](../opcodes/port.md) - Applies portamento to a step-valued control signal.<br>
[portk](../opcodes/portk.md) - Applies portamento to a step-valued control signal.<br>
[poscil3](../opcodes/poscil3.md) - High precision oscillator with cubic interpolation.<br>
[poscil](../opcodes/poscil.md) - High precision oscillator.<br>
[pow](../opcodes/pow.md) - Computes one argument to the power of another argument and scales the result.<br>
[powershape](../opcodes/powershape.md) - Waveshapes a signal by raising it to a variable exponent.<br>
[powoftwo](../opcodes/powoftwo.md) - Performs a  power-of-two calculation.<br>
[prealloc](../opcodes/prealloc.md) - Creates space for instruments but does not run them.<br>
[prepiano](../opcodes/prepiano.md) - Creates a tone similar to a piano string prepared in a Cageian fashion.<br>
[print](../opcodes/print.md) - Displays the values of init (i-rate) variables.<br>
[printarray](../opcodes/printarray.md) - Print the contents of an array.<br>
[printf](../opcodes/printf.md) - printf-style formatted output.<br>
[printk2](../opcodes/printk2.md) - Prints a new value every time a control variable changes.<br>
[printk](../opcodes/printk.md) - Prints one k-rate value at specified intervals.<br>
[printks2](../opcodes/printks2.md) - Prints a new value every time a control variable changes using a printf() style syntax.<br>
[printks](../opcodes/printks.md) - Prints at k-rate using a printf() style syntax.<br>
[println](../opcodes/println.md) - Prints at k-rate using a printf() style syntax like [printks](../opcodes/printks.md), appends a new line.<br>
[prints](../opcodes/prints.md) - Prints at init-time using a printf() style syntax.<br>
[printsk](../opcodes/printsk.md) - Prints at k-rate using a printf() style syntax.<br>
[product](../opcodes/product.md) - Multiplies any number of a-rate signals.<br>
[product](../opcodes/productarray.md) - Calculates the product of an array.<br>
[pset](../opcodes/pset.md) - Defines and initializes numeric arrays at orchestra load time.<br>
[ptrack](../opcodes/ptrack.md) - Tracks the pitch of a signal.<br>
[push](../opcodes/push.md) - Pushes a value into the global stack.<br>
[push_f](../opcodes/push_f.md) - Pushes an f-sig frame into the global stack.<br>
[puts](../opcodes/puts.md) - Print a string with an optional newline at the end whenever the trigger signal is positive and changes.<br>
[pvadd](../opcodes/pvadd.md) - Reads from a _pvoc_ file and uses the data to perform additive synthesis.<br>
[pvbufread](../opcodes/pvbufread.md) - Reads from a phase vocoder analysis file and makes the retrieved data available.<br>
[pvcross](../opcodes/pvcross.md) - Applies the amplitudes from one phase vocoder analysis file to the data from a second file and then performs the resynthesis.<br>
[pvinterp](../opcodes/pvinterp.md) - Interpolates between the amplitudes and frequencies of two phase vocoder analysis files.<br>
[pvoc](../opcodes/pvoc.md) - Implements signal reconstruction using an fft-based phase vocoder.<br>
[pvread](../opcodes/pvread.md) - Reads from a [pvoc](../opcodes/pvoc.md) file and returns the frequency and amplitude from a single analysis channel or bin.<br>
[pvs2array](../opcodes/pvs2array.md) - Same as the [pvs2tab](../opcodes/pvs2tab.md) opcode.<br>
[pvs2tab](../opcodes/pvs2tab.md) - Copies spectral data to k-rate arrays (or t-variables).<br>
[pvsadsyn](../opcodes/pvsadsyn.md) - Resynthesize using a fast oscillator-bank.<br>
[pvsanal](../opcodes/pvsanal.md) - Generate an fsig from a mono audio source ain, using phase vocoder overlap-add analysis.<br>
[pvsarp](../opcodes/pvsarp.md) - Arpeggiate the spectral components of a streaming pv signal.<br>
[pvsbandp](../opcodes/pvsbandp.md) - A band pass filter working in the spectral domain.<br>
[pvsbandr](../opcodes/pvsbandr.md) - A band reject filter working in the spectral domain.<br>
[pvsbandwidth](../opcodes/pvsbandwidth.md) - Calculate the spectral bandwidth of a signal from its discrete Fourier transform.<br>
[pvsbin](../opcodes/pvsbin.md) - Obtain the amp and freq values off a PVS signal bin as k-rate variables.<br>
[pvsblur](../opcodes/pvsblur.md) - Average the amp/freq time functions of each analysis channel for a specified time (truncated to number of frames).<br>
[pvsbuffer](../opcodes/pvsbuffer.md) - This opcode creates and writes to a circular buffer for f-signals (streaming PV signals).<br>
[pvsbufread2](../opcodes/pvsbufread2.md) - This opcode reads a circular buffer of f-signals (streaming PV signals), with binwise additional delays.<br>
[pvsbufread](../opcodes/pvsbufread.md) - This opcode reads a circular buffer of f-signals (streaming PV signals).<br>
[pvscale](../opcodes/pvscale.md) - Scale the frequency components of a pv stream, resulting in pitch shift.<br>
[pvscent](../opcodes/pvscent.md) - Calculate the spectral centroid of a signal from its discrete Fourier transform.<br>
[pvsceps](../opcodes/pvsceps.md) - Calculate the cepstrum of a pvs input, optionally liftering coefficients.<br>
[pvscfs](../opcodes/pvscfs.md) - Cepstrum all-pole coefficient analysis.<br>
[pvscross](../opcodes/pvscross.md) - Performs cross-synthesis between two source fsigs.<br>
[pvsdemix](../opcodes/pvsdemix.md) - Spectral azimuth-based de-mixing of stereo sources, with a reverse-panning result.<br>
[pvsdiskin](../opcodes/pvsdiskin.md) - Create an fsig stream by reading a selected channel from a PVOC-EX analysis file, with frame interpolation.<br>
[pvsdisp](../opcodes/pvsdisp.md) - Displays a PVS signal as an amplitude vs.<br>
[pvsfilter](../opcodes/pvsfilter.md) - Multiply amplitudes of a pvoc stream by those of a second pvoc stream, with dynamic scaling.<br>
[pvsfread](../opcodes/pvsfread.md) - Read a selected channel from a PVOC-EX analysis file.<br>
[pvsfreeze](../opcodes/pvsfreeze.md) - Freeze the amplitude and frequency time functions of a pv stream according to a control-rate trigger.<br>
[pvsfromarray](../opcodes/pvsfromarray.md) - Same as the [tab2pvs](../opcodes/tab2pvs.md) opcode.<br>
[pvsftr](../opcodes/pvsftr.md) - Reads amplitude and/or frequency data from function tables.<br>
[pvsftw](../opcodes/pvsftw.md) - Writes amplitude and/or frequency data to function tables.<br>
[pvsfwrite](../opcodes/pvsfwrite.md) - Write a fsig to a PVOCEX file (which in turn can be read by _pvsfread_ or other programs that support PVOCEX file input).<br>
[pvsgain](../opcodes/pvsgain.md) - Scale the amplitude of a pv stream.<br>
[pvshift](../opcodes/pvshift.md) - Shift the frequency components of a pv stream, stretching/compressing its spectrum.<br>
[pvsifd](../opcodes/pvsifd.md) - Instantaneous Frequency Distribution, magnitude and phase analysis.<br>
[pvsin](../opcodes/pvsin.md) - Retrieve an fsig from the input software bus; a pvs equivalent to _chani_.<br>
[pvsinfo](../opcodes/pvsinfo.md) - Get information from a PVOC-EX formatted source.<br>
[pvsinit](../opcodes/pvsinit.md) - Initialise a spectral (f) variable to zero.<br>
[pvslpc](../opcodes/pvslpc.md) - Streaming linear prediction analysis.<br>
[pvsmaska](../opcodes/pvsmaska.md) - Modify amplitudes using a function table, with dynamic scaling.<br>
[pvsmix](../opcodes/pvsmix.md) - Mix 'seamlessly' two pv signals.<br>
[pvsmooth](../opcodes/pvsmooth.md) - Smooth the amplitude and frequency time functions of a pv stream using parallel 1st order lowpass IIR filters with time-varying cutoff frequency.<br>
[pvsmorph](../opcodes/pvsmorph.md) - Performs morphing (or interpolation) between two source fsigs.<br>
[pvsosc](../opcodes/pvsosc.md) - PVS-based oscillator simulator.<br>
[pvsout](../opcodes/pvsout.md) - Write a fsig to the pvs output bus.<br>
[pvspitch](../opcodes/pvspitch.md) - Track the pitch and amplitude of a PVS signal as k-rate variables.<br>
[pvstanal](../opcodes/pvstanal.md) - Phase vocoder analysis processing with onset detection/processing.<br>
[pvstencil](../opcodes/pvstencil.md) - Transforms a pvoc stream according to a masking function table.<br>
[pvstrace](../opcodes/pvstrace.md) - Process a PV stream by retaining only the N bins with the highest amplitude, zeroing the others.<br>
[pvsvoc](../opcodes/pvsvoc.md) - Combine the spectral envelope of one fsig with the excitation (frequencies) of another.<br>
[pvswarp](../opcodes/pvswarp.md) - Warp the spectral envelope of a PVS signal by means of shifting and scaling.<br>
[pvsynth](../opcodes/pvsynth.md) - Resynthesise phase vocoder data (f-signal) using a FFT overlap-add.<br>
[pwd](../opcodes/pwd.md) - Asks the underlying operating system for the current directory (folder) name as a string.<br>
[qinf](../opcodes/qinf.md) - Returns the number of times the argument is not a number, with the sign of the first infinity.<br>
[qnan](../opcodes/qnan.md) - Returns the number of times the argument is not a number.<br>
[r2c](../opcodes/r2c.md) - Real to complex format conversion.<br>
[rand](../opcodes/rand.md) - Output is a controlled random number series between -*amp* and +*amp*.<br>
[randc](../opcodes/randc.md) - Generates a controlled random number series with cubic interpolation between each new number.<br>
[randh](../opcodes/randh.md) - Generates random numbers and holds them for a period of time.<br>
[randi](../opcodes/randi.md) - Generates a controlled random number series with interpolation between each new number.<br>
[random](../opcodes/random.md) - Generates a controlled pseudo-random number series between min and max values.<br>
[randomh](../opcodes/randomh.md) - Generates random numbers with a user-defined limit and holds them for a period of time.<br>
[randomi](../opcodes/randomi.md) - Generates a user-controlled random number series with interpolation between each new number.<br>
[rbjeq](../opcodes/rbjeq.md) - Parametric equalizer and filter opcode with 7 filter types, based on algorithm by Robert Bristow-Johnson.<br>
[readclock](../opcodes/readclock.md) - Reads the value of an internal clock.<br>
[readf](../opcodes/readf.md) - Read a line of text from an external file once each k-cycle.<br>
[readfi](../opcodes/readfi.md) - Read a line of text from an external file once on initialisation.<br>
[readk2](../opcodes/readk2.md) - Periodically reads two orchestra control-signal values from an external file.<br>
[readk3](../opcodes/readk3.md) - Periodically reads three orchestra control-signal values from an external file.<br>
[readk4](../opcodes/readk4.md) - Periodically reads four orchestra control-signal values from an external file.<br>
[readk](../opcodes/readk.md) - Periodically reads an orchestra control-signal value from a named external file in a specific format.<br>
[readscore](../opcodes/readscore.md) - Read, preprocess and schedule a score from an input string.<br>
[readscratch](../opcodes/readscratch.md) - Returns one of four scalar values stored in the instance of an instrument.<br>
[real](../opcodes/real.md) - Returns the real part of a complex number.<br>
[rect2pol](../opcodes/rect2pol.md) - Converts an input array in real-imaginary format to magnitude-phase format.<br>
[reinit](../opcodes/reinit.md) - Suspends a performance while a special initialization pass is executed.<br>
[release](../opcodes/release.md) - Indicates whether a note is in its _release_ stage.<br>
[remoteport](../opcodes/remoteport.md) - Defines the port for use with the _insremot_, _midremot_, _insglobal_ and _midglobal_ opcodes.<br>
[remove](../opcodes/remove.md) - Removes the definition of an instrument as long as it is not in use.<br>
[repluck](../opcodes/repluck.md) - Physical model of the plucked string.<br>
[reshapearray](../opcodes/reshapearray.md) - Reshape an array, maintaining its capacity.<br>
[reson](../opcodes/reson.md) - A second-order resonant filter.<br>
[resonbnk](../opcodes/resonbnk.md) - A resonator filter bank.<br>
[resonk](../opcodes/resonk.md) - A second-order resonant filter.<br>
[resonr](../opcodes/resonr.md) - A second-order, two-pole two-zero bandpass filter with variable frequency response.<br>
[resonx](../opcodes/resonx.md) - Emulates a stack of filters using the reson opcode.<br>
[resonxk](../opcodes/resonxk.md) - Control signal resonant filter stack.<br>
[resony](../opcodes/resony.md) - A bank of second-order bandpass filters, connected in parallel.<br>
[resonz](../opcodes/resonz.md) - A second-order, two-pole two-zero bandpass filter with variable frequency response.<br>
[resyn](../opcodes/resyn.md) - Streaming partial track additive synthesis with cubic phase interpolation.<br>
[return](../opcodes/return.md) - Returns a value from an instrument at i-time.<br>
[reverb2](../opcodes/reverb2.md) - Same as the [nreverb](../opcodes/nreverb.md) opcode.<br>
[reverb](../opcodes/reverb.md) - Reverberates an input signal with a &#8220;natural room&#8221; frequency response.<br>
[reverbsc](../opcodes/reverbsc.md) - 8 delay line stereo FDN reverb.<br>
[rewindscore](../opcodes/rewindscore.md) - Rewinds the playback position of the current score performance.<br>
[rezzy](../opcodes/rezzy.md) - A resonant low-pass filter.<br>
[rfft](../opcodes/rfft.md) - Fast Fourier Transform of a real-value array.<br>
[rifft](../opcodes/rifft.md) - Complex-to-real Inverse Fast Fourier Transform.<br>
[rigoto](../opcodes/rigoto.md) - Transfers control during a reinit pass.<br>
[rireturn](../opcodes/rireturn.md) - Terminates a [reinit](../opcodes/reinit.md) pass (i.e., no-op at standard i-time).<br>
[rms](../opcodes/rms.md) - Determines the root-mean-square amplitude of an audio signal.<br>
[rnd31](../opcodes/rnd31.md) - 31-bit bipolar random opcodes with controllable distribution.<br>
[rnd](../opcodes/rnd.md) - Returns a random number in a unipolar range at the rate given by the input argument.<br>
[rndseed](../opcodes/rndseed.md) - Sets the global seed value for [rnd](../opcodes/rnd.md) and [birnd](../opcodes/birnd.md).<br>
[round](../opcodes/round.md) - Returns the integer value nearest to _x_.<br>
[rspline](../opcodes/rspline.md) - Generate random spline curves.<br>
[rtclock](../opcodes/rtclock.md) - Read the real time clock from the operating system.<br>
[s16b14](../opcodes/s16b14.md) - Creates a bank of 16 different 14-bit MIDI control message numbers.<br>
[s32b14](../opcodes/s32b14.md) - Creates a bank of 32 different 14-bit MIDI control message numbers.<br>
[samphold](../opcodes/samphold.md) - Performs a sample-and-hold operation on its input.<br>
[sandpaper](../opcodes/sandpaper.md) - Semi-physical model of a sandpaper sound.<br>
[scale2](../opcodes/scale2.md) - Arbitrary signal scaling with optional smoothing.<br>
[scale](../opcodes/scale.md) - Arbitrary signal scaling.<br>
[scalearray](../opcodes/scalearray.md) - The _scalearray_ opcode scales a subregion of a vector to a given minimum/maximum.<br>
[scanhammer](../opcodes/scanhammer.md) - Copies from one table to another with a gain control.<br>
[scanmap](../opcodes/scanmap.md) - Allows the position and velocity of a node in a scanned process to be read.<br>
[scans](../opcodes/scans.md) - Generate audio output using scanned synthesis.<br>
[scansmap](../opcodes/scansmap.md) - Allows the position and velocity of a node in a scanned process to be written.<br>
[scantable](../opcodes/scantable.md) - A simpler scanned synthesis implementation.<br>
[scanu2](../opcodes/scanu2.md) - Compute the waveform and the wavetable for use in scanned synthesis.<br>
[scanu](../opcodes/scanu.md) - Compute the waveform and the wavetable for use in scanned synthesis.<br>
[schedkwhen](../opcodes/schedkwhen.md) - Adds a new score event generated by a k-rate trigger.<br>
[schedkwhennamed](../opcodes/schedkwhennamed.md) - Similar to [schedkwhen](../opcodes/schedkwhen.md) but uses a named instrument at init-time.<br>
[schedule](../opcodes/schedule.md) - Adds a new score event.<br>
[schedulek](../opcodes/schedulek.md) - Adds a new score event.<br>
[schedwhen](../opcodes/schedwhen.md) - Adds a new score event.<br>
[scoreline](../opcodes/scoreline.md) - Issues one or more score line events from an instrument.<br>
[scoreline_i](../opcodes/scoreline_i.md) - Issues one or more score line events from an instrument at i-time.<br>
[seed](../opcodes/seed.md) - Sets the global seed value for all _x-class noise generators_, as well as other opcodes that use a random call, such as [grain](../opcodes/grain.md).<br>
[sekere](../opcodes/sekere.md) - Semi-physical model of a sekere sound.<br>
[select](../opcodes/select.md) - Select sample value from three based on audio-rate comparisons of two signals.<br>
[semitone](../opcodes/semitone.md) - Calculates a factor to raise/lower a frequency by a given amount of semitones.<br>
[sense](../opcodes/sense.md) - Same as the [sensekey](../opcodes/sensekey.md) opcode.<br>
[sensekey](../opcodes/sensekey.md) - Returns the ASCII code of a key that has been pressed, or -1 if no key has been pressed.<br>
[seqtime2](../opcodes/seqtime2.md) - Generates a trigger signal according to the values stored in a table.<br>
[seqtime](../opcodes/seqtime.md) - Generates a trigger signal according to the values stored in a table.<br>
[sequ](../opcodes/sequencer.md) - Emulate a hardware sequencer.<br>
[serialBegin](../opcodes/serialBegin.md) - Open a serial port for arduino.<br>
[serialEnd](../opcodes/serialEnd.md) - Close a serial port for arduino.<br>
[serialFlush](../opcodes/serialFlush.md) - Flush data from a serial port.<br>
[serialPrint](../opcodes/serialPrint.md) - Print data from a serial port.<br>
[serialRead](../opcodes/serialRead.md) - Read data from a serial port for arduino.<br>
[serialWrite](../opcodes/serialWrite.md) - Write data to a serial port for arduino.<br>
[serialWrite_i](../opcodes/serialWrite_i.md) - Write data to a serial port for arduino.<br>
[setcol](../opcodes/setcol.md) - Sets a given column of a 2-dimensional array from a vector.<br>
[setctrl](../opcodes/setctrl.md) - Configurable slider controls for realtime user input.<br>
[setksmps](../opcodes/setksmps.md) - Sets the local ksmps value in an instrument or user-defined opcode block.<br>
[setp](../opcodes/setp.md) - Set the value of an instrument parameter.<br>
[setrow](../opcodes/setrow.md) - Sets a given row of a 2-dimensional array from a vector.<br>
[setscorepos](../opcodes/setscorepos.md) - Sets the playback position of the current score performance to a given position.<br>
[sfilist](../opcodes/sfilist.md) - Prints a list of all instruments of a previously loaded SoundFont2 (SF2) sample file.<br>
[sfinstr3](../opcodes/sfinstr3.md) - Plays a SoundFont2 (SF2) sample instrument, generating a stereo sound with cubic interpolation.<br>
[sfinstr3m](../opcodes/sfinstr3m.md) - Plays a SoundFont2 (SF2) sample instrument, generating a mono sound with cubic interpolation.<br>
[sfinstr](../opcodes/sfinstr.md) - Plays a SoundFont2 (SF2) sample instrument, generating a stereo sound.<br>
[sfinstrm](../opcodes/sfinstrm.md) - Plays a SoundFont2 (SF2) sample instrument, generating a mono sound.<br>
[sfload](../opcodes/sfload.md) - Loads an entire SoundFont2 (SF2) sample file into memory.<br>
[sflooper](../opcodes/sflooper.md) - Plays a SoundFont2 (SF2) sample preset, generating a stereo sound, with user-defined
time-varying crossfade looping.<br>
[sfpassign](../opcodes/sfpassign.md) - Assigns all presets of a SoundFont2 (SF2) sample file to a sequence of progressive index numbers.<br>
[sfplay3](../opcodes/sfplay3.md) - Plays a SoundFont2 (SF2) sample preset, generating a stereo sound with cubic interpolation.<br>
[sfplay3m](../opcodes/sfplay3m.md) - Plays a SoundFont2 (SF2) sample preset, generating a mono sound with cubic interpolation.<br>
[sfplay](../opcodes/sfplay.md) - Plays a SoundFont2 (SF2) sample preset, generating a stereo sound.<br>
[sfplaym](../opcodes/sfplaym.md) - Plays a SoundFont2 (SF2) sample preset, generating a mono sound.<br>
[sfplist](../opcodes/sfplist.md) - Prints a list of all presets of a previously loaded SoundFont2 (SF2) sample file.<br>
[sfpreset](../opcodes/sfpreset.md) - Assigns an existing preset of a previously loaded SoundFont2 (SF2) sample file to an index number.<br>
[shaker](../opcodes/shaker.md) - Sounds like the shaking of a maraca or similar gourd instrument.<br>
[shiftin](../opcodes/shiftin.md) - Shifts the contents of an audio variable into a 1-dimensional array.<br>
[shiftout](../opcodes/shiftout.md) - Shifts the contents of a 1-dimensional array into an audio variable.<br>
[signum](../opcodes/signum.md) - Returns the signum of _x_ returning -1, 0 or 1.<br>
[sin](../opcodes/sin.md) - Returns the sine of _x_ (_x_ in radians).<br>
[sinh](../opcodes/sinh.md) - Returns the hyperbolic sine of _x_ (_x_ in radians).<br>
[sininv](../opcodes/sininv.md) - Returns the arcsine of _x_ (_x_ in radians).<br>
[sinsyn](../opcodes/sinsyn.md) - Streaming partial track additive synthesis with cubic phase interpolation.<br>
[skf](../opcodes/skf.md) - Sallen-Key filter.<br>
[sleighbells](../opcodes/sleighbells.md) - Semi-physical model of a sleighbell sound.<br>
[slicearray](../opcodes/slicearray.md) - Take a slice of a vector (one-dimensional k-rate array).<br>
[slider16](../opcodes/slider16.md) - Creates a bank of 16 different MIDI control message numbers.<br>
[slider16f](../opcodes/slider16f.md) - Creates a bank of 16 different MIDI control message numbers, filtered before output.<br>
[slider16table](../opcodes/slider16table.md) - Stores a bank of 16 different MIDI control messages to a table.<br>
[slider16tablef](../opcodes/slider16tablef.md) - Stores a bank of 16 different MIDI control messages to a table, filtered before output.<br>
[slider32](../opcodes/slider32.md) - Creates a bank of 32 different MIDI control message numbers.<br>
[slider32f](../opcodes/slider32f.md) - Creates a bank of 32 different MIDI control message numbers, filtered before output.<br>
[slider32table](../opcodes/slider32table.md) - Stores a bank of 32 different MIDI control messages to a table.<br>
[slider32tablef](../opcodes/slider32tablef.md) - Stores a bank of 32 different MIDI control messages to a table, filtered before output.<br>
[slider64](../opcodes/slider64.md) - Creates a bank of 64 different MIDI control message numbers.<br>
[slider64f](../opcodes/slider64f.md) - Creates a bank of 64 different MIDI control message numbers, filtered before output.<br>
[slider64table](../opcodes/slider64table.md) - Stores a bank of 64 different MIDI control messages to a table.<br>
[slider64tablef](../opcodes/slider64tablef.md) - Stores a bank of 64 different MIDI control messages to a table, filtered before output.<br>
[slider8](../opcodes/slider8.md) - Creates a bank of 8 different MIDI control message numbers.<br>
[slider8f](../opcodes/slider8f.md) - Creates a bank of 8 different MIDI control message numbers, filtered before output.<br>
[slider8table](../opcodes/slider8table.md) - Stores a bank of 8 different MIDI control messages to a table.<br>
[slider8tablef](../opcodes/slider8tablef.md) - Stores a bank of 8 different MIDI control messages to a table, filtered before output.<br>
[sliderKawai](../opcodes/sliderkawai.md) - Creates a bank of 16 different MIDI control message numbers from a KAWAI MM-16 midi mixer.<br>
[sndload](../opcodes/sndload.md) - Loads a sound file into memory for use by [loscilx](../opcodes/loscilx.md).<br>
[sndloop](../opcodes/sndloop.md) - A sound looper with pitch control.<br>
[sndwarp](../opcodes/sndwarp.md) - Reads a mono sound sample from a table and applies time-stretching and/or pitch modification.<br>
[sndwarpst](../opcodes/sndwarpst.md) - Reads a stereo sound sample from a table and applies time-stretching and/or pitch modification.<br>
[sockrecv](../opcodes/sockrecv.md) - Receives data from other processes using the low-level UDP or TCP protocols.<br>
[socksend](../opcodes/socksend.md) - Sends data to other processes using the low-level UDP or TCP protocols.<br>
[sorta](../opcodes/sorta.md) - Takes a numeric array (k or i-rate) and returns it sorted in ascending order.<br>
[sortd](../opcodes/sortd.md) - Takes a numeric array (k or i-rate) and returns it sorted in descending order.<br>
[soundin](../opcodes/soundin.md) - Reads audio data from an external device or stream.<br>
[soundout](../opcodes/soundout.md) - Deprecated.<br>
[soundouts](../opcodes/soundouts.md) - Deprecated.<br>
[space](../opcodes/space.md) - Distributes an input signal among 4 channels using cartesian coordinates.<br>
[spat3d](../opcodes/spat3d.md) - Positions the input sound in a 3D space and allows moving the sound at k-rate.<br>
[spat3di](../opcodes/spat3di.md) - Positions the input sound in a 3D space with the sound source position set at i-time.<br>
[spat3dt](../opcodes/spat3dt.md) - Can be used to render an impulse response for a 3D space at i-time.<br>
[spdist](../opcodes/spdist.md) - Calculates distance values from xy coordinates.<br>
[specaddm](../opcodes/specaddm.md) - Perform a weighted add of two input spectra.<br>
[specdiff](../opcodes/specdiff.md) - Finds the positive difference values between consecutive spectral frames.<br>
[specdisp](../opcodes/specdisp.md) - Displays the magnitude values of the spectrum.<br>
[specfilt](../opcodes/specfilt.md) - Filters each channel of an input spectrum.<br>
[spechist](../opcodes/spechist.md) - Accumulates the values of successive spectral frames.<br>
[specptrk](../opcodes/specptrk.md) - Estimates the pitch of the most prominent complex tone in the spectrum.<br>
[specscal](../opcodes/specscal.md) - Scales an input spectral datablock with spectral envelopes.<br>
[specsum](../opcodes/specsum.md) - Sums the magnitudes across all channels of the spectrum.<br>
[spectrum](../opcodes/spectrum.md) - Generate a constant-Q, exponentially-spaced DFT across all octaves of a multiply-downsampled control or audio input signal.<br>
[spf](../opcodes/spf.md) - Steiner-Parker filter.<br>
[splitrig](../opcodes/splitrig.md) - Split a trigger signal (i.e. a timed sequence of control-rate impulses) into several channels following a structure designed by the user.<br>
[sprintf](../opcodes/sprintf.md) - printf-style formatted output to a string variable.<br>
[sprintfk](../opcodes/sprintfk.md) - printf-style formatted output to a string variable at k-rate.<br>
[spsend](../opcodes/spsend.md) - Generates output signals based on a previously defined [space](../opcodes/space.md) opcode.<br>
[sqrt](../opcodes/sqrt.md) - Returns the square root of _x_ (_x_ non-negative).<br>
[squinewave](../opcodes/squinewave.md) - A mostly bandlimited shape-shifting square-pulse-saw-sinewave oscillator with hardsync.<br>
[sr](../opcodes/sr.md) - Sets the audio sampling rate.<br>
[st2ms](../opcodes/st2ms.md) - Stereo to Mid-Side Conversion.<br>
[stack](../opcodes/stack.md) - Initializes and sets the size of the global stack.<br>
[statevar](../opcodes/statevar.md) - Statevar is a new digital implementation of the analogue state-variable filter.<br>
[sterrain](../opcodes/sterrain.md) - A wave-terrain synthesis opcode using curves computed with the superformula.<br>
[stix](../opcodes/stix.md) - Semi-physical model of a stick sound.<br>
[strcat](../opcodes/strcat.md) - Concatenate two strings and store the result in a variable.<br>
[strcatk](../opcodes/strcatk.md) - Concatenate two strings and store the result in a variable.<br>
[strchar](../opcodes/strchar.md) - Return the ASCII code of the character in Sstr at ipos (defaults to zero which means the first character), or zero if ipos is out of range.<br>
[strchark](../opcodes/strchark.md) - Return the ASCII code of the character in Sstr at kpos (defaults to zero which means the first character), or zero if kpos is out of range.<br>
[strcmp](../opcodes/strcmp.md) - Compare strings.<br>
[strcmpk](../opcodes/strcmpk.md) - Compare strings.<br>
[strcpy](../opcodes/strcpy.md) - Assign to a string variable by copying the source which may be a constant or another string variable.<br>
[strcpyk](../opcodes/strcpyk.md) - Assign to a string variable by copying the source which may be a constant or another string variable.<br>
[streson](../opcodes/streson.md) - A string resonator with variable fundamental frequency.<br>
[strfromurl](../opcodes/strfromurl.md) - Set a string variable to the value found from reading an URL.<br>
[strget](../opcodes/strget.md) - Set  a string variable at initialization time to the value stored in [strset](../opcodes/strset.md) table at the specified index, or a string p-field from the score.<br>
[strindex](../opcodes/strindex.md) - Return the position of the first occurence of S2 in S1, or -1 if not found.<br>
[strindexk](../opcodes/strindexk.md) - Return the position of the first occurence of S2 in S1, or -1 if not found.<br>
[strlen](../opcodes/strlen.md) - Return the length of a string, or zero if it is empty.<br>
[strlenk](../opcodes/strlenk.md) - Return the length of a string, or zero if it is empty.<br>
[strlower](../opcodes/strlower.md) - Convert Ssrc to lower case, and write the result to Sdst.<br>
[strlowerk](../opcodes/strlowerk.md) - Convert Ssrc to lower case, and write the result to Sdst.<br>
[strrindex](../opcodes/strrindex.md) - Return the position of the last occurence of S2 in S1, or -1 if not found.<br>
[strrindexk](../opcodes/strrindexk.md) - Return the position of the last occurence of S2 in S1, or -1 if not found.<br>
[strset](../opcodes/strset.md) - Allows a string to be linked with a numeric value.<br>
[strstrip](../opcodes/strstrip.md) - Strip whitespace from string.<br>
[strsub](../opcodes/strsub.md) - Extract a substring of the source string.<br>
[strsubk](../opcodes/strsubk.md) - Extract a substring of the source string.<br>
[strtod](../opcodes/strtod.md) - Converts a string to a floating point value (i-rate).<br>
[strtodk](../opcodes/strtodk.md) - Converts a string to a floating point value at i- or k-rate.<br>
[strtol](../opcodes/strtol.md) - Converts a string to a signed integer value (i-rate).<br>
[strtolk](../opcodes/strtolk.md) - Converts a string to a signed integer value at i- or k-rate.<br>
[strupper](../opcodes/strupper.md) - Convert Ssrc to upper case, and write the result to Sdst.<br>
[strupperk](../opcodes/strupperk.md) - Convert Ssrc to upper case, and write the result to Sdst.<br>
[subinstr](../opcodes/subinstr.md) - Creates and runs a numbered instrument instance as if it were an opcode.<br>
[subinstrinit](../opcodes/subinstrinit.md) - Creates and runs a numbered instrument instance at init-time.<br>
[sum](../opcodes/sum.md) - Sums any number of a-rate signals, or array elements.<br>
[sumarray](../opcodes/sumarray.md) - Returns the sum of all elements in a k-rate array.<br>
[svfilter](../opcodes/svfilter.md) - A resonant second order filter, with simultaneous lowpass, highpass and bandpass outputs.<br>
[svn](../opcodes/svn.md) - Non-linear state variable filter.<br>
[switch](../opcodes/switch.md) - Branches conditionally at initialization or during performance time.<br>
[syncgrain](../opcodes/syncgrain.md) - Synchronous granular synthesis.<br>
[syncloop](../opcodes/syncloop.md) - Synchronous granular synthesis.<br>
[syncphasor](../opcodes/syncphasor.md) - Produces a normalized moving phase value with sync input and output.<br>
[system](../opcodes/system.md) - Call an external program via the system call.<br>
[tab2array](../opcodes/tab2array.md) - Copy a slice from an f-table to an array.<br>
[tab2pvs](../opcodes/tab2pvs.md) - Copies spectral data from k-rate arrays (or t-variables.<br>
[tab](../opcodes/tab.md) - Fast table opcode.<br>
[tab_i](../opcodes/tab_i.md) - Fast table opcodes.<br>
[tabifd](../opcodes/tabifd.md) - Instantaneous Frequency Distribution, magnitude and phase analysis.<br>
[table3](../opcodes/table3.md) - Accesses table values by direct indexing with cubic interpolation.<br>
[table](../opcodes/table.md) - Accesses table values by direct indexing.<br>
[tablecopy](../opcodes/tablecopy.md) - Simple, fast table copy opcode.<br>
[tablefilter](../opcodes/tablefilter.md) - Filters a source table and writes result into a destination table.<br>
[tablefilteri](../opcodes/tablefilteri.md) - Filters a source table and writes result into a destination table.<br>
[tablegpw](../opcodes/tablegpw.md) - Writes a table's guard point.<br>
[tablei](../opcodes/tablei.md) - Accesses table values by direct indexing with linear interpolation.<br>
[tableicopy](../opcodes/tableicopy.md) - Simple, fast table copy opcode.<br>
[tableigpw](../opcodes/tableigpw.md) - Writes a table's guard point.<br>
[tableikt](../opcodes/tableikt.md) - Provides k-rate control over table numbers.<br>
[tableimix](../opcodes/tableimix.md) - Mixes two tables.<br>
[tableiw](../opcodes/tableiw.md) - Deprecated as of version 3.<br>
[tablekt](../opcodes/tablekt.md) - Provides k-rate control over table numbers.<br>
[tablemix](../opcodes/tablemix.md) - Mixes two tables.<br>
[tableng](../opcodes/tableng.md) - Interrogates a function table for length.<br>
[tablera](../opcodes/tablera.md) - Reads tables in sequential locations to an a-rate variable.<br>
[tableseg](../opcodes/tableseg.md) - Creates a new function table by making linear segments between values in stored function tables.<br>
[tableshuffle](../opcodes/tableshuffle.md) - Shuffles the content of a function table.<br>
[tablew](../opcodes/tablew.md) - Change the contents of existing function tables.<br>
[tablewa](../opcodes/tablewa.md) - Writes tables in sequential locations to and from an a-rate variable.<br>
[tablewkt](../opcodes/tablewkt.md) - Change the contents of existing function tables.<br>
[tablexkt](../opcodes/tablexkt.md) - Reads function tables with linear, cubic, or sinc interpolation.<br>
[tablexseg](../opcodes/tablexseg.md) - Creates a new function table by making exponential segments between values in stored function tables.<br>
[tabmorph](../opcodes/tabmorph.md) - Allows morphing between a set of tables of the same size, by means of a weighted average between two currently selected tables.<br>
[tabmorpha](../opcodes/tabmorpha.md) - Allows morphing between a set of tables of the same size, by means of a weighted average between two currently selected tables.<br>
[tabmorphak](../opcodes/tabmorphak.md) - Allows morphing between a set of tables of the same size, by means of a weighted average between two currently selected tables.<br>
[tabmorphi](../opcodes/tabmorphi.md) - Allows morphing between a set of tables of the same size, by means of a weighted average between two currently selected tables.<br>
[tabplay](../opcodes/tabplay.md) - Plays-back control-rate signals on trigger-temporization basis.<br>
[tabrec](../opcodes/tabrec.md) - Records control-rate signals on trigger-temporization basis.<br>
[tabsum](../opcodes/tabsum.md) - Sums the values in an f-table in a consecutive range.<br>
[tabw](../opcodes/tabw.md) - Fast table opcodes.<br>
[tabw_i](../opcodes/tabw_i.md) - Fast table opcodes.<br>
[tambourine](../opcodes/tambourine.md) - Semi-physical model of a tambourine sound.<br>
[tan](../opcodes/tan.md) - Returns the tangent of _x_ (_x_ in radians).<br>
[tanh](../opcodes/tanh.md) - Returns the hyperbolic tangent of _x_.<br>
[taninv2](../opcodes/taninv2.md) - Returns the arctangent of _iy/ix_, _ky/kx_, or _ay/ax_.<br>
[taninv](../opcodes/taninv.md) - Returns the arctangent of _x_ (_x_ in radians).<br>
[tbvcf](../opcodes/tbvcf.md) - Models some of the filter characteristics of a Roland TB303 voltage-controlled filter.<br>
[tempest](../opcodes/tempest.md) - Estimate the tempo of beat patterns in a control signal.<br>
[tempo](../opcodes/tempo.md) - Apply tempo control to an uninterpreted score.<br>
[temposcal](../opcodes/temposcal.md) - Phase-locked vocoder processing with onset detection/processing, 'tempo-scaling'.<br>
[tempoval](../opcodes/tempoval.md) - Reads the current value of the tempo.<br>
[tigoto](../opcodes/tigoto.md) - Transfer control at i-time when a new note is being tied onto a previously held note.<br>
[timedseq](../opcodes/timedseq.md) - Time Variant Sequencer.<br>
[timeinstk](../opcodes/timeinstk.md) - Read absolute time in k-rate cycles, since the start of aninstance of an instrument.<br>
[timeinsts](../opcodes/timeinsts.md) - Read absolute time, in seconds, since the start of an instance of an instrument.<br>
[timek](../opcodes/timek.md) - Read absolute time, in k-rate cycles, since the start of the performance.<br>
[times](../opcodes/times.md) - Read absolute time, in seconds, since the start of the performance.<br>
[timout](../opcodes/timout.md) - Conditional branch during p-time depending on elapsed note time.<br>
[tival](../opcodes/tival.md) - Puts the value of the instrument's internal &#8220;tie-in&#8221; flag into the named i-rate variable.<br>
[tlineto](../opcodes/tlineto.md) - Generate glissandos starting from a control signal with a trigger.<br>
[tone](../opcodes/tone.md) - A first-order recursive low-pass filter with variable frequency response.<br>
[tonek](../opcodes/tonek.md) - A first-order recursive low-pass filter with variable frequency response.<br>
[tonex](../opcodes/tonex.md) - Emulates a stack of filters using the tone opcode.<br>
[tradsyn](../opcodes/tradsyn.md) - Streaming partial track additive synthesis.<br>
[trandom](../opcodes/trandom.md) - Generates a controlled pseudo-random number series between min and max values at k-rate whenever the trigger parameter is different to 0.<br>
[transeg](../opcodes/transeg.md) - Constructs a user-definable envelope.<br>
[transegb](../opcodes/transegb.md) - Constructs a user-definable envelope in absolute time.<br>
[transegr](../opcodes/transegr.md) - Constructs a user-definable envelope with extended release segment.<br>
[trcross](../opcodes/trcross.md) - Streaming partial track cross-synthesis.<br>
[trfilter](../opcodes/trfilter.md) - Streaming partial track filtering.<br>
[trhighest](../opcodes/trhighest.md) - Extracts the highest-frequency track from a streaming track input signal.<br>
[trigexpseg](../opcodes/trigexpseg.md) - Triggers a series of exponential segments between specified points.<br>
[trigger](../opcodes/trigger.md) - Informs when a krate signal crosses a threshold.<br>
[trighold](../opcodes/trighold.md) - Timed trigger, holds a value for a given time.<br>
[triglinseg](../opcodes/triglinseg.md) - Triggers a series of line segments between specified points.<br>
[trigphasor](../opcodes/trigphasor.md) - A resettable linear ramp between two levels.<br>
[trigseq](../opcodes/trigseq.md) - Accepts a trigger signal as input and outputs a group of values.<br>
[trim](../opcodes/trim.md) - Adjust size of a one-dimensional array.<br>
[trirand](../opcodes/trirand.md) - Triangular distribution random number generator.<br>
[trlowest](../opcodes/trlowest.md) - Extracts the lowest-frequency track from a streaming track input signal.<br>
[trmix](../opcodes/trmix.md) - Streaming partial track mixing.<br>
[trscale](../opcodes/trscale.md) - Streaming partial track frequency scaling.<br>
[trshift](../opcodes/trshift.md) - Streaming partial track frequency scaling.<br>
[trsplit](../opcodes/trsplit.md) - Streaming partial track frequency splitting.<br>
[turnoff2](../opcodes/turnoff2.md) - Turn off instance(s) of other instruments at performance time.<br>
[turnoff3](../opcodes/turnoff3.md) - Turn off instance(s) of other instruments at performance time in the queue of scheduled events.<br>
[turnoff](../opcodes/turnoff.md) - Enables an instrument to turn itself off or to turn an instance of another instrument off.<br>
[turnon](../opcodes/turnon.md) - Activate an instrument for an indefinite time.<br>
[tvconv](../opcodes/tvconv.md) - A time-varying convolution (FIR filter) opcode.<br>
[undersample](../opcodes/undersample.md) - Sets a lower local sampling rate based on an undersampling factor.<br>
[unirand](../opcodes/unirand.md) - Uniform distribution random number generator (positive values only).<br>
[until](../opcodes/until.md) - A syntactic looping construction.<br>
[unwrap](../opcodes/unwrap.md) - Applies a unwrapping operation to a vector of phase values stored in an array.<br>
[upsamp](../opcodes/upsamp.md) - Modify a signal by up-sampling.<br>
[urandom](../opcodes/urandom.md) - Truly random opcodes with controllable range.<br>
[urd](../opcodes/urd.md) - A discrete user-defined-distribution random generator that can be used as a function.<br>
[vactrol](../opcodes/vactrol.md) - Envelope follower unit generator emmulating a Perkin Elmer Vactrole VTL5C3/2.<br>
[vadd](../opcodes/vadd.md) - Adds a scalar value to a vector in a table.<br>
[vadd_i](../opcodes/vadd_i.md) - Adds a scalar value to a vector in a table.<br>
[vaddv](../opcodes/vaddv.md) - Performs addition between two vectorial control signals.<br>
[vaddv_i](../opcodes/vaddv_i.md) - Performs addition between two vectorial control signals at init time.<br>
[vaget](../opcodes/vaget.md) - Access values of the current buffer of an a-rate variable by indexing.<br>
[valpass](../opcodes/valpass.md) - Variably reverberates an input signal with a flat frequency response.<br>
[vaset](../opcodes/vaset.md) - Write values into the current buffer of an a-rate variable at the given index.<br>
[vbap16](../opcodes/vbap16.md) - Distributes an audio signal among 16 channels.<br>
[vbap16move](../opcodes/vbap16move.md) - Distribute an audio signal among 16 channels with moving virtual sources.<br>
[vbap4](../opcodes/vbap4.md) - Distributes an audio signal among 4 channels.<br>
[vbap4move](../opcodes/vbap4move.md) - Distributes an audio signal among 4 channels with moving virtual sources.<br>
[vbap8](../opcodes/vbap8.md) - Distributes an audio signal among 8 channels.<br>
[vbap8move](../opcodes/vbap8move.md) - Distributes an audio signal among 8 channels with moving virtual sources.<br>
[vbap](../opcodes/vbap.md) - Distributes an audio signal among many channels, up to 64 in the first form, arbitrary in the second.<br>
[vbapg](../opcodes/vbapg.md) - Calculates the gains for a sound location for up to 64.<br>
[vbapgmove](../opcodes/vbapgmove.md) - Calculates the gains for a sound location between multiple channels with moving virtual sources.<br>
[vbaplsinit](../opcodes/vbaplsinit.md) - Configures VBAP output according to loudspeaker parameters.<br>
[vbapmove](../opcodes/vbapmove.md) - Distributes an audio signal among upto 64 channels with moving virtual sources.<br>
[vbapz](../opcodes/vbapz.md) - Writes a multi-channel audio signal to a ZAK array.<br>
[vbapzmove](../opcodes/vbapzmove.md) - Writes a multi-channel audio signal to a ZAK array with moving virtual sources.<br>
[vcella](../opcodes/vcella.md) - Cellular Automata.<br>
[vclpf](../opcodes/vclpf.md) - Resonant 4pole linear lowpass filter.<br>
[vco2](../opcodes/vco2.md) - Implementation of a band-limited oscillator using pre-calculated tables.<br>
[vco2ft](../opcodes/vco2ft.md) - Returns a table number at k-time for a given oscillator frequency and wavform.<br>
[vco2ift](../opcodes/vco2ift.md) - Returns a table number at i-time for a given oscillator frequency and wavform.<br>
[vco2init](../opcodes/vco2init.md) - Calculates tables for use by vco2 opcode.<br>
[vco](../opcodes/vco.md) - Implementation of a band limited, analog modeled oscillator.<br>
[vcomb](../opcodes/vcomb.md) - Variably reverberates an input signal with a &#8220;colored&#8221; frequency response.<br>
[vcopy](../opcodes/vcopy.md) - Copies between two vectorial control signals.<br>
[vcopy_i](../opcodes/vcopy_i.md) - Copies a vector from one table to another.<br>
[vdelay3](../opcodes/vdelay3.md) - A variable time delay with cubic interpolation.<br>
[vdelay](../opcodes/vdelay.md) - An interpolating variable time delay.<br>
[vdelayk](../opcodes/vdelayk.md) - Variable time delay applied to a k-rate signal.<br>
[vdelayx](../opcodes/vdelayx.md) - A variable delay opcode with high quality interpolation.<br>
[vdelayxq](../opcodes/vdelayxq.md) - A 4-channel variable delay opcode with high quality interpolation.<br>
[vdelayxs](../opcodes/vdelayxs.md) - A stereo variable delay opcode with high quality interpolation.<br>
[vdelayxw](../opcodes/vdelayxw.md) - Variable delay opcodes with high quality interpolation.<br>
[vdelayxwq](../opcodes/vdelayxwq.md) - Variable delay opcodes with high quality interpolation.<br>
[vdelayxws](../opcodes/vdelayxws.md) - Variable delay opcodes with high quality interpolation.<br>
[vdivv](../opcodes/vdivv.md) - Performs division between two vectorial control signals.<br>
[vdivv_i](../opcodes/vdivv_i.md) - Performs division between two vectorial control signals at init time.<br>
[vecdelay](../opcodes/vecdelay.md) - Generate a sort of 'vectorial' delay.<br>
[veloc](../opcodes/veloc.md) - Get the velocity from a MIDI event.<br>
[vexp](../opcodes/vexp.md) - Performs power-of operations between a vector and a scalar.<br>
[vexp_i](../opcodes/vexp_i.md) - Performs power-of operations between a vector and a scalar.<br>
[vexpseg](../opcodes/vexpseg.md) - Vectorial envelope generator.<br>
[vexpv](../opcodes/vexpv.md) - Performs exponential operations between two vectorial control signals.<br>
[vexpv_i](../opcodes/vexpv_i.md) - Performs exponential operations between two vectorial control signals at init time.<br>
[vibes](../opcodes/vibes.md) - Physical model related to the striking of a metal block as found in a vibraphone.<br>
[vibr](../opcodes/vibr.md) - Easier-to-use user-controllable vibrato.<br>
[vibrato](../opcodes/vibrato.md) - Generates a natural-sounding user-controllable vibrato.<br>
[vincr](../opcodes/vincr.md) - Increments one audio variable with another signal, i.e. it accumulates output.<br>
[vlimit](../opcodes/vlimit.md) - Limits elements of vectorial control signals.<br>
[vlinseg](../opcodes/vlinseg.md) - Vectorial envelope generator.<br>
[vlowres](../opcodes/vlowres.md) - A bank of filters in which the cutoff frequency can be separated under user control.<br>
[vmap](../opcodes/vmap.md) - Maps elements from a vector onto another according to indexes.<br>
[vmirror](../opcodes/vmirror.md) - 'Reflects' elements of vectorial control signals on thresholds.<br>
[vmult](../opcodes/vmult.md) - Multiplies a vector in a table by a scalar value.<br>
[vmult_i](../opcodes/vmult_i.md) - Multiplies a vector in a table by a scalar value.<br>
[vmultv](../opcodes/vmultv.md) - Performs mutiplication between two vectorial control signals.<br>
[vmultv_i](../opcodes/vmultv_i.md) - Performs mutiplication between two vectorial control signals at init time.<br>
[voice](../opcodes/voice.md) - An emulation of a human voice.<br>
[vosim](../opcodes/vosim.md) - Simple vocal simulation based on glottal pulses with formant characteristics.<br>
[vphaseseg](../opcodes/vphaseseg.md) - Allows one-dimensional HVS (Hyper-Vectorial Synthesis).<br>
[vport](../opcodes/vport.md) - Generate a sort of 'vectorial' portamento.<br>
[vpow](../opcodes/vpow.md) - Raises each element of a vector to a scalar power.<br>
[vpow_i](../opcodes/vpow_i.md) - Raises each element of a vector to a scalar power.<br>
[vpowv](../opcodes/vpowv.md) - Performs power-of operations between two vectorial control signals.<br>
[vpowv_i](../opcodes/vpowv_i.md) - Performs power-of operations between two vectorial control signals at init time.<br>
[vps](../opcodes/vps.md) - Shapes a phase signal according to a two-dimensional vector.<br>
[vpvoc](../opcodes/vpvoc.md) - Implements signal reconstruction using an fft-based phase vocoder and an extra envelope.<br>
[vrandh](../opcodes/vrandh.md) - Generates a vector of random numbers stored into a table, holding the values for a period of time.<br>
[vrandi](../opcodes/vrandi.md) - Generate a sort of 'vectorial band-limited noise'.<br>
[vsubv](../opcodes/vsubv.md) - Performs subtraction between two vectorial control signals.<br>
[vsubv_i](../opcodes/vsubv_i.md) - Performs subtraction between two vectorial control signals at init time.<br>
[vtaba](../opcodes/vtaba.md) - Read vectors (from tables -or arrays of vectors) at a-rate.<br>
[vtabi](../opcodes/vtabi.md) - Read vectors (from tables -or arrays of vectors) at init time.<br>
[vtabk](../opcodes/vtabk.md) - Read vectors (from tables -or arrays of vectors) at k-rate.<br>
[vtable1k](../opcodes/vtable1k.md) - Read a vector (several scalars simultaneously) from a table at k-rate.<br>
[vtablea](../opcodes/vtablea.md) - Read vectors (from tables -or arrays of vectors) at a-rate.<br>
[vtablei](../opcodes/vtablei.md) - Read vectors (from tables -or arrays of vectors).<br>
[vtablek](../opcodes/vtablek.md) - Read vectors (from tables -or arrays of vectors) at k-rate.<br>
[vtablewa](../opcodes/vtablewa.md) - Write vectors (to tables -or arrays of vectors) at a-rate.<br>
[vtablewi](../opcodes/vtablewi.md) - Write vectors (to tables -or arrays of vectors) at init time.<br>
[vtablewk](../opcodes/vtablewk.md) - Write vectors (to tables -or arrays of vectors) at k-rate.<br>
[vtabwa](../opcodes/vtabwa.md) - Write vectors (to tables -or arrays of vectors) at a-rate.<br>
[vtabwi](../opcodes/vtabwi.md) - Write vectors (to tables -or arrays of vectors) at init time.<br>
[vtabwk](../opcodes/vtabwk.md) - Write vectors (to tables -or arrays of vectors) at k-rate.<br>
[vwrap](../opcodes/vwrap.md) - Wraps elements of vectorial control signals.<br>
[waveset](../opcodes/waveset.md) - A simple time stretch by repeating cycles.<br>
[weibull](../opcodes/weibull.md) - Weibull distribution random number generator (positive values only).<br>
[wgbow](../opcodes/wgbow.md) - Creates a tone similar to a bowed string.<br>
[wgbowedbar](../opcodes/wgbowedbar.md) - A physical model of a bowed bar.<br>
[wgbrass](../opcodes/wgbrass.md) - Creates a tone related to a brass instrument.<br>
[wgclar](../opcodes/wgclar.md) - Creates a tone similar to a clarinet.<br>
[wgflute](../opcodes/wgflute.md) - Creates a tone similar to a flute.<br>
[wgpluck2](../opcodes/wgpluck2.md) - Physical model of the plucked string.<br>
[wgpluck](../opcodes/wgpluck.md) - A high fidelity simulation of a plucked string, using interpolating delay-lines.<br>
[wguide1](../opcodes/wguide1.md) - A simple waveguide model consisting of one delay-line and one first-order lowpass filter.<br>
[wguide2](../opcodes/wguide2.md) - A model of beaten plate consisting of two parallel delay-lines and two first-order lowpass filters.<br>
[while](../opcodes/while.md) - A syntactic looping construction.<br>
[window](../opcodes/window.md) - Applies a given window shape to a vector stored in an array.<br>
[wrap](../opcodes/wrap.md) - Wraps-around the signal that exceeds the low and high thresholds.<br>
[writescratch](../opcodes/writescratch.md) - Writes one of four scalar values into the scratchpad of the instance of an instrument.<br>
[wterrain2](../opcodes/wterrain2.md) - A wave-terrain synthesis opcode using different curves.<br>
[wterrain](../opcodes/wterrain.md) - A simple wave-terrain synthesis opcode.<br>
[xadsr](../opcodes/xadsr.md) - Calculates the classical ADSR envelope.<br>
[xin](../opcodes/xin.md) - Passes variables to a user-defined opcode block.<br>
[xout](../opcodes/xout.md) - Retrieves variables from a user-defined opcode block.<br>
[xtratim](../opcodes/xtratim.md) - Extend the duration of real-time generated events and handle their extra life (Usually for usage along with [release](../opcodes/release.md) instead of [linenr](../opcodes/linenr.md), [linsegr](../opcodes/linsegr.md), etc).<br>
[xyin](../opcodes/xyin.md) - Sense the cursor position in an output window.<br>
[xyscale](../opcodes/xyscale.md) - 2D linear interpolation.<br>
[zacl](../opcodes/zacl.md) - Clears one or more variables in the za space.<br>
[zakinit](../opcodes/zakinit.md) - Establishes zak space.<br>
[zamod](../opcodes/zamod.md) - Modulates one a-rate signal by a second one.<br>
[zar](../opcodes/zar.md) - Reads from a location in za space at a-rate.<br>
[zarg](../opcodes/zarg.md) - Reads from a location in za space at a-rate, adds some gain.<br>
[zaw](../opcodes/zaw.md) - Writes to a za variable at a-rate without mixing.<br>
[zawm](../opcodes/zawm.md) - Writes to a za variable at a-rate with mixing.<br>
[zdf_1pole](../opcodes/zdf_1pole.md) - Zero-delay feedback implementation of a 1 pole (6 dB/oct) filter.<br>
[zdf_1pole_mode](../opcodes/zdf_1pole_mode.md) - Zero-delay feedback implementation of 1 pole (6 dB/oct) filter with multimode output.<br>
[zdf_2pole](../opcodes/zdf_2pole.md) - Zero-delay feedback implementation of a 2 pole (12 dB/oct) filter.<br>
[zdf_2pole_mode](../opcodes/zdf_2pole_mode.md) - Zero-delay feedback implementation of 2 pole (12 dB/oct) filter with multimode output.<br>
[zdf_ladder](../opcodes/zdf_ladder.md) - Zero-delay feedback implementation of a 4 pole (24 dB/oct) low-pass filter based on the Moog ladder filter.<br>
[zfilter2](../opcodes/zfilter2.md) - Performs filtering using a transposed form-II digital filter lattice with radial pole-shearing and angular pole-warping.<br>
[zir](../opcodes/zir.md) - Reads from a location in zk space at i-rate.<br>
[ziw](../opcodes/ziw.md) - Writes to a zk variable at i-rate without mixing.<br>
[ziwm](../opcodes/ziwm.md) - Writes to a zk variable to an i-rate variable with mixing.<br>
[zkcl](../opcodes/zkcl.md) - Clears one or more variables in the zk space.<br>
[zkmod](../opcodes/zkmod.md) - Facilitates the modulation of one signal by another.<br>
[zkr](../opcodes/zkr.md) - Reads from a location in zk space at k-rate.<br>
[zkw](../opcodes/zkw.md) - Writes to a zk variable at k-rate without mixing.<br>
[zkwm](../opcodes/zkwm.md) - Writes to a zk variable at k-rate with mixing.<br>
[~](../opcodes/opbitnot.md) - Bitwise NOT operator.<br>
