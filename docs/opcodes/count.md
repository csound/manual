<!--
id:count
category:Instrument Control:Sensing and Control
-->
# count
Get the next value from a counter.

Plugin opcode in counter.

Get the next value from a counter by adding the increment and keeping the counter in the declared range.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = count(icnt)
    ```

=== "Classic"
    ``` csound-orc
    kval count icnt
    ```

### Initialization

_icnt_ -- the handle of a counter object from a call to _cntCreate_.

### Performance

Calculate the next value from the counter object and return that  value.

_kval_ -- returned value.

## Examples

Here is an example of the count opcode. It uses the file [counter.csd](../examples/counter.csd).

``` csound-csd title="Example of the count opcode." linenums="1"
--8<-- "examples/counter.csd"
```

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch June 2020

New in version 6.15
