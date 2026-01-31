<!--
id:xscanu
category:Signal Generators:Scanned Synthesis
status:deprecated
-->
# xscanu
Compute the waveform and the wavetable for use in scanned synthesis.

Plugin opcode in scansyn.

Experimental version of [scanu](../opcodes/scanu.md). Allows much larger matrices and is faster and smaller but removes some (unused?) flexibility.  If liked, it will replace the older opcode as it is syntax compatible but extended.

## Syntax
``` csound-orc
xscanu init, irate, ifndisplace, ifnmass, ifnmatrix, ifncentr, ifndamp, kmass, \
       kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, ain, idisp, id
```

### Initialization

_init_ -- the initial position of the masses. If this is a negative number, then the absolute of init signifies the table to use as a hammer shape. If init &gt; 0, the length of it should be the same as the intended mass number, otherwise it can be anything.

_irate_ -- update rate.

_ifndisplace_ -- the ftable that contains the initial velocity for each mass.  It should have the same size as the intended mass number.

_ifnmass_ -- ftable that contains the mass of each mass. It should have the same size as the intended mass number.

_ifnmatrix_ --

* _either_ an ftable that contains the spring stiffness of each connection. It should have the same size as the square of the intended mass number. The data ordering is a row after row dump of the connection matrix of the system.

* _or_ a string giving the name of a file in the MATRIX format

_ifncentr_ -- ftable that contains the centering force of each mass. It should have the same size as the intended mass number.

_ifndamp_ -- the ftable that contains the damping factor of each mass.  It should have the same size as the intended mass number.

_ileft_ -- If init &lt; 0, the position of the left hammer (ileft = 0 is hit at leftmost, ileft = 1 is hit at rightmost).

_iright_ -- If init &lt; 0, the position of the right hammer (iright = 0 is hit at leftmost, iright = 1 is hit at rightmost).

_idisp_ -- If 0, no display of the masses is provided.

_id_ -- If positive, the ID of the opcode. This will be used to point the scanning opcode to the proper waveform maker. If this value is negative, the absolute of this value is the wavetable on which to write the waveshape. That wavetable can be used later from an other opcode to generate sound. The initial contents of this table will be destroyed.

### Performance

_kmass_ -- scales the masses

_kmtrxstiff_ -- scales the spring stiffness

_kcentr_ -- scales the centering force

_kdamp_ -- scales the damping

_kpos_ -- position of an active hammer along the string (kpos = 0 is leftmost, kpos = 1 is rightmost). The shape of the hammer is determined by init and the power it pushes with is kstrngth.

_kdisplace_ -- power that the active hammer uses

_ain_ -- audio input that adds to the velocity of the masses. Amplitude should not be too great.

Matrix Format

The xscanu matrix format is a list of connections, one per line linking point x to point y. There is no weight given to the link; it is assumed to be unity.  The list is preceded by the line &lt;MATRIX&gt; and ends with a &lt;/MATRIX&gt; line

For example, a circular string of 8 would be coded as

``` csound-orc
<MATRIX>
0 1
1 0
1 2
2 1
2 3
3 2
3 4
4 3
4 5
5 4
5 6
6 5
6 7
7 6
0 7
</MATRIX>
```

To avoid confusion with other matrix formats, it is best to save this matrix format file using the extension `file.XmatrxT`.

## Examples

Here is an example of the xscanu opcode. It uses the file [xscanu.csd](../examples/xscanu.csd).
``` csound-csd title="Example of the xscanu opcode." linenums="1"
--8<-- "examples/xscanu.csd"
```

For similar examples, see the documentation on [scans](../opcodes/scans.md).

## See Also

More information on Scanned Synthesis (as well as several other matrices) is available on the [Scanned Synthesis page](http://www.csounds.com/scanned/) at cSounds.com.

Also an article on these opcodes: [http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html](http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html), written by Steven Yi

[scanu](../opcodes/scanu.md),
[xscans](../opcodes/xscans.md)

## Credits

Written by John ffitch.

New in version 4.20
