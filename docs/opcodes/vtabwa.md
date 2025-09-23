<!--
id:vtabwa
category:Vectorial:Tables
-->
# vtabwa
Write vectors (to tables -or arrays of vectors) at a-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    vtabwa(andx, ifn, ainarg1 [, ainarg2, ainarg3 , .... , ainargN ])
    ```

=== "Classic"
    ``` csound-orc
    vtabwa andx, ifn, ainarg1 [, ainarg2, ainarg3 , .... , ainargN ]
    ```

### Initialization

_ifn_ - table number

### Performance

_andx_ - Index into f-table, a positive number range matching the table length

_ainarg1...ainargN_ - input vector elements

This opcode is useful in all cases in which one needs to write sets of values associated to unique indexes (for example, multi-channel samples, STFT bin frames, spectral formants, p-field based scores etc.). The number of elements of each vector (length of the vector) is determined by the number of optional arguments on the right (_ainarg1_, _ainarg2_, _ainarg3_, ....  _ainargN_).

Notice that no wrap nor limit mode is implemented.  So, if  an index attempt to access to a zone not allocated by the table, Csound will probably crash. However this drawback can be easily avoided by using wrap or limit opcodes applied to indexes before using _vtabwa_, in order to correct eventual out-of-range values.

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
