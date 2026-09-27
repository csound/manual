<!--
id:reverbsc2
category:Signal Modifiers:Reverberation
-->
# reverbsc2
Applies stereo reverberation using eight delay lines and simpler delay interpolation than reverbsc.

`reverbsc2` uses the same feedback network, delay modulation and damping filters as [reverbsc](reverbsc.md). It changes how the delay lines read samples between stored positions.

## Syntax

=== "Modern"
    ``` csound-orc
    aoutL, aoutR = reverbsc2(ainL, ainR, kfblvl, kfco [, israte [, ipitchm [, iskip]]])
    ```

=== "Classic"
    ``` csound-orc
    aoutL, aoutR reverbsc2 ainL, ainR, kfblvl, kfco [, israte [, ipitchm [, iskip]]]
    ```

### Initialization

`israte` is the sample rate assumed by the delay and filter calculations, in Hz. An omitted or nonpositive value uses the current instrument's sample rate. The chosen rate must be between 5000 and 1000000 Hz. Normally, leave it at the default. Changing it alters delay lengths and damping without changing the rate at which Csound processes audio.

`ipitchm` sets the depth of random delay-time variation. It defaults to 1 and accepts values from 0 to 20. This is a multiplier, not a value in Hz or seconds. Lower values reduce pitch movement in the tail. Zero disables modulation and also disables delay interpolation in `reverbsc2`.

`iskip` defaults to 0, which clears the delay lines and filter state. A nonzero value preserves an already initialized instance during reinitialization when its buffer allocation size stays the same. Keep the other initialization arguments unchanged when retaining a tail.

### Performance

`ainL` and `ainR` are the left and right audio inputs. Either input can feed both output channels through the reverb network.

`aoutL` and `aoutR` contain only the reverberated signal. Add the dry input separately if needed, and keep the instrument running after its input stops so the tail can decay.

`kfblvl` sets feedback gain. Use values from 0 up to, but below, 1 for a decaying tail. Higher values within this range give longer decay. Zero produces no wet output. This control is not a wet/dry mix or a decay time in seconds. Values above 1 can make the feedback grow without bound. A value of 1 does not guarantee an unchanged tail because filtering and interpolation can still remove energy.

`kfco` sets the cutoff of the first-order low-pass filters in the feedback paths, in Hz. Use a positive value no higher than half the effective `israte`. Lower values make high frequencies decay faster.

### Differences from reverbsc

Both opcodes accept the same arguments and defaults. Their delay reads differ as follows.

| Opcode | `ipitchm` | Delay read |
| --- | --- | --- |
| `reverbsc` | Any valid value | Cubic interpolation using four samples |
| `reverbsc2` | Greater than 0 | Linear interpolation using two samples |
| `reverbsc2` | 0 | One stored sample, with no interpolation |

Linear interpolation does less work per delay read, but it also reduces high frequencies more than cubic interpolation. Since the signal passes through the delays repeatedly, this can make the tail darker or shorten its high-frequency decay even when both opcodes have the same `kfco` setting.

With `ipitchm = 0`, the delay lengths stay fixed. `reverbsc2` ignores the fractional part of each read position, while `reverbsc` still interpolates it. The two outputs can therefore differ even with modulation off.

## Examples

The example plays the same short sawtooth burst through four separate reverb instances. First it compares `reverbsc` and `reverbsc2` with the default modulation depth. It then repeats the comparison with modulation off. Each note leaves time for the tail to decay.

Listen for changes in brightness and pitch movement. The dry burst stays at the same level in all four notes.

It uses [reverbsc2.csd](../examples/reverbsc2.csd).

``` csound-csd title="Compare cubic, linear and non-interpolated reverb delays" linenums="1"
--8<-- "examples/reverbsc2.csd"
```

## See also

[reverbsc](reverbsc.md), [freeverb](freeverb.md), [Reverberation](../sigmod/reverbtn.md)

## Credits

Victor Lazzarini added `reverbsc2` in 2025. It builds on Istvan Varga's 2005 C implementation of `reverbsc` and Sean Costello's 1999 Csound orchestra version.
