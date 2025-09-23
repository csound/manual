<!--
id:cntCreate
category:Instrument Control:Sensing and Control
-->
# cntCreate
Create a counter object.

Plugin opcode in counter.

## Syntax
=== "Modern"
    ``` csound-orc
    icnt = cntCreate([imax, imin, inc])
    ```

=== "Classic"
    ``` csound-orc
    icnt cntCreate [imax, imin, inc]
    ```

### Initialization

_imax_ -- optional maximum value for the counter, defaulting to 1.

_imin_ -- optional minimun value for the counter, defaulting to 0.

_inc_ -- optional increment for the counter, defaulting to 1.

_icnt_ -- a handle for the counter.

### Performance

Creates a counter object which loops between _imin_ and _imax_ in steps of _inc_.  Used without an argument, using the defaults creates a flip-flop.

## Examples

Here is an example of the cndCreate opcode. It uses the file [counter.csd](../examples/counter.csd).

``` csound-csd title="Example of the cntCreate opcode." linenums="1"
--8<-- "examples/counter.csd"
```

A musical example featuring the cntCreate opcode: [NervousHappyBirthday_Cucchi.csd](../examples/musical/NervousHappyBirthday_Cucchi.csd) by Stefano Cucchi.

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch June 2020

New in version 6.15
