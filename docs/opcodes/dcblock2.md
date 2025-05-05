<!--
id:dcblock2
category:Signal Modifiers:Specialized Filters
-->
# dcblock2
Implements a DC blocking filter with improved DC attenuation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = dcblock2(ain [, iorder] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares dcblock2 ain [, iorder] [, iskip]
    ```

### Initialization

_iorder_ --  filter order, minimum 4th order, defaults to 128.

_iskip_ -- set to 1 to skip initialization (defaults to 0).

### Performance

_ares_ -- filered audio signal

_ain_ -- input audio signal

> :memo: **Note**
>
> Using a value for _iorder_ less that [ksmps](../opcodes/ksmps.md) will not reduce DC offset efficiently.

## Examples

The result can be viewed in a graphical audio editor program like _audacity_. _audacity_ is available for Linux, Windows, and the MacOS and may be downloaded from [http://audacity.sourceforge.net](http://audacity.sourceforge.net/).

Here is an example of the dcblock2 opcode. It uses the file [dcblock2.csd](../examples/dcblock2.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the dcblock2 opcode." linenums="1"
--8<-- "examples/dcblock2.csd"
```

## See also

[Specialized Filters: High pass filters](../sigmod/speciali.md)

## Credits

By: Victor Lazzarini

New in Csound version 5.09
