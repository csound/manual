# Preprocessing of Standard Scores

A *Score* (a collection of score statements) is divided into time-ordered sections by the [s statement](../scoregens/s.md). Before being read by the orchestra, a score is preprocessed one section at a time. Each section is normally processed by 3 routines:  [Carry](#carry), [Tempo](#tempo), and [Sort](#sort).

## Carry
Within a group of consecutive [i statements](../scoregens/i.md) whose `p1` whole numbers correspond, any parameter-field left empty will take its value from the same p-field of the preceding statement. An empty p-field can be denoted by a single point (.) delimited by spaces. No point is required after the last nonempty p-field. The output of Carry preprocessing will show the carried values explicitly. The Carry Feature is not affected by intervening comments or blank lines; it is turned off only by a non-*i statement* or by an *i statement* with unlike `p1` whole number.

> :memo: **Note**
>
> It is possible to switch automatic carrying off. This can be done with the score statement `C 0`, and can be restored with `C 1`. Carrying is always active for pfields `p1`, `p2` and `p3`.

Three additional features are available for `p2` alone: `+`, `^+`*x*, and `^-`*x*. The symbol `+` in `p2` will be given the value of `p2 + p3` from the preceding *i statement*. This enables note action times to be automatically determined from the sum of preceding durations. The `+` symbol can itself be carried. It is legal only in `p2`. E.g.: the statements

``` csound-sco
i1   0    .5        100
i .  +
i
```

will result in

``` csound-sco
i1   0         .5        100
i1   .5        .5        100
i1   1         .5        100
```

The symbols `^+`*x* and `^-`*x* determine the current `p2` by adding or subtracting, respectively, the value of *x* from the preceding `p2`. These may be used in `p2` only and are not carried like the `+` symbol. Note also that there should be no spaces following the `^`, the `+`, or the `-` parts of these symbols — the number must come directly after as in `^+2.3`. If the example above had been

``` csound-sco
i1   0    .5        100
i .  ^+1
i .  ^+1
```

the result would instead be

``` csound-sco
i1   0         .5        100
i1   1         .5        100
i1   2         .5        100
```

The Carry feature should be used liberally. Its use, especially in large scores, can greatly reduce input typing and will simplify later changes.
    
There can sometimes be circumstances where you do not want "missing" p-fields after the last one entered to be implicitly carried. An example would be an instrument designed to take a variable number of p-fields. Beginning with Csound 5.08, you prevent the implicit carrying of p-fields at the end of an *i statement* by using the symbol `!` (called the "no-carry symbol"). The `!` must appear at the end of an *i statement* and it cannot be used in `p1`, `p2`, or `p3`, since these p-fields are required. Here is an example:

``` csound-sco
i1   0    .5        100
i .  +
i .  .    .         !
i
```

This score would be interpreted as

``` csound-sco
i1   0         .5        100
i1   .5        .5        100
i1   1         .5               ; no p4
i1   1.5       .5               ; only p1 to p3 are carried here
```

An alternative to using `!` is to switch automatic carrying off apart from `p1`, `p2` and `p3`.  This can be done with the score opcode statement `C 0`, and can be restored with `C 1`.

## Tempo

This operation time warps a score section according to the information in a [t statement](../scoregens/t.md). The tempo operation converts `p2` (and, for [i statements](../scoregens/i.md), `p3`) from original beats into real seconds, since those are the units required by the orchestra. After time warping, score files will be seen to have orchestra-readable format demonstrated by the following:

``` csound-sco
i p1 p2beats p2seconds
       p3beats p3seconds p4 p5 ....
```

## Sort

This routine sorts all action-time statements into chronological order by `p2` value. It also sorts coincident events into precedence order. Whenever an [f statement](../scoregens/f.md) and an [i statement](../scoregens/i.md) have the same `p2` value, the *f statement* will precede. Whenever two or more *i statements* have the same `p2` value, they will be sorted into ascending `p1` value order. If they also have the same `p1` value, they will be sorted into ascending `p3` value order. Score sorting is done section by section (see [s statement](../scoregens/s.md)). Automatic sorting implies that score statements may appear in any order within a section.

> :memo: **Note**
>
> The operations Carry, Tempo and Sort are combined in a 3-phase single pass over a score file, to produce a new file in orchestra-readable format (see the Tempo example). Processing can be invoked either explicitly by the *Scsort* command, or implicitly by Csound which processes the score before calling the orchestra. Source-format files and orchestra-readable files are both in ASCII character form, and may be either perused or further modified by standard text editors. User-written routines can be used to modify score files before or after the above processes, provided the final orchestra-readable statement format is not violated. Sections of different formats can be sequentially batched; and sections of like format can be merged for automatic sorting.

## Next-P and Previous-P Symbols

At the close of any of the operations [Carry](#carry), [Tempo](#tempo), and [Sort](#sort), three additional score features are interpreted during file writeout: next-p, previous-p, and ramping.

[i statement](../scoregens/i.md) p-fields containing the symbols `np`*x* or `pp`*x* (where *x* is some integer) will be replaced by the appropriate p-field value found on the next *i statement* (or previous *i statement*) that has the same `p1`. For example, the symbol `np7` will be replaced by the value found in `p7` of the next note that is to be played by this instrument. `np` and `pp` symbols are recursive and can reference other `np` and `pp` symbols which can reference others, etc. References must eventually terminate in a real number or a ramp symbol. Closed loop references should be avoided. `np` and `pp` symbols are illegal in `p1`, `p2` and `p3` (although they may reference these). `np` and `pp` symbols may be Carried. `np` and `pp` references cannot cross a Section boundary. Any forward or backward reference to a non-existent note-statement will be given the value zero.

E.g.: the statements

``` csound-sco
i1   0    1    10   np4  pp5 
i1   1    1    20
i1   1    1    30
```

will result in

``` csound-sco
i1   0    1    10   20   0 
i1   1    1    20   30   20 
i1   2    1    30   0    30
```

`np` and `pp` symbols can provide an instrument with contextual knowledge of the score, enabling it to glissando or crescendo, for instance, toward the pitch or dynamic of some future event (which may or may not be immediately adjacent). Note that while the Carry feature will propagate `np` and `pp` through unsorted statements, the operation that interprets these symbols is acting on a fully sorted version of the score. The tempo operation is applied after the `pp` and/or `np` processing.

## Ramping

[i statement](../scoregens/i.md) p-fields containing the symbol `<` will be replaced by values derived from linear interpolation of a time-based ramp. Ramps are anchored at each end by the first real number found in the same p-field of a preceding and following note played by the same instrument. E.g.: the statements

``` csound-sco
i1   0    1    100
i1   1    1    <
i1   2    1    <
i1   3    1    400
i1   4    1    <
i1   5    1    0
```

will result in

``` csound-sco
i1   0    1    100 
i1   1    1    200
i1   2    1    300
i1   3    1    400
i1   4    1    200
i1   5    1    0
```

Ramps cannot cross a Section boundary. Ramps cannot be anchored by an `np` or `pp` symbol (although they may be referenced by these). Ramp symbols are illegal in `p1`, `p2` and `p3`. Ramp symbols may be Carried. Note, however, that while the Carry feature will propagate ramp symbols through unsorted statements, the operation that interprets these symbols is acting on a time-warped and fully sorted version of the score. In fact, time-based linear interpolation is based on warped score-time, so that a ramp which spans a group of accelerating notes will remain linear with respect to strict chronological time.

Starting with Csound version 3.52, using the symbols `(` or `)` will result in an exponential interpolation ramp, similar to [expon](../opcodes/expon.md). Using the symbol `˜` (a tilde) will result in uniform, random distribution between the first and last values of the ramp. Use of these functions must follow the same rules as the linear ramp function. 

## Extract

This feature will extract a segment of a sorted numeric score file according to instructions taken from a control file. The control file contains an instrument list and two time points, from and to, in the form:

```
instruments 1  2  from  1:27.5  to  2:2
```

The component labels may be abbreviated as i, f and t. The time points denote the beginning and end of the extract in terms of:

```
[section no.] : [beat no.].
```

Each of the three parts of the argument is optional. The default values for missing i, f or t are:

```
all instruments, beginning of score, end of score.
```