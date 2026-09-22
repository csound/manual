<!--
id:lpform
category:Spectral Processing:LPC
-->
# lpform
Reads a formant's center frequency and bandwidth from an LPC pole analysis.

Use `lpform` to inspect resonances in a recorded voice or to use their frequency and bandwidth to control a filter. It reads the analysis loaded by [lpread](lpread.md), rather than analyzing an audio signal itself.

## Syntax

=== "Modern"
    ``` csound-orc
    kfrequency, kbandwidth = lpform(kformant)
    ```

=== "Classic"
    ``` csound-orc
    kfrequency, kbandwidth lpform kformant
    ```

### Initialization

Create the analysis with [lpanal](../utility/lpanal.md) and its `-a` option, which stores poles. The usual coefficient file does not work with `lpform`.

Select an LPC slot with [lpslot](lpslot.md), then call `lpread` before `lpform`. At initialization, `lpform` connects to the analysis in the selected slot. It reports an error if the slot has no analysis. Keep `lpread` before `lpform` in the instrument so the formant data follows the current analysis time on each control cycle.

Use the same orchestra sample rate as the analyzed sound. `lpform` uses the orchestra's `sr` to convert pole angles and radii into Hz.

### Performance

`kformant` selects a pole pair, starting at 1. An analysis with 20 poles has 10 pairs. Use an integer from 1 to half the pole count. The opcode discards the fractional part and limits the index to the available range, so values below 1 select the first pair and values above the last pair select the last.

`kfrequency` is the center frequency in Hz. `kbandwidth` is the bandwidth estimate in Hz. Both outputs run at control rate. The bandwidth has a lower limit of 1 Hz and an upper limit of `sr/2`.

`lpread` orders the poles by the absolute value of their angle, so lower indices select lower-frequency pairs. These are resonances of the LPC model, not guaranteed speech formants. Their order can change as the poles move. The outputs do not include amplitude or pitch.

Changing `kformant` selects another pair. Changing the time pointer passed to `lpread` moves through the recorded analysis. The two controls serve different purposes.

## Examples

The example plays the first 2.5 seconds of the manual's [fox.wav](../examples/fox.wav) speech sample and prints the first two frequency and bandwidth estimates every tenth of a second. Use it to compare the changes in a voice's sound with the resonances found by LPC.

Save `fox.wav` and [lpform.csd](../examples/lpform.csd) in the same directory. From that directory, create a pole analysis and run the example.

``` shell
csound -U lpanal -a -p20 -h256 -P0 fox.wav lpform-poles.lpc
csound lpform.csd
```

`-a` selects pole storage, `-p20` selects 20 poles, and `-h256` sets the analysis hop to 256 samples. `-P0` disables pitch tracking, which this example does not need. Use the same Csound build for both commands. The sample and orchestra both use 44100 Hz.

``` csound-csd title="Inspect LPC resonances in a spoken phrase" linenums="1"
--8<-- "examples/lpform.csd"
```

## See also

[lpread](lpread.md), [lpslot](lpslot.md), [lpreson](lpreson.md), [lpinterp](lpinterp.md), [lpanal](../utility/lpanal.md), [Linear Predictive Coding](../spectral/lpcresyn.md)

## Credits

Author Victor Lazzarini, 2009.
