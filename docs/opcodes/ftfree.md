<!--
id:ftfree
category:Table Control
-->
# ftfree
Deletes function table.

## Syntax
=== "Modern"
    ``` csound-orc
    ftfree(ifno, iwhen)
    ```

=== "Classic"
    ``` csound-orc
    ftfree ifno, iwhen
    ```

### Initialization

_ifno_ -- the number of the table to be deleted

_iwhen_ -- if zero the table is deleted at init time; otherwise the table number is registered for being deleted at note deactivation.

> :memo: **Note**
>
> If the table is deleted at init time it is possible that an earlier opcode that uses the table will fail or crash on a performance cycle.  It is the user's responsibility to avoid this error.

## Examples

Here is an example of the ftfree opcode. It uses the file [ftfree.csd](../examples/ftfree.csd).

``` csound-csd title="Example of the ftfree opcode." linenums="1"
--8<-- "examples/ftfree.csd"
```

```
instr 1:  gitempTable = 101.000
B  0.000 ..  3.000 T  3.000 TT  3.000 M:  0.50000  0.50000
INIT ERROR in instr 1: Invalid ftable no. 101.000000
instr 1:  gitempTable = 101.000
Error deleting ftable 101
B  3.000 - note deleted.  i1 had 1 init errors
B  3.000 ..  5.000 T  5.000 TT  5.000 M:  0.00000  0.00000
```

## See also

[Function Table Control](../table/top.md)

## Credits

Authors: Steven Yi, Istvan Varga<br>
2005<br>
