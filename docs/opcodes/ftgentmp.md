<!--
id:ftgentmp
category:Table Control
-->
# ftgentmp
Generate a score function table from within the orchestra, which is deleted at the end of the note.

## Syntax
=== "Modern"
    ``` csound-orc
    ifno = ftgentmp(ip1, ip2dummy, isize, igen, iarga, iargb, ...)
    ```

=== "Classic"
    ``` csound-orc
    ifno ftgentmp ip1, ip2dummy, isize, igen, iarga, iargb, ...
    ```

### Initialization

_ifno_ --  either a requested or automatically assigned table number above 100.

_ip1_ -- the number of the table to be generated or 0 if the number is to be assigned, in which case the table is deleted at the end of the note activation.

_ip2dummy_ -- ignored.

_isize_ -- table size. Corresponds to p3 of the score _f statement_.

_igen_ -- function table _GEN_ routine. Corresponds to p4 of the score _f statement_.

_iarga, iargb, ..._ -- function table arguments. Correspond to p5 through pn of the score _f statement_.

> :memo: **Note**
>
> Csound was originally designed to support tables with power of two sizes only. Though this has changed in recent versions (you can use any size by using a negative number), many opcodes will not accept them.

## Examples

Here is an example of the ftgentmp opcode. It uses the file [ftgentmp.csd](../examples/ftgentmp.csd).

``` csound-csd title="Example of the ftgentmp opcode." linenums="1"
--8<-- "examples/ftgentmp.csd"
```

The output of this csd shows that the tables are destroyed after the instrument instances that created them terminates, causing an init error if the tables are queried.

```
SECTION 1:
new alloc for instr 1:
ftable 101:
instr 1:  ifno = 101.000
B  0.000 ..  2.000 T  2.000 TT  2.000 M:  0.00000  0.00000
new alloc for instr 2:
instr 2:  #i0 = 512.000
B  2.000 ..  5.000 T  5.001 TT  5.001 M:  0.00000  0.00000
new alloc for instr 1:
ftable 102:
instr 1:  ifno = 102.000
B  5.000 ..  7.000 T  7.001 TT  7.001 M:  0.00000  0.00000
instr 2:  #i0 = 512.000
B  7.000 .. 12.000 T 11.999 TT 11.999 M:  0.00000  0.00000
INIT ERROR in instr 2: Invalid ftable no. 101.000000
#i0     ftlen.i p4
instr 2:  #i0 = -1.000
B 12.000 - note deleted.  i2 had 1 init errors
B 12.000 .. 17.000 T 17.000 TT 17.000 M:  0.00000  0.00000
INIT ERROR in instr 2: Invalid ftable no. 102.000000
#i0     ftlen.i p4
instr 2:  #i0 = -1.000
B 17.000 - note deleted.  i2 had 1 init errors
```

## See also

[Function Table Control](../table/top.md)

## Credits

Authors: Istvan Varga<br>
2005<br>
