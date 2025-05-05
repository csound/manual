<!--
id:active
category:Instrument Control:Realtime Performance Control
-->
# active
Returns the number of active instances of an instrument with options to ignore releasing instances.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = active(insnum [,iopt [,inorel]])
    ir = active(Sinsname [,iopt [,inorel]])
    kres = active(kinsnum [,iopt [,inorel]])
    ```

=== "Classic"
    ``` csound-orc
    ir active insnum [,iopt [,inorel]]
    ir active Sinsname [,iopt [,inorel]]
    kres active kinsnum [,iopt [,inorel]]
    ```

### Initialization

_insnum_ -- number or string name of the instrument to be reported

_Sinsname_ -- instrument name

_iopt_ -- select currently active (zero, default), or all every active (non zero)

_inorel_ -- if non-zero ignore instruments in release phase (zero, default), only valid if iopts is zero.

### Performance

_kinsnum_ -- number or string name of the instrument to be reported

_active_ returns the number of active instances of instrument number _insnum/kinsnum_ (or named instrument _Sinsname_). As of Csound 4.17 the output is updated at k-rate (if input arg is k-rate), to allow running count of instr instances.

As of Csound 5.17 if the instrument number is given as zero then all instruments are counted.

## Examples

=== "Modern"
    Here is a simple example of the active opcode. It uses the file
    [active-modern.csd](../examples/active-modern.csd).
    ``` csound-csd title="Simple example of the active opcode." linenums="1"
    --8<-- "examples/active-modern.csd"
    ```
    
=== "Classic"
    Here is a simple example of the active opcode. It uses the file
    [active.csd](../examples/active.csd).
    ``` csound-csd title="Simple example of the active opcode." linenums="1"
    --8<-- "examples/active.csd"
    ```

Its output should include lines like this:

```
instr 2:  icount = 1.000
instr 2:  icount = 2.000
```

=== "Modern"
    Here is a more advanced example of the active opcode. It displays the results of the active opcode at k-rate instead of i-rate. It uses the file [active_k-modern.csd](../examples/active_k-modern.csd).
    ``` csound-csd title="Example of the active opcode at k-rate." linenums="1"
    --8<-- "examples/active_k-modern.csd"
    ```

=== "Classic"
    Here is a more advanced example of the active opcode. It displays the results of the active opcode at k-rate instead of i-rate. It uses the file [active_k.csd](../examples/active_k.csd).
    ``` csound-csd title="Example of the active opcode at k-rate." linenums="1"
    --8<-- "examples/active_k.csd"
    ```

Its output should include lines like:
    
```
i2     1.00000
i2     2.00000
```

=== "Modern"
    Here is another example of the active opcode, using the number of instances to calculate gain. It uses the file [active_scale-modern.csd](../examples/active_scale-modern.csd).
    ``` csound-csd title="Example of the active opcode at k-rate." linenums="1"
    --8<-- "examples/active_scale-modern.csd"
    ```

=== "Classic"
    Here is another example of the active opcode, using the number of instances to calculate     gain. It uses the file [active_scale.csd](../examples/active_scale.csd).
    ``` csound-csd title="Example of the active opcode at k-rate." linenums="1"
    --8<-- "examples/active_scale.csd"
    ```

## See also

[Real-time Performance Control](../control/realtime.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
July, 1999<br>

Examples written by Kevin Conder.

New in Csound version 3.57; named instruments added version 5.13

Option for all ever active new in 5.13

Count of all instruments new in 5.17

No release option new in 5.19
