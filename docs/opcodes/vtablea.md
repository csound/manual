<!--
id:vtablea
category:Vectorial:Tables
-->
# vtablea
Read vectors (from tables -or arrays of vectors) at a-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    vtablea(andx, kfn, kinterp, ixmode, aout1 [, aout2, aout3, .... , aoutN ])
    ```

=== "Classic"
    ``` csound-orc
    vtablea andx, kfn, kinterp, ixmode, aout1 [, aout2, aout3, .... , aoutN ]
    ```

### Initialization

_ixmode_ -  index data mode. The default value is 0.

== 0 index is treated as a raw table location,

== 1 index is normalized (0 to 1).

### Performance

_andx_ - Index into f-table, either a positive number range matching the table length (ixmode = 0) or a 0 to 1 range (ixmode != 0).

_kfn_ - table number

_kinterp_ - switch beetween interpolated or non-interpolated output. 0 &rarr; non-interpolation , non-zero &rarr; interpolation activated

_aout1...aoutN_ - output vector elements

This opcode is useful in all cases in which one needs to access sets of values associated to unique indexes (for example, multi-channel samples, STFT bin frames, spectral formants, p-field based scores etc.). The number of elements of each vector (length of the vector) is determined by the number of optional arguments on the right (aout1 , aout2, aout3, ....  aoutN).

_vtablea_ allows the user to switch beetween interpolated or non-interpolated output at k-rate by means of kinterp argument.

_vtablea_ allows also to switch the table number at k-rate (but this is possible only when vector frames of each used table have the same number of elements, otherwise unpredictable results could occurr), as well as to choose indexing style (raw or normalized, see  also ixmode argument of table opcode ).

Notice that no wrap nor limit mode is implemented.  So, if  an index attempt to access to a zone not allocated by the table, Csound will probably crash. However this drawback can be easily avoided by using wrap or limit opcodes applied to indexes before using vtablea, in order to correct eventual out-of-range values.

> :memo: **Note**
>
> Notice that _vtablea_'s output arguments are placed at the right of the opcode name, differently from usual (this style is already used in other opcodes using undefined lists of output arguments such as [fin](../opcodes/fin.md) or [trigseq](../opcodes/trigseq.md)).

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
