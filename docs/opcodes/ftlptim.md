<!--
id:ftlptim
category:Table Control:Table Queries
-->
# ftlptim
Returns the loop segment start-time of a stored function table number.

## Syntax
``` csound-orc
ftlptim(x) (init-rate args only)
```

### Performance

Returns the loop segment start-time (in seconds) of stored function table number _x_. This reports the duration of the direct recorded attack and decay parts of a sound sample, prior to its looped segment. Returns zero (and a warning message) if the sample does not contain loop points.

## Examples

Here is an example of the ftlptim opcode. It uses the files [ftlptim.csd](../examples/ftlptim.csd), and [Church.wav](../examples/Church.wav).

``` csound-csd title="Example of the ftlptim opcode." linenums="1"
--8<-- "examples/ftlptim.csd"
```

The audio file &#8220;Church.wav&#8221; is a looped sample, its output should include lines like these:

```
Base Note : 60	Detune    : 0
Low  Note : 0	High Note : 127
Low  Vel. : 0	High Vel. : 127
Gain      : 1	Count     : 1
mode      : 801
start     : 4529	end       : 4912	count  :0
mode      : 0
start     : 0	end       : 0	count  :0
```

## See also

[Table Control:Table Queries](../table/queries.md)

## Credits

Author: Barry L. Vercoe<br>
MIT<br>
Cambridge, Massachussetts<br>
1997<br>
