# CsBeats

_Csbeats_ is an alternative score language that is aimed at specifying simple scores in standard western tunings and rhythms.  _Csbeats_ can be invoked via the CsScore component of a standard .csd score with _bin="csbeats"_ or as stand-alone program which generates a standard numeric score.

As a stand-alone the program reads standard input and writes to standard output.

The _csbeats_ language is very simple, having only five kinds of statement, and only one of them has any complexity.  In general the introductory word for each statement type is case insensitive, so "QUIT", "quit", "QuIt"... are all the same.  Comments can be introduced in either ANSI C89 format or C++ (that is either `\* ... \*` or `//` to the end of line) or Csound's semicolon `;`.

* _QUIT_

    Causes csbeats to exit.  For flexibility the command _END_ is also accepted for the identical action.

* _BEATS_=integer

    Sets the number of beats per minute for the following score until the end or until it is reset.  The default value is 60bpm.  The token _BPS_ is also acceptable instead of BEATS.

* _PERMEASURE_=integer

    Sets the number of beats in a bar.  The default value is 4.

* _BAR_

    Start a new bar.

* _BAR_ integer

    Start the bar whose number is given.

*  _i_ integer attributes

    Specified a note event for the numbered instrument. The attributes may be any of a pitch, duration or dynamic, or a positioning of the note to a beat or measure, and can be in any order.

    Pitches are specified with a conventional note name (English form) in upper case optionally followed by a #, x (for double sharp), b (for flat) or bb (for double flat). A note of Z is a rest (think zzzz). All notes except rests must be followed by an octave number, with A4 being international A (440Hz). Pitches are passed to Csound in Hertz in the parameter p4, and are twelve tone equal temperament.

    Durations are coded in lower case with the initial letter of the name for **w**hole, **h**alf, **q**uarter, **e**igth and **s**ixteeth notes, or **th** for thirtysecondth notes. Except for **w** these can be moderated by appending as suffix:

       * _d_ or _._ Dotted note (half as long again)
       * _dd_ or _.._ Dotted note (three quarters as long again)
       * _t_ Triplet note (third notes in two)
       * _t._ Dotted triplet note
       * _q_ Quintuplet (Five notes in four)
       * _s_ Septuplet (Seven notes in eight)

    Durations can be added together by giving more that one duration.  To make this more intuitive a + sign can be used instead of white space.
    
    The dynamics are written in conventional notation, that is fff, ff, f, mf, mp, p, pp, ppp, pppp.  These are passed to the instrument as p5 as 0 for fff, and one less dB for each step below.  The default dynamic is fortissimo.
    
    Additional parameters (p-fields) can be specified in an instrument statement by giving statements like _p6=42_ which would set the p6 field to 42 until it is changed.  The number must be 6 or greater as the first 5 fields are taken with fixed information.  Each instrument number has its own additional parameters.
    
    If any of these attributes is missing it carried forward from the previous note, with beat position being incremented to the end of the previous note.
    
    In addition an event can be directed to a particular measure with an m attribute or a particular beat with a b.

The opening of Bach's Goldberg variation number 3 can be coded as:

```
; Bach - Goldberg Variations - Variato 3
; by Brian Baughn 3-14-05
; bbaughn@berklee.net
beats = 120
permeasure = 6

i101    m1 b1 B4 mp qd+s
i101          C5    s
i101          D5
i101          C5
i101          D5
i101          E5
i101          A4    qd+s
i101          B4    s
i101          C5
i101          B4
i101          C5
i101          D5

i101    m2 b1 G4    qd
i101          G5    qd+e
i101          A5    s
i101          G5 csound-orc
i101          F#5
i101          G5
i101          A5    e

i101  m3 b1.5 D5    s
i101          C5
i101          B4
i101          A4
i101          B4    e
i101          C5    s
i101          B4
i101          A4
i101          B4
i101          G4    e
i101          E5
i101          D5
i101          C5
i101          F#5
i101          A5

i101  m4 b1   B4    q
i101          G5    e
i101          G5    q
i101          F#5   e
i101          Z     e   // Z is a rest (zzzzz..)
i101                e
i101          B5    e
i101          A5    q
i101          D5    e

quit
```

This produces output

``` csound-sco
;;;setting bpm=120.000000
;;;setting permeasure=6
i101 0.000000 0.875000 493.883621 -4
i101 0.875000 0.125000 523.251131 -4
i101 1.000000 0.125000 587.329536 -4
i101 1.125000 0.125000 523.251131 -4
i101 1.250000 0.125000 587.329536 -4
i101 1.375000 0.125000 659.255114 -4
i101 1.500000 0.875000 440.000000 -4
i101 2.375000 0.125000 493.883621 -4
i101 2.500000 0.125000 523.251131 -4
i101 2.625000 0.125000 493.883621 -4
i101 2.750000 0.125000 523.251131 -4
i101 2.875000 0.125000 587.329536 -4
i101 3.000000 0.750000 391.995436 -4
i101 3.750000 1.000000 783.990872 -4
i101 4.750000 0.125000 880.000000 -4
i101 4.875000 0.125000 783.990872 -4
i101 5.000000 0.125000 739.988845 -4
i101 5.125000 0.125000 783.990872 -4
i101 5.250000 0.250000 880.000000 -4
i101 6.250000 0.125000 587.329536 -4
i101 6.375000 0.125000 523.251131 -4
i101 6.500000 0.125000 493.883621 -4
i101 6.625000 0.125000 440.000000 -4
i101 6.750000 0.250000 493.883621 -4
i101 7.000000 0.125000 523.251131 -4
i101 7.125000 0.125000 493.883621 -4
i101 7.250000 0.125000 440.000000 -4
i101 7.375000 0.125000 493.883621 -4
i101 7.500000 0.250000 391.995436 -4
i101 7.750000 0.250000 659.255114 -4
i101 8.000000 0.250000 587.329536 -4
i101 8.250000 0.250000 523.251131 -4
i101 8.500000 0.250000 739.988845 -4
i101 8.750000 0.250000 880.000000 -4
i101 9.000000 0.500000 493.883621 -4
i101 9.500000 0.250000 783.990872 -4
i101 9.750000 0.500000 783.990872 -4
i101 10.250000 0.250000 739.988845 -4
;;rest at 10.500000 for 0.250000
;;rest at 10.750000 for 0.250000
i101 11.000000 0.250000 987.767243 -4
i101 11.250000 0.500000 880.000000 -4
i101 11.750000 0.250000 587.329536 -4
e
```

A Complete Example

Here is a simple example of the _csbeats_ score generator. It uses the file [csbeats.csd](examples/csbeats.csd).

``` csound-csd title="A simple example of csbeats." linenums="1"
--8<-- "examples/csbeats.csd"
```
