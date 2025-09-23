<!--
id:lpanal
category:Utilities
-->
# lpanal
Performs both linear predictive and pitch-tracking analysis on a soundfile.

Linear predictive analysis for the Csound [Linear Predictive Coding (LPC) Resynthesis](../spectral/lpcresyn.md) opcodes.

## Syntax
```
csound -U lpanal [flags] infilename outfilename
lpanal [flags] infilename outfilename
```

### Initialization

_lpanal_ performs both lpc and pitch-tracking analysis on a soundfile to produce a time-ordered sequence of _frames_ of control information suitable for Csound resynthesis. Analysis is conditioned by the control flags below. A space is optional between the flag and its value.

_-a_ -- [alternate storage] asks lpanal to write a file with filter poles values rather than the usual filter coefficient files. When _lpread_ / _lpreson_ are used with pole files, automatic stabilization is performed and the filter should not get wild. (This is the default in the Windows GUI) - Changed by Marc Resibois.

_-s srate_ -- sampling rate of the audio input file. This will over-ride the srate of the soundfile header, which otherwise applies. If neither is present, the default is 10000.

_-c channel_ -- channel number sought. The default is 1.

_-b begin_ -- beginning time (in seconds) of the audio segment to be analyzed. The default is 0.0

_-d duration_ -- duration (in seconds) of the audio segment to be analyzed. The default of 0.0 means to the end of the file.

_-p npoles_ -- number of poles for analysis. The default is 34, the maximum 50.

_-h hopsize_ -- hop size (in samples) between frames of analysis. This determines the number of frames per second (srate / hopsize) in the output control file. The analysis framesize is hopsize * 2 samples. The default is 200, the maximum 500.

_-C string_ -- text for the comments field of the lpfile header. The default is the null string.

_-P mincps_ -- lowest frequency (in Hz) of pitch tracking. -P0 means no pitch tracking.

_-Q maxcps_ -- highest frequency (in Hz) of pitch tracking. The narrower the pitch range, the more accurate the pitch estimate. The defaults are -P70, -Q200.

_-v verbosity_ -- level of terminal information during analysis.

* 0 = none
* 1 = verbose
* 2 = debug

The default is 0.

_-X_ -- write machine independent format analysis file.

#### File Format

Output is a file comprised of an identifiable header plus a set of frames of floating point analysis data. Each frame contains four values of pitch and gain information, followed by _npoles_ filter coefficients. The file is readable by Csound's [lpread](../opcodes/lpread.md).

_lpanal_ is an extensive modification of Paul Lanksy's lpc analysis programs.

## Examples

```
lpanal -a -p26 -d2.5 -P100 -Q400 audiofile.test lpfil22
```

will analyze the first 2.5 seconds of file "audiofile.test", producing srate/200 frames per second, each containing 26-pole filter coefficients and a pitch estimate between 100 and 400 Hertz. Stabilized (_-a_) output will be placed in "lpfil22" in the current directory.

Here is an example of the lpanal utility. It uses the file [lpanal.csd](../examples/lpanal.csd).

``` csound-csd title="Example of the lpanal utility." linenums="1"
--8<-- "examples/lpanal.csd"
```
