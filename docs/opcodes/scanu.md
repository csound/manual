<!--
id:scanu
category:Signal Generators:Scanned Synthesis
-->
# scanu
Compute the waveform and the wavetable for use in scanned synthesis.

Plugin opcode in scansyn.

## Syntax
=== "Modern"
    ``` csound-orc
    scanu(init, irate, ifndisplace, ifnmass, ifnmatrix, ifncentr, ifndamp, \
          kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, \
          ain, idisp, id)
    ```

=== "Classic"
    ``` csound-orc
    scanu init, irate, ifndisplace, ifnmass, ifnmatrix, ifncentr, ifndamp, \
          kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, \
          ain, idisp, id
    ```

### Initialization

_init_ -- the initial position of the masses.  If this is a negative number, then the absolute of _init_ signifies the table to use as a hammer shape.  If _init_ &gt; 0, the length of it should be the same as the intended mass number, otherwise it can be anything.

_irate_ -- the amount of time between successive updates of the mass state. Kind of like the sample period of the system. If the number is big, the string will update at a slow rate showing little timbral variability; otherwise it will change rapidly resulting in a more dynamic sound.

_ifndisplace_ -- the ftable that contains the initial velocity for each mass.  It should have the same size as the intended mass number.

_ifnmass_ -- ftable that contains the mass of each mass.  It should have the same size as the intended mass number.

_ifnmatrix_ -- ftable that contains the spring stiffness of each connection. It should have the same size as the square of the intended mass number.  The data ordering is a row after row dump of the connection matrix of the system.

_ifncentr_ -- ftable that contains the centering force of each mass. It should have the same size as the intended mass number.

_ifndamp_ -- the ftable that contains the damping factor of each mass. It should have the same size as the intended mass number.

_ileft_ -- If _init_ &lt; 0, the position of the left hammer (_ileft_ = 0 is hit at leftmost, _ileft_ = 1 is hit at rightmost). Ignored when _init_ &gt; 0.

_iright_ -- If _init_ &lt; 0, the position of the right hammer (_iright_ = 0 is hit at leftmost, _iright_ = 1 is hit at rightmost). Ignored when _init_ &gt; 0.

_idisp_ -- If 0, no display of the masses is provided.

_id_ --  If positive, the ID of the opcode.  This will be used to point the scanning opcode to the proper waveform maker.  If this value is negative, the absolute of this value is the wavetable on which to write the waveshape. That wavetable can be used later from an other opcode to generate sound.  The initial contents of this table will be destroyed.

### Performance

_kmass_ -- scales the masses

_kmtrxstiff_ -- scales the spring stiffness.

_kcentr_ -- scales the centering force

_kdamp_ -- scales the damping

_kpos_ -- position of an active hammer along the string (_kpos_ = 0 is leftmost, _kpos_ = 1 is rightmost).  The shape of the hammer is determined by _init_ and the power it pushes with is _kdisplace_.

_kdisplace_ -- power that the active hammer uses.

_ain_ -- audio input that adds to the velocity of the masses. Amplitude should not be too great.

> :memo: **Note**
>
> Both scanu and scanu2 are capable of reading the binary (.matrxB) and text (.matrxT) matrix format. However, using scanu2 is to be preferred because of its accuracy and better sound quality.


## Examples

Here is an example of the scanu opcode. It uses the file [scanu.csd](../examples/scanu.csd).

``` csound-csd title="Example of the scanu opcode." linenums="1"
--8<-- "examples/scanu.csd"
```

Here is another example of the scanu opcode. It uses the file [scanu-2.csd](../examples/scanu-2.csd).

``` csound-csd title="Second example of the scanu opcode." linenums="1"
--8<-- "examples/scanu-2.csd"
```

A musical example featuring the scanu opcode: [Scanu_Shengzheng_Zhang.csd](../examples/musical/Scanu_Shengzheng_Zhang.csd) by Shengzheng Zhang. This musical example also needs [MIDIpad.mid](../examples/MIDIpad.mid).

## See also

[Scanned Synthesis](../siggen/scantop.md)

More information on the Scanned Synthesis opcodes: [Working with Scanned Synthesis](http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html), written by Steven Yi, and some [tutorials](http://www.csounds.com/scanned/) by Richard Boulanger.

## Credits

Author: Paris Smaragdis<br>
MIT Media Lab<br>
Boston, Massachussetts USA<br>
March 2000<br>

New in Csound version 4.05
