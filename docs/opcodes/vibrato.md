<!--
id:vibrato
category:Signal Generators:Basic Oscillators
-->
# vibrato
Generates a natural-sounding user-controllable vibrato.

## Syntax
=== "Modern"
    ``` csound-orc
    kout = vibrato(kAverageAmp, kAverageFreq, kRandAmountAmp, kRandAmountFreq, \
                   kAmpMinRate, kAmpMaxRate, kcpsMinRate, kcpsMaxRate, ifn [, iphs])
    ```

=== "Classic"
    ``` csound-orc
    kout vibrato kAverageAmp, kAverageFreq, kRandAmountAmp, kRandAmountFreq, \
                 kAmpMinRate, kAmpMaxRate, kcpsMinRate, kcpsMaxRate, ifn [, iphs]
    ```

### Initialization

_ifn_ -- Number of vibrato table. It normally contains a sine or a triangle wave.

_iphs_ -- (optional) Initial phase of table, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is 0.

### Performance

_kAverageAmp_ -- Average amplitude value of vibrato

_kAverageFreq_ -- Average frequency value of vibrato (in cps)

_kRandAmountAmp_ -- Amount of random amplitude deviation

_kRandAmountFreq_ -- Amount of random frequency deviation

_kAmpMinRate_ -- Minimum frequency of random amplitude deviation segments (in cps)

_kAmpMaxRate_ -- Maximum frequency of random amplitude deviation segments (in cps)

_kcpsMinRate_ -- Minimum frequency of random frequency deviation segments (in cps)

_kcpsMaxRate_ -- Maximum frequency of random frequency deviation segments (in cps)

_vibrato_ outputs a natural-sounding user-controllable vibrato. The concept is to randomly vary both frequency and amplitude of the oscillator generating the vibrato, in order to simulate the irregularities of a real vibrato.

In order to have a total control of these random variations, several input arguments are present. Random variations are obtained by two separated segmented lines, the first controlling amplitude deviations, the second the frequency deviations. Average duration of each segment of each line can be shortened or enlarged by the arguments _kAmpMinRate_, _kAmpMaxRate_, _kcpsMinRate_, _kcpsMaxRate_, and the deviation from the average amplitude and frequency values can be independently adjusted by means of _kRandAmountAmp_ and _kRandAmountFreq_.

## Examples

Here is an example of the vibrato opcode. It uses the file [vibrato.csd](../examples/vibrato.csd).

``` csound-orc title="Example of the vibrato opcode." linenums="1"
--8<-- "examples/vibrato.csd"
```

## See also

[Basic Oscillators](../siggen/basic.md)

## Credits

Author: Gabriel Maldonado

New in Version 4.15
