<!--
id:ftgenonce
category:Signal Flow Graph Opcodes
-->
# ftgenonce
Generate a function table from within an instrument definition, without duplication of data.

Plugin opcode in signalflowgraph.

The _ftgenonce_ opcode is designed to simplify writing instrument definitions that can be re-used in different orchestras simply by #including them and plugging them into some output instrument. There is no need to define function tables either in the score, or in the orchestra header.

The ftgenonce opcode is similar to ftgentmp, and has identical arguments. However, function tables are neither duplicated nor deleted. Instead, all of the arguments to the opcode are concatenated to form the key to a lookup table that points to the function table number. Thus, every request to ftgenonce with the same arguments receives the same instance of the function table data. Every change in the value of any ftgenonce argument causes the creation of a new function table.

## Syntax
=== "Modern"
    ``` csound-orc
    ifno = ftgenonce(ip1, ip2dummy, isize, igen, iarga, iargb, ...)
    ```

=== "Classic"
    ``` csound-orc
    ifno ftgenonce ip1, ip2dummy, isize, igen, iarga, iargb, ...
    ```

### Initialization

_ifno_ --  an automatically assigned table number.

_ip1_ -- the number of the table to be generated or 0 if the number is to be assigned.

_ip2dummy_ -- ignored.

_isize_ -- table size. Corresponds to p3 of the score _f statement_.

_igen_ -- function table _GEN_ routine. Corresponds to p4 of the score _f statement_.

_iarga, iargb, ..._ -- function table arguments. Correspond to p5 through p_n_ of the score _f statement_.

> :memo: **Note**
>
> Csound was originally designed to support tables with power of two sizes only. Though this has changed in recent versions (you can use any size by using a negative number), many opcodes will not accept them.

## Examples

Here is an example of the ftgenonce opcode. It uses the file [ftgenonce.csd](../examples/ftgenonce.csd).

``` csound-csd title="Example of the ftgenonce opcode." linenums="1"
--8<-- "examples/ftgenonce.csd"
```

## See also

[Signal Flow Graph Opcodes](../signalflowgraph.md)

## Credits

Authors: Michael Gogins<br>
2009<br>
