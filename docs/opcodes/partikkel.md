<!--
id:partikkel
category:Signal Generators:Granular Synthesis
-->
# partikkel
Granular synthesizer with "per grain" control over many of its parameters.  Has a sync input to sychronize its internal grain scheduler clock to an external clock source.

_partikkel_ was conceived after reading Curtis Roads' book "Microsound", and the goal was to create an opcode that was capable of all time-domain varieties of granular synthesis described in this book. The idea being that most of the techniques only differ in parameter values, and by having a single opcode that can do all varieties of granular synthesis makes it possible to interpolate between techniques. Granular synthesis is sometimes dubbed particle synthesis, and it was thought apt to name the opcode _partikkel_ to distinguish it from other granular opcodes.

Some of the input parameters to _partikkel_ is table numbers, pointing to tables where values for the "per grain" parameter changes are stored.  _partikkel_ can use single-cycle or complex (e.g. sampled sound) waveforms as source waveforms for grains. Each grain consists of a mix of 4 source waveforms. Individual tuning of the base frequency can be done for each of the 4 source waveforms. Frequency modulation inside each grain is enabled via an auxillary audio input (_awavfm_). Trainlet synthesis is available, and trainlets can be mixed with wavetable based grains. Up to 8 separate audio outputs can be used. Fractional output values will distribute a grain between two outputs and a "panning law" table can be devised to control the amplitude scaling between output pairs.

## Syntax
=== "Modern"
    ``` csound-orc
    a1 [, a2, a3, a4, a5, a6, a7, a8] = partikkel(agrainfreq, \
          kdistribution, idisttab, async, kenv2amt, ienv2tab, ienv_attack, \
          ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, \
          kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \
          ifmamptab, kfmenv, icosine, ktraincps, knumpartials, kchroma, \
          ichannelmasks, krandommask, kwaveform1, kwaveform2, kwaveform3, \
          kwaveform4, iwaveamptab, asamplepos1, asamplepos2, asamplepos3, \
          asamplepos4, kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains \
          [, iopcode_id, ipanlaws])
    ```

=== "Classic"
    ``` csound-orc
    a1 [, a2, a3, a4, a5, a6, a7, a8] partikkel agrainfreq, \
        kdistribution, idisttab, async, kenv2amt, ienv2tab, ienv_attack, \
        ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, \
        kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \
        ifmamptab, kfmenv, icosine, ktraincps, knumpartials, kchroma, \
        ichannelmasks, krandommask, kwaveform1, kwaveform2, kwaveform3, \
        kwaveform4, iwaveamptab, asamplepos1, asamplepos2, asamplepos3, \
        asamplepos4, kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains \
        [, iopcode_id, ipanlaws]
    ```

### Initialization

_idisttab_ -- function table number, distribution for random grain displacements over time. The table values are interpreted as "displacement amount" scaled by 1/grainrate. This means that a value of 0.5 in the table will displace a grain by half the grainrate period. The table values are read randomly, and scaled by _kdistribution_. For realistic stochastic results, it is advisable not to use a too small table size, as this limits the amount of possible displacement values. This can also be utilized for other purposes, e.g. using quantized displacement values to work with controlled time displacement from the periodic grain rate. If _kdistribution_ is negative, the table values will be read sequentially. A default table might be selected by using -1 as the ftable number, for _idisttab_ the default uses a zero distribution (no displacement).

_ienv_attack_ -- function table number, attack shape of grain. Needs extended guard point. A default table might be selected by using -1 as the ftable number, for _ienv_attack_ the default uses a square window (no enveloping).

_ienv_decay_ -- function table number, decay shape of grain. Needs extended guard point. A default table might be selected by using -1 as the ftable number, for _ienv_decay_ the default uses a square window (no enveloping).

_ienv2tab_ -- function table number, additional envelope applied to grain, done after attack and decay envelopes. Can be used e.g. for fof formant synthesis. Needs extended guard point. A default table might be selected by using -1 as the ftable number, for _ienv2tab_ the default uses a square window (no enveloping).

_icosine_ -- function table number, must contain a cosine, used for trainlets. Table size should be at least 2048 for good quality trainlets.

_igainmasks_ -- function table number, gain per grain. The sequence of values in the table is as follows: index 0 is used as a loop start point in reading the values, index 1 is used as a loop end point. Remaining indices contain gain values (normally in range 0 - 1, but other values are allowed, negative values will invert phase of waveform inside grain) for a sequence of grains, these are read at grain rate enabling exact patterns of "gain per grain". The loop start and end points are zero based with an origin at index 2, e.g. a loop start value of 0 and loop end value of 3 will read indices 2,3,4,5 in a loop at grain rate. A default table might be selected by using -1 as the ftable number, for _igainmasks_ the default disables gain masking (all grains are given a gain masking value of 1).

