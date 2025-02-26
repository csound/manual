<!--
id:miditempo
category:Instrument Control:Sensing and Control
-->
# miditempo
Returns the current tempo at k-rate, of either the MIDI file (if available) or the score. (provided the -t option is used).


## Syntax
``` csound-orc
ksig  miditempo
```

## Examples

Here is an example of the miditempo opcode. It uses the files [miditempo.csd](../../examples/miditempo.csd).

``` csound-csd title="Example of the miditempo opcode." linenums="1"
--8<-- "examples/miditempo.csd"
```

Its output should include a line like this:

```
miditempo = 96
```

## See also

[Sensing and Control: Tempo and Sequencing](../../control/sensing)

## Credits

Author: Istvan Varga<br>
March 2005<br>
New in Csound5<br>
