<!--
id:dcblock
category:Signal Modifiers:Specialized Filters
-->
# dcblock
Implements the DC blocking filter.

```
Y[i] = X[i] - X[i-1] + (igain * Y[i-1])
```

Based on work by Perry Cook.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = dcblock(ain [, igain])
    ```

=== "Classic"
    ``` csound-orc
    ares dcblock ain [, igain]
    ```

### Initialization

_igain_ -- the gain of the filter, which defaults to 0.99

### Performance

_ain_ -- audio signal input

> :memo: **Note**
>
> The new [dcblock2](../opcodes/dcblock2.md) opcode is an improved method of removing DC from an audio signal.

## Examples

The result can be viewed in a graphical audio editor program like _audacity_. _audacity_ is available for Linux, Windows, and the MacOS and may be downloaded from [http://audacity.sourceforge.net](http://audacity.sourceforge.net/).

Here is an example of the dcblock opcode. It uses the file [dcblock.csd](../examples/dcblock.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the dcblock opcode." linenums="1"
--8<-- "examples/dcblock.csd"
```

## See also

[Specialized Filters: High pass filters](../sigmod/speciali.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.49

February 2003: Thanks to a note from Anders Andersson, corrected the formula.
