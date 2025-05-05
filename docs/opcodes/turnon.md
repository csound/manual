<!--
id:turnon
category:Instrument Control:Duration Control
-->
# turnon
Activate an instrument for an indefinite time.

## Syntax
=== "Modern"
    ``` csound-orc
    turnon(insnum [, itime])
    ```

=== "Classic"
    ``` csound-orc
    turnon insnum [, itime]
    ```

### Initialization

_insnum_ -- instrument number to be activated

_itime_ (optional, default=0) -- delay, in seconds, after which instrument _insnum_ will be activated. Default is 0.

### Performance

_turnon_ activates instrument _insnum_ after a delay of _itime_ seconds, or immediately if _itime_ is not specified. Instrument is active until explicitly turned off. (See [turnoff](../opcodes/turnoff.md).)

## Examples

Here is an example of the turnon opcode. It uses the files [turnon.csd](../examples/turnon.csd).

``` csound-csd title="Example of the turnon opcode." linenums="1"
--8<-- "examples/turnon.csd"
```

## See also

[Duration Control Statements](../control/durctl.md)
