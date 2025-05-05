<!--
id:vtablewi
category:Vectorial:Tables
-->
# vtablewi
Write vectors (to tables -or arrays of vectors) at init time.

## Syntax
=== "Modern"
    ``` csound-orc
    vtablewi(indx, ifn, ixmode, inarg1 [, inarg2, inarg3 , .... , inargN ])
    ```

=== "Classic"
    ``` csound-orc
    vtablewi indx, ifn, ixmode, inarg1 [, inarg2, inarg3 , .... , inargN ]
    ```

### Initialization

_indx_ - Index into f-table, either a positive number range matching the table length (_ixmode_ = 0) or a 0 to 1 range (_ixmode_ != 0).

_ifn_ - table number

_ixmode_ - index data mode. The default value is 0.

== 0 index is treated as a raw table location,

== 1 index is normalized (0 to 1).

_inarg1...inargN_ - input vector elements

### Performance

This opcode is useful in all cases in which one needs to write sets of values associated to unique indexes (for example, multi-channel samples, STFT bin frames, spectral formants, p-field based scores etc.). The number of elements of each vector (length of the vector) is determined by the number of optional arguments on the right (_inarg1_, _inarg2_, _inarg3_, ....  _inargN_).

Notice that no wrap nor limit mode is implemented.  So, if  an index attempt to access to a zone not allocated by the table, Csound will probably crash. However this drawback can be easily avoided by using wrap or limit opcodes applied to indexes before using _vtablewi_, in order to correct eventual out-of-range values.

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
