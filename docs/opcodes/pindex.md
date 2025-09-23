<!--
id:pindex
category:Instrument Control:Sensing and Control
-->
# pindex
Returns the value of a specified pfield.

## Syntax
=== "Modern"
    ``` csound-orc
    ivalue = pindex(ipfieldIndex)
    ```

=== "Classic"
    ``` csound-orc
    ivalue pindex ipfieldIndex
    ```

### Initialization

_ipfieldIndex_ - pfield number to query.

_ivalue_ - value of the pfield.

## Examples

Here is an example of the pindex opcode. It uses the file [pindex.csd](../examples/pindex.csd).

``` csound-csd title="Example of the pindex opcode." linenums="1"
--8<-- "examples/pindex.csd"
```

The example will produce the following output:

```
new alloc for instr 1:
WARNING: instr 1 uses 3 p-fields but is given 5
p1 = 1.000000
p2 = 0.000000
p3 = 3.000000
p4 = 40.000000
p5 = 50.000000
instr 1:  inum = 5.000
B  0.000 ..  1.000 T  1.000 TT  1.000 M:      0.0
new alloc for instr 1:
WARNING: instr 1 uses 3 p-fields but is given 5
p1 = 1.000000
p2 = 1.000000
p3 = 2.000000
p4 = 80.000000
p5 = 50.000000
instr 1:  inum = 5.000
B  1.000 ..  2.000 T  2.000 TT  2.000 M:      0.0
new alloc for instr 1:
WARNING: instr 1 uses 3 p-fields but is given 7
p1 = 1.000000
p2 = 2.000000
p3 = 1.000000
p4 = 40.000000
p5 = 50.000000
p6 = 60.000000
p7 = 70.000000
instr 1:  inum = 7.000
```

The warnings can be ignored, because the pfields are used indirectly through pindex instead of explicitly through p4, p5, etc.

Here is another example of the pindex opcode. It uses the file [pindex-2.csd](../examples/pindex-2.csd).

``` csound-csd title="Second example of the pindex opcode." linenums="1"
--8<-- "examples/pindex-2.csd"
```

The example will produce the following output:

```
WARNING: instr 1 uses 3 p-fields but is given 8
B  0.000 ..  2.000 T  2.000 TT  2.000 M:  0.49966  0.49966
WARNING: instr 1 uses 3 p-fields but is given 10
B  2.000 ..  4.000 T  4.000 TT  4.000 M:  0.50000  0.50000
WARNING: instr 1 uses 3 p-fields but is given 10
B  4.000 ..  6.000 T  6.000 TT  6.000 M:  0.49943  0.49943
WARNING: instr 1 uses 3 p-fields but is given 6
B  6.000 ..  8.000 T  8.000 TT  8.000 M:  0.00000  0.00000
WARNING: instr 1 uses 3 p-fields but is given 20
B  8.000 .. 18.000 T 18.000 TT 18.000 M:  0.49994  0.49994
```

## See also

[Sensing and Control: Score control](../control/sensing.md)

## Credits

Example by: Anthony Kozar

Dec. 2006
