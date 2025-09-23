<!--
id:rezzy
category:Signal Modifiers:Standard Filters:Resonant
-->
# rezzy
A resonant low-pass filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = rezzy(asig, xfco, xres [, imode, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares rezzy asig, xfco, xres [, imode, iskip]
    ```

### Initialization

_imode_ (optional, default=0) -- high-pass or low-pass mode. If zero, _rezzy_ is low-pass. If not zero, _rezzy_ is high-pass. Default value is 0. (New in Csound version 3.50)

_iskip_ (optional, default=0) -- if non zero skip the initialisation of the filter. (New in Csound version 4.23f13 and 5.0)

### Performance

_asig_ -- input signal

_xfco_ -- filter cut-off frequency in Hz. As of version 3.50, may i-,k-, or a-rate.

_xres_ -- amount of resonance. Values of 1 to 100 are typical. Resonance should be one or greater. As of version 3.50, may a-rate, i-rate, or k-rate.

_rezzy_ is a resonant low-pass filter created empirically by Hans Mikelson.

## Examples

Here is an example of the rezzy opcode. It uses the file [rezzy.csd](../examples/rezzy.csd).

``` csound-csd title="Example of the rezzy opcode." linenums="1"
--8<-- "examples/rezzy.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Hans Mikelson<br>
October 1998<br>

New in Csound version 3.49
