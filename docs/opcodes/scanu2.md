<!--
id:scanu2
category:Signal Generators:Scanned Synthesis
-->
# scanu2
Compute the waveform and the wavetable for use in scanned synthesis.

Plugin opcode in scansyn.

## Syntax
=== "Modern"
    ``` csound-orc
    scanu2(init, irate, ifndisplace,ifnmass, ifnmatrix, ifncentr, ifndamp, \
           kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, \
           ain, idisp, id)
    ```

=== "Classic"
    ``` csound-orc
    scanu2 init, irate, ifndisplace,ifnmass, ifnmatrix, ifncentr, ifndamp, \
           kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, \
           ain, idisp, id
    ```

### Initialization

_init_ -- the initial position of the masses. If this is a negative number, then the absolute of _init_ signifies the table to use as a hammer shape.  If _init_ &gt; 0, the length of it should be the same as the intended mass number, otherwise it can be anything.  If _init_ is not an integer the initial state is white noise with the fractional part being a scaling..

_irate_ -- the amount of time between successive updates of the mass state. Kind of like the sample period of the system. If the number is big, the string will update at a slow rate showing little timbral variability; otherwise it will change rapidly resulting in a more dynamic sound.

_ifndisplace_ -- the ftable that contains the initial velocity for each mass.  It should have the same size as the intended mass number.

_ifnmass_ -- ftable that contains the mass of each mass.  It should have the same size as the intended mass number.

_ifnmatrix_ -- ftable that contains the spring stiffness of each connection. It should have the same size as the square of the intended mass number.  The data ordering is a row after row dump of the connection matrix of the system.

_ifncentr_ -- ftable that contains the centering force of each mass. It should have the same size as the intended mass number.

_ifndamp_ -- the ftable that contains the damping factor of each mass. It should have the same size as the intended mass number.

_ileft_ -- If _init_ &lt; 0, the position of the positive pluck in the range 0 to 1. Ignored when _init_ &gt; 0.

_iright_ -- If _init_ &lt; 0, the position of the negative pluck in the range 0 to 1. Ignored when _init_ &gt; 0.

If _ileft_ is the same as _iright_ a single positive pluck is used as initial state.

_idisp_ -- If 0, no display of the masses is provided.

_id_ --  If positive, the ID of the opcode. This will be used to point the scanning opcode to the proper waveform maker.  If this value is negative, the absolute of this value is the wavetable on which to write the waveshape. That wavetable can be used later from an other opcode to generate sound.  The initial contents of this table will be destroyed.

### Performance

_kmass_ -- scales the masses

_kmtrxstiff_ -- scales the spring stiffness.  Note that larger numbers slow the evolution of the vibration, which is the reciprocal of the coresponding parameter in scanu.

_kcentr_ -- scales the centering force

_kdamp_ -- scales the damping

_kpos_ -- position of an active hammer along the string (_kpos_ = 0 is leftmost, _kpos_ = 1 is rightmost).  The shape of the hammer is determined by _init_ and the power it pushes with is _kdisplace_.

_kdisplace_ -- power that the active hammer uses.

_ain_ -- audio input that adds to the velocity of the masses. Amplitude should not be too great.

> :memo: **Note**
>
> Both scanu and scanu2 are capable of reading the binary (.matrxB) and text (.matrxT) matrix format. However, using scanu2 is to be preferred because of its accuracy and better sound quality.


## Examples

Here is an example of the scanu2 opcode. It uses the file [scanu2.csd](../examples/scanu2.csd).

``` csound-csd title="Example of the scanu2 opcode." linenums="1"
--8<-- "examples/scanu2.csd"
```

Here is another example of the scanu2 opcode. It uses the file [scanu2-2.csd](../examples/scanu2-2.csd).

``` csound-csd title="Second example of the scanu2 opcode." linenums="1"
--8<-- "examples/scanu2-2.csd"
```

Yet another example of the scanu2 opcode. It uses the file [scanu2-3.csd](../examples/scanu2-3.csd).

``` csound-csd title="Third example of the scanu2 opcode." linenums="1"
--8<-- "examples/scanu2-3.csd"
```

## See also

[Scanned Synthesis](../siggen/scantop.md)

More information on the Scanned Synthesis opcodes: [Working with Scanned Synthesis](http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html), written by Steven Yi, and some [tutorials](http://www.csounds.com/scanned/) by Richard Boulanger.

## Credits

Author: John ffitch<br>
May 2021<br>

New in Csound version 6.16
