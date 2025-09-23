<!--
id:vtablek
category:Vectorial:Tables
-->
# vtablek
Read vectors (from tables -or arrays of vectors) at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    vtablek(kndx, kfn, kinterp, ixmode, kout1 [, kout2, kout3, .... , koutN ])
    ```

=== "Classic"
    ``` csound-orc
    vtablek kndx, kfn, kinterp, ixmode, kout1 [, kout2, kout3, .... , koutN ]
    ```

### Initialization

_ixmode_ -  index data mode. The default value is 0.

== 0 index is treated as a raw table location,

== 1 index is normalized (0 to 1).

_kinterp_ - switch beetween interpolated or non-interpolated output. 0 &rarr; non-interpolation , non-zero &rarr; interpolation activated

### Performance

_kndx_ - Index into f-table, either a positive number range matching the table length (ixmode = 0) or a 0 to 1 range (ixmode != 0).

_kfn_ - table number

_kout1...koutN_ - output vector elements

This opcode is useful in all cases in which one needs to access sets of values associated to unique indexes (for example, multi-channel samples, STFT bin frames, spectral formants, p-field based scores etc.). The number of elements of each vector (length of the vector) is determined by the number of optional arguments on the right (kout1 , kout2, kout3, ....  koutN).

_vtablek_ allows the user to switch beetween interpolated or non-interpolated output at k-rate by means of kinterp argument.

_vtablek_ allows also to switch the table number at k-rate (but this is possible only when vector frames of each used table have the same number of elements, otherwise unpredictable results could occurr), as well as to choose indexing style (raw or normalized, see  also ixmode argument of table opcode ).

Notice that no wrap nor limit mode is implemented.  So, if  an index attempt to access to a zone not allocated by the table, Csound will probably crash. However this drawback can be easily avoided by using wrap or limit opcodes applied to indexes before using vtable, in order to correct eventual out-of-range values.

> :memo: **Note**
>
> Notice that _vtablek_'s output arguments are placed at the left of the opcode name, differently from usual (this style is already used in other opcodes using undefined lists of output arguments such as [fin](../opcodes/fin.md) or [trigseq](../opcodes/trigseq.md)).

## Examples

Here is an example of the vtablek opcode. It uses the files [vtablek.csd](../examples/vtablek.csd).

``` csound-csd title="Example of the vtablek opcode." linenums="1"
--8<-- "examples/vtablek.csd"
```

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Written by Gabriel Maldonado.

Example written by Andres Cabrera.

New in Csound 5 (Previously available only on CsoundAV)
