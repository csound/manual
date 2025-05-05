<!--
id:pvsmaska
category:Spectral Processing:Streaming
-->
# pvsmaska
Modify amplitudes using a function table, with dynamic scaling.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsmaska(fsrc, ifn, kdepth)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsmaska fsrc, ifn, kdepth
    ```

### Initialization

_ifn_ -- The f-table to use. Given fsrc has N analysis bins, table ifn must be of size N or larger. The table need not be normalized, but values should lie within the range 0 to 1. It can be supplied from the score in the usual way, or from within the orchestra by using [pvsinfo](../opcodes/pvsinfo.md) to find the size of fsrc, (returned by pvsinfo in inbins), which can then be passed to ftgen to create the f-table.

### Performance

_kdepth_ -- Controls the degree of modification applied to fsrc, using simple linear scaling. 0 leaves amplitudes unchanged, 1 applies the full profile of ifn.

Note that power-of-two FFT sizes are particularly convenient when using table-based processing, as the number of analysis bins (inbins) is then a power-of-two plus one, for which an exactly matching f-table can be created. In this case it is important that the f-table be created with a size of inbins, rather than as a power of two, as the latter will copy the first table value to the guard point, which is inappropriate for this opcode.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the use of the _pvsmaska_ opcode. It uses the file [pvsmaska.csd](../examples/pvsmaska.csd).

``` csound-csd title="Example of the _pvsmaska_ opcode." linenums="1"
--8<-- "examples/pvsmaska.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

New in version 4.13
