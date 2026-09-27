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

_katt_ -- the attack time in seconds (60 dB)

_krel_ -- the release time in seconds (60 dB)

The envelope starts at zero and follows the absolute value of _asig_. _katt_ controls its rise and _krel_ controls its fall. Each time specifies how long it takes to reduce the difference from a constant target to 0.1% (60 dB). For example, with an input of 1 and _katt_ = 0.1, the output reaches 0.999 after 0.1 seconds.

Zero or negative values for either time use 0.1 seconds.

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
