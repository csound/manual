<!--
id:vtabwk
category:Vectorial:Tables
-->
# vtabwk
Write vectors (to tables -or arrays of vectors) at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    vtabwk(kndx, ifn, kinarg1 [, kinarg2, kinarg3 , .... , kinargN ])
    ```

=== "Classic"
    ``` csound-orc
    vtabwk kndx, ifn, kinarg1 [, kinarg2, kinarg3 , .... , kinargN ]
    ```

### Initialization

_ifn_ - table number

### Performance

_kndx_ - Index into f-table, a positive number range matching the table length

_kinarg1...kinargN_ - input vector elements

This opcode is useful in all cases in which one needs to write sets of values associated to unique indexes (for example, multi-channel samples, STFT bin frames, spectral formants, p-field based scores etc.) . The number of elements of each vector (length of the vector) is determined by the number of optional arguments on the right (_kinarg1_, _kinarg2_, _kinarg3_, ....  _kinargN_).

Notice that no wrap nor limit mode is implemented.  So, if  an index attempt to access to a zone not allocated by the table, Csound will probably crash. However this drawback can be easily avoided by using wrap or limit opcodes applied to indexes before using _vtabwk_, in order to correct eventual out-of-range values.

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
