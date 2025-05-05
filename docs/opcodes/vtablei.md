<!--
id:vtablei
category:Vectorial:Tables
-->
# vtablei
Read vectors (from tables -or arrays of vectors).

## Syntax
=== "Modern"
    ``` csound-orc
    vtablei(indx, ifn, interp, ixmode, iout1 [, iout2, iout3, .... , ioutN ])
    ```

=== "Classic"
    ``` csound-orc
    vtablei indx, ifn, interp, ixmode, iout1 [, iout2, iout3, .... , ioutN ]
    ```

### Initialization

_indx_ - Index into f-table, either a positive number range matching the table length (ixmode = 0) or a 0 to 1 range (ixmode != 0).

_ifn_ - table number

_iout1...ioutN_ - output vector elements

_ixmode_ -  index data mode. The default value is 0.

== 0 index is treated as a raw table location,

== 1 index is normalized (0 to 1).

_interp_ -  vtable (vector table) family of opcodes allows the user to switch beetween interpolated or non-interpolated output by means of the interp argument.

### Performance

This opcode is useful in all cases in which one needs to access sets of values associated to unique indexes (for example, multi-channel samples, STFT bin frames, spectral formants, p-field based scores etc.). The number of elements of each vector (length of the vector) is determined by the number of optional arguments on the right (iout1 , iout2, iout3, ....  ioutN).

_vtable_ (vector table) family of opcodes allows the user to switch beetween interpolated or non-interpolated output by means of the interp argument.

Notice that no wrap nor limit mode is implemented.  So, if  an index attempt to access to a zone not allocated by the table, Csound will probably crash. However this drawback can be easily avoided by using wrap or limit opcodes applied to indexes before using vtable, in order to correct eventual out-of-range values.

> :memo: **Note**
>
> Notice that _vtablei_'s output arguments are placed at the right of the opcode name, differently from usual (this style is already used in other opcodes using undefined lists of output arguments such as [fin](../opcodes/fin.md) or [trigseq](../opcodes/trigseq.md)).

## Examples

Here is an example of the vtablei opcode. It uses the files [vtablei.csd](../examples/vtablei.csd)

``` csound-csd title="Example of the vtablei opcode." linenums="1"
--8<-- "examples/vtablei.csd"
```

## See also

[Tables of vectors operators](../vectorial/tables.md)

## Credits

Example written by Andres Cabrera.

New in Csound 5 (Previously available only on CsoundAV)