_ichannelmasks_ -- function table number, see _igainmasks_ for a description of how the values in the table are read. Range is 0 to N, where N is the number of output channels. A value of zero will send the grain to audio output 1 from the opcode. Fractional values are allowed, e.g. a value of 3.5 will mix the grain equally to outputs 4 and 5. The channelmask value wraps around from the last to the first output, so that a vaalue of N-0.5 will mix the grain equally between the last and the first output. If another panning law between outputs is desired, this can be described in the _ipanlaws_ table. The user is responsible for keeping the values in range, the opcode will crash with out of range values. A default table might be selected by using -1 as the ftable number, for _ichannelmasks_ the default disables channel masking (all grains are given a channel masking value of 0 and are sent to _partikkel_ audio out 1).

_iwavfreqstarttab_ -- function table number, see _igainmasks_ for a description of how the values in the table are read. Start frequency multiplicator for each grain. Pitch will glide from start frequency to end frequency following a line or curve as set by _ksweepshape_. A default table might be selected by using -1 as the ftable number, for _iwavfreqstarttab_ the default uses a multiplicator of 1, disabling any start frequency modification.

_iwavfreqendtab_ -- function table number, see _iwavfreqstarttab_. End frequency multiplicator for each grain. A default table might be selected by using -1 as the ftable number, for _iwavfreqendtab_ the default uses a multiplicator of 1, disabling any end frequency modification.

_ifmamptab_ -- function table number, see _igainmasks_ for a description of how the values in the table are read. Frequency modulation index per grain. The signal _awavfm_ will be multiplied by values read from this table. A default table might be selected by using -1 as the ftable number, for _ifmamptab_ the default uses 1 as the index multiplicator, enabling fm for all grains.

_iwaveamptab_ -- function table number, the indices are read in a similar way to what is used for _igainmasks_. Index 0 is used as a loop start point, and index 1 is used as a loop end point. The rest of the indices are read in groups of 5, where each value represent a gain value for each of the 4 source waveforms, and the 5th value represent trainlet amplitude. A default table might be selected by using -1 as the ftable number, for _iwaveamptab_ the default uses an equal mix of all 4 source waveforms (each with an amplitude of 0.5) and setting trainlet amp to zero.

Computation of trainlets can be CPU intensive, and setting _ktrainamp_ to zero will skip most of the trainlet computations. Trainlets will be normalized to peak (_ktrainamp_), compensating for amplitude variations caused by variations in _kpartials_ and _kchroma_.

_imax_grains_ -- maximum number of grains per k-period. Estimating a large value should not affect performance, exceeding this value will lead to "oldest grains" being deleted.

_iopcode_id_ -- the opcode id, linking an instance of _partikkel_ to an instance of [partikkelsync](../opcodes/partikkelsync.md), the linked _partikkelsync_ will output trigger pulses synchronized to _partikkel_'s grain maker scheduler. The default value is zero, which means no connection to any _partikkelsync_ instances.

_ipanlaws_ -- function table number. The table describes the panning curve used for fractional channelmask values. Fractional channelmask values will mix a grain to two neighbouring outputs, with the relative gain set by the fractional value. By default if no _ipanlaws_ table is described, a linear gain relationship is used, so that a channelmask value of e.g. 1.5 distributes the grain with 0.5 gain to output 2 and 0.5 gain to output 3. The _ipanlaws_ table can be used to describe other gain control curves (panning laws). The table should contain 8 such gain control curves, each governing the panning between two neighbouring outputs. The curves should appear one after another in the table, in a concatenated fashion. GEN 18 can be used to create this table from separate panning curve tables (see example below). The first curve describes the panning law between output 1 and output 2, the next is for panning between outputs 2 and 3, and so on. The last curve describes the panning law between the last and the first output. The table is indexed by the channelmask value such that one output (of an output pair goverened by the panning law) uses the index (tablesize/8*channelmask) while the other of the two outputs reads the value at index (tablesize/8*(int(channelmask+1)-frac(channelmask))). This means that if the panning law value halfway between these two channel masks is e.g. 0.7 (which would give approximately equal power panning), then each of those two outputs will use 0.7 as the gain value.

### Performance

_xgrainfreq_ -- number of grains per second. A value of zero is allowed, and this will defer all grain scheduling to the sync input.

_async_ -- sync input. Input values are added to the phase value of the internal grain maker clock, enabling tempo synchronization with an external clock source. As this is an a-rate signal, inputs are usually pulses of length 1/_sr_. Using such pulses, the internal phase value can be "nudged" up or down, enabling soft or hard synchronization. Negative input values decrements the internal phase, while positive values in the range 0 to 1 increments the internal phase. An input value of 1 will always make _partikkel_ generate a grain. If the value remains at 1, the internal grain scheduler clock will pause but any currently playing grains will still play to end.

