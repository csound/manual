<!--
id:harmon
category:Signal Modifiers:Special Effects
-->
# harmon
Analyze an audio input and generate harmonizing voices in synchrony.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = harmon(asig, kestfrq, kmaxvar, kgenfreq1, kgenfreq2, imode, iminfrq, iprd)
    ```

=== "Classic"
    ``` csound-orc
    ares harmon asig, kestfrq, kmaxvar, kgenfreq1, kgenfreq2, imode, iminfrq, iprd
    ```

### Initialization

_imode_ -- interpreting mode for the generating frequency inputs _kgenfreq1_, _kgenfreq2_. 0: input values are ratios with respect to the audio signal analyzed frequency. 1: input values are the actual requested frequencies in Hz.

_iminfrq_ -- the lowest expected frequency (in Hz) of the audio input. This parameter determines how much of the input is saved for the running analysis, and sets a lower bound on the internal pitch tracker.

_iprd_ -- period of analysis (in seconds). Since the internal pitch analysis can be time-consuming, the input is typically analyzed only each 20 to 50 milliseconds.

### Performance

_kestfrq_ -- estimated frequency of the input.

_kmaxvar_ -- the maximum variance (expects a value betwee 0 and 1).

_kgenfreq1_ -- the first generated frequency.

_kgenfreq2_ -- the second generated frequency.

This unit is a harmonizer, able to provide up to two additional voices with the same amplitude and spectrum as the input. The input analysis is assisted by two things: an input estimated frequency _kestfrq_ (in Hz), and a fractional maximum variance _kmaxvar_ about that estimate which serves to limit the size of the search. Once the real input frequency is determined, the most recent pulse shape is used to generate the other voices at their requested frequencies.

The three frequency inputs can be derived in various ways from a score file or MIDI source. The first is the expected pitch, with a variance parameter allowing for inflections or inaccuracies; if the expected pitch is zero the harmonizer will be silent. The second and third pitches control the output frequencies; if either is zero the harmonizer will output only the non-zero request; if both are zero the harmonizer will be silent. When the requested frequency is higher than the input, the process requires additional computation due to overlapped output pulses. This is currently limited for efficiency reasons, with the result that only one voice can be higher than the input at any one time.

This unit is useful for supplying a background chorus effect on demand, or for correcting the pitch of a faulty input vocal. There is essentially no delay between input and output. Output includes only the generated parts, and does not include the input.

## Examples

Here is an example of the harmon opcode. It uses the file [harmon.csd](../examples/harmon.csd).

``` csound-csd title="Example of the harmon opcode." linenums="1"
--8<-- "examples/harmon.csd"
```

## See also

[Special Effects](../sigmod/speciale.md)

## Credits

Author: Barry L. Vercoe<br>
M.I.T., Cambridge, Mass<br>
1997<br>

New in version 3.47
