<!--
id:rireturn
category:Instrument Control:Initialization and Reinitialization
-->
# rireturn
Terminates a [reinit](../opcodes/reinit.md) pass (i.e., no-op at standard i-time).

This statement, or an _endin_, will cause normal performance to be resumed.

## Syntax
=== "Modern"
    ``` csound-orc
    rireturn()
    ```

=== "Classic"
    ``` csound-orc
    rireturn
    ```

## Examples

The following statements will generate an exponential control signal whose value moves from 440 to 880 exactly ten times over the duration p3. They use the file [reinit.csd](../examples/reinit.csd).

``` csound-csd title="Example of the rireturn opcode." linenums="1"
--8<-- "examples/reinit.csd"
```

## See also

[Initialization and Reinitialization](../control/reinitn.md)
