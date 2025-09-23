<!--
id:multitap
category:Signal Modifiers:Delay
-->
# multitap
Multitap delay line implementation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = multitap(asig [, itime1, igain1] [, itime2, igain2] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares multitap asig [, itime1, igain1] [, itime2, igain2] [...]
    ```

### Initialization

The arguments _itime_ and _igain_ set the position and gain of each tap.

The delay line is fed by _asig_.

## Examples

Here is an example of the multitap opcode. It uses the file [multitap.csd](../examples/multitap.csd)

``` csound-csd title="Example of the multitap opcode." linenums="1"
--8<-- "examples/multitap.csd"
```

This results in two delays, one with length of 1.2 and gain of .5, and one with length of 1.4 and gain of .2.

## See also

[Delay](../sigmod/delayops.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1996<br>
