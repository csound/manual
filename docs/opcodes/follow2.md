<!--
id:follow2
category:Instrument Control:Sensing and Control
-->
# follow2
Another controllable envelope extractor using the algorithm attributed to Jean-Marc Jot.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = follow2(asig, katt, krel)
    ```

=== "Classic"
    ``` csound-orc
    ares follow2 asig, katt, krel
    ```

### Performance

_asig_ -- the input signal whose envelope is followed

_katt_ -- the attack rate (60dB attack time in seconds)

_krel_ -- the decay rate (60dB decay time in seconds)

The output tracks the amplitude envelope of the input signal. The rate at which the output grows to follow the signal is controlled by the _katt_, and the rate at which it decreases in response to a lower amplitude, is controlled by the _krel_. This gives a smoother envelope than _follow_.

## Examples

Here is an example of the follow2 opcode. It uses the file [follow2.csd](../examples/follow2.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the follow2 opcode." linenums="1"
--8<-- "examples/follow2.csd"
```

## See also

[Sensing and Control: Envelope followers](../control/sensing.md)

## Credits

Author: John ffitch<br>
The algorithm for the _follow2_ is attributed to Jean-Marc Jot.<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>
February 2000<br>

New in Csound version 4.03

Added notes by Rasmus Ekman on September 2002.
