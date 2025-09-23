<!--
id:pcount
category:Instrument Control:Sensing and Control
-->
# pcount
Returns the number of pfields belonging to a note event.

## Syntax
=== "Modern"
    ``` csound-orc
    icount = pcount()
    ```

=== "Classic"
    ``` csound-orc
    icount pcount
    ```

### Initialization

_icount_ - stores the number of pfields for the current note event.

> :memo: **Note**
>
> Note that the reported number of pfields is not necessarily what is explicitly written in the score, but the pfields available to the instrument through mechanisms like [pfield carry](../score/preproc.md#carry).

## Examples

Here is an example of the pcount opcode. It uses the file [pcount.csd](../examples/pcount.csd).

``` csound-csd title="Example of the pcount opcode." linenums="1"
--8<-- "examples/pcount.csd"
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

The warnings occur because pfields are not used explicitly by the instrument.

## See also

[Sensing and Control: Score control](../control/sensing.md)

## Credits

Example by: Anthony Kozar

Dec. 2006
