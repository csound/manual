<!--
id:i
category:
-->
# i Statement (Instrument or Note Statement)
Makes an instrument active at a specific time and for a certain duration.

The parameter field values are passed to that instrument prior to its initialization, and remain valid throughout its Performance.

## Syntax
``` csound-orc
i  p1  p2  p3  p4  ...
```

### Initialization

_p1_ -- Instrument number, usually a non-negative integer. An optional fractional part can provide an additional tag for specifying ties between particular notes of consecutive clusters. A negative p1 (including tag) can be used to turn off a particular &#8220;held&#8221; note.  In the case of a named instrument it can be negated by having a '-' as the first character of the string.

_p2_ -- Starting time in arbitrary units called beats.

_p3_ -- Duration time in beats (usually positive). A negative value will initiate a  held note (see also [ihold](../opcodes/ihold.md)). A negative value can also be used for 'always on' instruments like reverberation. These notes are not terminated by [s statements](../scoregens/s.md) A zero value will invoke an initialization pass without performance (see also [instr](../opcodes/instr.md)).

_p4 ..._ -- Parameters whose significance is determined by the instrument.

### Performance

Beats are evaluated as seconds, unless there is a [t statement](../scoregens/t.md) in this score section or a [-t flag](../invoke/cs-options-by-category.md#-t-num-temponum) in the command-line.

Starting or action times are relative to the beginning of a section ( see [s statement](../scoregens/s.md)), which is assigned time 0.

Note statements within a section may be placed in any order. Before being sent to an orchestra, unordered score statements must first be processed by Sorter, which will reorder them by ascending p2 value. Notes with the same p2 value will be ordered by ascending p1; if the same p1, then by ascending p3.

Notes may be stacked, i.e., a single instrument can perform any number of notes simultaneously. (The necessary copies of the instrument's data space will be allocated dynamically by the orchestra loader.) Each note will normally turn off when its p3 duration has expired, or on receipt of a MIDI noteoff signal. An instrument can modify its own duration either by changing its p3 value during note initialization, or by prolonging itself through the action of a [linenr](../opcodes/linenr.md) or [xtratim](../opcodes/xtratim.md) unit.

An instrument may be turned on and left to perform indefinitely either by giving it a negative p3 or by including an _ihold_ in its i-time code. If a held note is active, an _i statement_ _with matching p1_ will not cause a new allocation but will take over the data space of the held note. The new pfields (including p3) will now be in effect, and an i-time pass will be executed in which the units can either be newly initialized or allowed to continue as required for a tied note (see [tigoto](../opcodes/tigoto.md)). A held note may be succeeded either by another held note or by a note of finite duration. A held note will continue to perform across section endings (see [s statement](../scoregens/s.md)). It is halted only by [turnoff](../opcodes/turnoff.md) or by an _i statement_ with negative matching p1 or by an [e statement](../scoregens/e.md).

It is possible to have multiple instances (usually, but not necessarily, notes of different pitches) of the same instrument, held simultaneously, via negative p3 values. The instrument can then be fed new parameters from the score. This is useful for avoiding long hard-coded _linseg_s, and can be accomplished by adding a decimal part to the instrument number.

For example, to hold three copies of instrument 10 in a simple chord:

``` csound-sco
i10.1    0    -1    7.00
i10.2    0    -1    7.04
i10.3    0    -1    7.07
```

Subsequent _i_ statements can refer to the same sounding note instances, and if the instrument definition is done properly, the new p-fields can be used to alter the character of the notes in progress.  For example, to bend the previous chord up an octave and release it:

``` csound-sco
i10.1    1    1    8.00
i10.2    1    1    8.04
i10.3    1    1    8.07
```

> :information_source: **Tip**
> 
> When turning off notes, bear in mind that i 1.1 == i 1.10 and i 1.1 != i 1.01. The maximum number of decimal places that can be used depends on the precision Csound was compiled with.

The instrument definition has to take this into account, however, especially if clicks are to be avoided (see the example below).

Note that the decimal instrument number notation cannot be used in conjunction with real-time MIDI. In this case, the instrument would be monophonic while a note was held.

Notes being tied to previous instances of the same instrument, should skip most initialization by means of [tigoto](../opcodes/tigoto.md), except for the values entered in score. For example, all table reading opcodes in the instrument, should usually be skipped, as they store their phase internally. If this is suddenly changed, there will be audible clicks in the output.

Note that many opcodes (such as _delay_ and _reverb_) are prepared for optional initialization. To use this feature, the [tival opcode](../opcodes/tival.md) is suitable. Therefore, they need not be hidden by a _tigoto_ jump.

Beginning with Csound version 3.53, strings are recognized in  p-fields for opcodes that accept them (_convolve, adsyn, diskin,_ etc.).

You can also turnoff notes from the score by using a negative number for the instrument (p1). This is equivalent to using the [turnoff2](../opcodes/turnoff2.md) opcode. When a note is turned off from the score, it is allowed to release (if [xtratim](../opcodes/xtratim.md) or opcodes with release section like [linenr](../opcodes/linenr.md) are used) and only notes with the same fractional part are turned off. Also, only the last instance of the instrument will be turned off, so there have to be as many negative instrument numbers as positive ones for all notes to be turned off.

``` csound-sco
i 1.1    1    300    8.00
i 1.2    1    300    8.04
i 1.3    1    -300    8.07
i 1.3    1    -300    8.09

; notice that p-fields after p2 will be ignored if
; instrument number is negative
i -1.1    3    1    4.00
i -1.2    4    51    4.04
i -1.3    5    1    4.07
i -1.3    6    10    4.09
```

### Special Considerations

The maximum instrument number used to be 200. This has been changed to be limited by memory only (currently there is an internal soft limit of 200; this is automatically extended as required).

## Examples

Here is an example of the i statement. It uses the file [i_statement.csd](../examples/i_statement.csd).

``` csound-csd title="Example of the i statement." linenums="1"
--8<-- "examples/i_statement.csd"
```

## See Also

[Score Statements](../score/statemnt.md)

## Credits

Additional text (Csound Version 4.07) explaining tied notes, edited by Rasmus Ekman from a note by David Kirsh, posted to the Csound mailing list. Example instrument by Rasmus Ekman.

Updated August 2002 thanks to a note from Rasmus Ekman. There is no longer a hard limit of 200 instruments.
