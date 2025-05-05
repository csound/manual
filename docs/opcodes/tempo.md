<!--
id:tempo
category:Instrument Control:Sensing and Control
-->
# tempo
Apply tempo control to an uninterpreted score.


## Syntax
=== "Modern"
    ``` csound-orc
    tempo(ktempo, istartempo)
    ```

=== "Classic"
    ``` csound-orc
    tempo ktempo, istartempo
    ```

### Initialization

_istartempo_ -- initial tempo (in beats per minute). Typically 60.

### Performance

_ktempo_ -- The tempo to which the score will be adjusted.

_tempo_ allows the performance speed of Csound scored events to be controlled from within an orchestra. It operates only in the presence of the Csound [-t](../invoke/cs-options-alphabetically.md#-t-num-temponum) flag. When that flag is set, scored events will be performed from their uninterpreted p2 and p3 (beat) parameters, initially at the given command-line tempo. When a _tempo_ statement is activated in any instrument (_ktempo_ 0.), the operating tempo will be adjusted to _ktempo_ beats per minute. There may be any number of _tempo_ statements in an orchestra, but coincident activation is best avoided.

## Examples

Here is an example of the tempo opcode. Remember, it only works if you use the [-t](../invoke/cs-options-alphabetically.md#-t-num-temponum) flag with Csound. The example uses the file [tempo.csd](../examples/tempo.csd).

``` csound-csd title="Example of the tempo opcode." linenums="1"
--8<-- "examples/tempo.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Example written by Kevin Conder.
