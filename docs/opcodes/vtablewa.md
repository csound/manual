<!--
id:vtablewa
category:Vectorial:Tables
-->
# vtablewa
Write vectors (to tables -or arrays of vectors) at a-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    vtablewa(andx, kfn, ixmode, ainarg1 [, ainarg2, ainarg3 , .... , ainargN ])
    ```

=== "Classic"
    ``` csound-orc
    vtablewa andx, kfn, ixmode, ainarg1 [, ainarg2, ainarg3 , .... , ainargN ]
    ```

### Initialization

_ixmode_ -  index data mode. The default value is 0.

== 0 index is treated as a raw table location,

== 1 index is normalized (0 to 1).

### Performance

_andx_ - Index into f-table, either a positive number range matching the table length (ixmode = 0) or a 0 to 1 range (ixmode != 0).

_kfn_ - table number

_ainarg1...ainargN_ - input vector elements

This opcode is useful in all cases in which one needs to write sets of values associated to unique indexes (for example, multi-channel samples, STFT bin frames, spectral formants, p-field based scores etc.). The number of elements of each vector (length of the vector) is determined by the number of optional arguments on the right (ainarg1 , ainarg2, ainarg3, ....  ainargN).

_vtablewa_ allows also to switch the table number at k-rate (but this is possible only when vector frames of each used table have the same number of elements, otherwise unpredictable results could occurr), as well as to choose indexing style (raw or normalized, see  also ixmode argument of table opcode ).

Notice that no wrap nor limit mode is implemented.  So, if  an index attempt to access to a zone not allocated by the table, Csound will probably crash. However this drawback can be easily avoided by using wrap or limit opcodes applied to indexes before using _vtablewa_, in order to correct eventual out-of-range values.

## Examples

Here is an example of the vtablewa opcode. It uses the files [vtablewa.csd](../examples/vtablewa.csd).

``` csound-csd title="Example of the vtablewa opcode." linenums="1"
--8<-- "examples/vtablewa.csd"
```

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Written by Gabriel Maldonado.

Example written by Andres Cabrera.

New in Csound 5 (Previously available only on CsoundAV)
