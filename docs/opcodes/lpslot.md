<!--
id:lpslot
category:Spectral Processing:LPC
-->
# lpslot
Selects the slot to be use by further lp opcodes.

## Syntax
=== "Modern"
    ``` csound-orc
    lpslot(islot)
    ```

=== "Classic"
    ``` csound-orc
    lpslot islot
    ```

### Initialization

_islot_ -- number of slot to be selected.

### Performance

_lpslot_ selects the slot to be use by further lp opcodes. This is the way to load and reference several analyses at the same time.

## Examples

Here is an example of the lpslot opcode. It uses the file [lpslot.csd](../examples/lpslot.csd).

``` csound-csd title="Example of the lpslot opcode." linenums="1"
--8<-- "examples/lpslot.csd"
```

## See also

[Linear Predictive Coding (LPC) Resynthesis](../spectral/lpcresyn.md)

## Credits

Author: Mark Resibois<br>
Brussels<br>
1996<br>

New in version 3.44
