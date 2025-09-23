<!--
id:vtablewk
category:Vectorial:Tables
-->
# vtablewk
Write vectors (to tables -or arrays of vectors) at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    vtablewk(kndx, kfn, ixmode, kinarg1 [, kinarg2, kinarg3 , .... , kinargN ])
    ```

=== "Classic"
    ``` csound-orc
    vtablewk kndx, kfn, ixmode, kinarg1 [, kinarg2, kinarg3 , .... , kinargN ]
    ```

### Initialization

_ixmode_ -  index data mode. The default value is 0.

== 0 index is treated as a raw table location,

== 1 index is normalized (0 to 1).

### Performance

_kndx_ - Index into f-table, either a positive number range matching the table length (_ixmode_ = 0) or a 0 to 1 range (_ixmode_ != 0).

_kfn_ - table number

_kinarg1...kinargN_ - input vector elements

This opcode is useful in all cases in which one needs to write sets of values associated to unique indexes (for example, multi-channel samples, STFT bin frames, spectral formants, p-field based scores etc.). The number of elements of each vector (length of the vector) is determined by the number of optional arguments on the right (_kinarg1_, _kinarg2_, _kinarg3_, ....  _kinargN_).

_vtablewk_ allows also to switch the table number at k-rate (but this is possible only when vector frames of each used table have the same number of elements, otherwise unpredictable results could occurr), as well as to choose indexing style (raw or normalized, see  also _ixmode_ argument of _table_ opcode ).

Notice that no wrap nor limit mode is implemented.  So, if  an index attempt to access to a zone not allocated by the table, Csound will probably crash. However this drawback can be easily avoided by using wrap or limit opcodes applied to indexes before using _vtablewk_, in order to correct eventual out-of-range values.

## Examples

Here is an example of the vtablewk opcode. It uses the files [vtablewk.csd](../examples/vtablewk.csd).

``` csound-csd title="Example of the vtablewk opcode." linenums="1"
--8<-- "examples/vtablewk.csd"
```

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Written by Gabriel Maldonado.

Example written by Andres Cabrera.

New in Csound 5 (Previously available only on CsoundAV)
