<!--
id:GEN44
category:
-->
# GEN44
Generates a stiffness (connection) matrix for use in scanu/scanu2.

The matrix is generated from a text file of triple numbers. 

## Syntax
``` csound-orc
f # time size -44  "filename"
f # time size -44  num
```

### Performance

The file named in version 1 or the file stiff.num in the second case is read to create the matrix.

Matrix Format

The first line of the file should be &#8220; &lt;MATRIX size=integer&gt; &#8221; and it creates a square matrix of the indicated size.  This is followed by lines of two or three numbers, the first two denoting a connection from the first to the second. The third number is a weight; a weight of 2 is like having two links so more information gets distributed, while a zero weight means no link. If this third number is omitted it is taken as value 1.  The list is terminated by a &#8220; &lt;/MATRIX&gt; &#8221; line or end of file.

Example of this matrix format:

```
<MATRIX size=16>
1 2  2
2 3  1
3 4  3
4 5  1
5 6  4
6 7  1
7 8  5
8 9  6
9 10  7
10 11 6
11 12 5
12 13 4
13 14 3
14 15 2
15 16 1
16 1  9
14 13 2
10 3  6
6 4  2
2 14  7
</MATRIX>
```

can be given as zero in which case a size*size table is created. If the size in the gen statememt is too small for the matrix then space is re-allocated to the required size.

Note: to avoid confusion with other matrix formats, it is best to save this matrix format file using the extension _file.matrxT_.

## Examples

Here is an example of the GEN44 generator. It uses the file [gen44.csd](../examples/gen44.csd).

``` csound-csd title="Example of the GEN44 generator." linenums="1"
--8<-- "examples/gen44.csd"
```

Here is another example of GEN44. It uses the file [gen44-2.csd](../examples/gen44-2.csd). The matrix file has 1024 masses.

``` csound-csd title="Second example of the GEN44 generator." linenums="1"
--8<-- "examples/gen44-2.csd"
```

## See also

[Scanned Synthesis](../siggen/scantop.md)

More information on the Scanned Synthesis opcodes: [Working with Scanned Synthesis](http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html), written by Steven Yi, and some [tutorials](http://www.csounds.com/scanned/) by Richard Boulanger.

## Credits

Author: John ffitch;

New in Version 6.16

June 2021
