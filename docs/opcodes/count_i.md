<!--
id:count_i
category:Instrument Control:Sensing and Control
-->
# counti
Get the next value from a counter.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *count_i*.

Plugin opcode in counter.

Get the next value from a counter a init time by adding the increment and keeping the counter in the declared range.

## Syntax
=== "Modern"
    ``` csound-orc
    ival = counti(icnt)
    ```

=== "Classic"
    ``` csound-orc
    ival count_i icnt
    ```

### Initialization

_icnt_ -- the handle of a counter object from a call to _cntcreate_.

### Performance

Calculate the next value from the counter object and return that value.

_ival_ -- returned value.

## Examples

=== "Modern"
    Here is an example of the counti opcode. It uses the file [counter-modern.csd](../examples/counter-modern.csd).
    ``` csound-csd title="Example of the counti opcode." linenums="1"
    --8<-- "examples/counter-modern.csd"
    ```

=== "Classic"
    Here is an example of the count_i opcode. It uses the file [counter.csd](../examples/counter.csd).
    ``` csound-csd title="Example of the count_i opcode." linenums="1"
    --8<-- "examples/counter.csd"
    ```

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch June 2020

New in version 6.15