_kdistribution_ -- periodic or stochastic distribution of grains, 0 = periodic. Stochastic grain displacement is in the range of _kdistribution/grainrate_ seconds. The stochastic distribution profile (random distribution) can be set in the _idisttab_ table. If _kdistribution_ is negative, the result is deterministic time displacement as described by _idisttab_ (sequential read of displacement values). Maximum grain displacement in all cases is limited to 10 seconds, and a grain will keep the values (duration, pitch etc) it was given when it was first generated (before time displacement). Since grain displacement is relative to the grain rate, displacement amount is undefined at 0Hz grain rate and kdistribution is completely disabled in this case.

_kenv2amt_ -- amount of enveloping for the secondary envelope for each grain. Range 0 to 1, where 0 is no secondary enveloping (square window), a value of 0.5 will use an interpolation between a square window and the shape set by _ienv2tab_.

_ksustain_amount_ -- sustain time as fraction of grain duration. I.e. balance between enveloped time(attack+decay) and sustain level time. The sustain level is taken from the last value of the _ienv_attack_ ftable.

_ka_d_ratio_ -- balance between attack time and decay time. For example, with _ksustain_amount_ set to 0.5 and _ka_d_ratio_ set to 0.5, the attack envelope of each grain will take 25% of the grain duration, full amplitude (sustain) will be held for 50% of the grain duration, and the decay envelope will take the remaining 25% of the grain duration.

_kduration_ -- grain duration in milliseconds.

_kamp_ -- amplitude scaling of the opcode's output. Multiplied by per grain amplitude read from _igainmasks_. Source waveform playback inside grains can consume a significant amount of CPU cycles, especially if grain duration is long so that we have a lot of overlapping grains. Setting kamp to zero will skip waveform playback inside grains (and not generate any sound, obviously). This can be used as a "soft" bypass method if we want to keep the opcode active but silent for some periods of time.

_kwavfreq_ -- transposition scaling. Multiplied with start and end transposition values read from _iwavfreqstarttab_ and _iwavfreqendtab_.

_ksweepshape_ -- transposition sweep shape, controls the curvature of the transposition sweep. Range 0 to 1. Low values will hold the transposition at the start value longer and then drop to the end value quickly, high values will drop to the end value quickly. A value of 0.5 will give a linear sweep. A value of exactly 0 will bypass sweep and only use the start frequency, while a value of exactly 1 will bypass sweep and only use the end frequency. The sweep generator might be slightly inaccurate in hitting the end frequency when using a steep curve and very long grains.

_awavfm_ -- audio input for frequency modulation inside grain.

_kfmenv_ -- function table number, envelope for FM modulator signal enabling the modulation index to change over the duration of a grain.

_ktraincps_ -- trainlet fundamental frequency.

_knumpartials_ -- number of partials in trainlets.

_kchroma_ -- chroma of trainlets. A value of 1 give equal amplitude to each partial, higher values will reduce the amplitude of lower partials while strengthening the amplitude of the higher partials.

_krandommask_ -- random masking (muting) of individual grains. Range 0 to 1, where a value of 0 will give no masking (all grains are played), and a value of 1 will mute all grains.

_kwaveform1_ -- table number for source waveform 1.

_kwaveform2_ -- table number for source waveform 2.

_kwaveform3_ -- table number for source waveform 3.

_kwaveform4_ -- table number for source waveform 4.

_asamplepos1_ -- start position for reading source waveform 1 (in range 0..1).

_asamplepos2_ -- start position for reading source waveform 2.

_asamplepos3_ -- start position for reading source waveform 3.

_asamplepos4_ -- start position for reading source waveform 4.

_kwavekey1_ -- original key of source waveform 1. Can be used to transpose each source waveform independently.

_kwavekey2_ -- as _kwavekey1_, but for source waveform 2.

_kwavekey3_ -- as _kwavekey1_, but for source waveform 3.

_kwavekey4_ -- as _kwavekey1_, but for source waveform 4.

## Examples

Here is an example of the partikkel opcode. It uses the file [partikkel.csd](../examples/partikkel.csd).

``` csound-orc title="Example of the partikkel opcode." linenums="1"
--8<-- "examples/partikkel.csd"
```

Here is another example of the partikkel opcode. It uses the file [partikkel-2.csd](../examples/partikkel-2.csd).

``` csound-orc title="Example 2 of the partikkel opcode." linenums="1"
--8<-- "examples/partikkel-2.csd"
```

Here is an example of using panning laws with channelmasks in partikkel. It uses the file [partikkel-panlaws.csd](../examples/partikkel-panlaws.csd).

``` csound-orc title="Example with panning laws with channel masks." linenums="1"
--8<-- "examples/partikkel-panlaws.csd"
```

## See Also

[Granular Synthesis](../siggen/granular.md)

## Credits

Author: Thom Johansen<br>
Author: Torgeir Strand Henriksen<br>
Author: Øyvind Brandtsegg<br>
April 2007<br>

Examples written by Joachim Heintz and Øyvind Brandtsegg.

New in version 5.06
