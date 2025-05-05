<!--
id:follow
category:Instrument Control:Sensing and Control
-->
# follow
Envelope follower unit generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = follow(asig, idt)
    ```

=== "Classic"
    ``` csound-orc
    ares follow asig, idt
    ```

### Initialization

_idt_ -- This is the period, in seconds, that the average amplitude of _asig_ is reported. If the frequency of _asig_ is low then _idt_ must be large (more than half the period of _asig_ )

### Performance

_asig_ -- This is the signal from which to extract the envelope.

## Examples

Here is an example of the follow opcode. It uses the file [follow.csd](../examples/follow.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the follow opcode." linenums="1"
--8<-- "examples/follow.csd"
```

To avoid zipper noise, by discontinuities produced from complex envelope tracking, a lowpass filter could be used, to smooth the estimated envelope.

## See also

[Sensing and Control: Envelope followers](../control/sensing.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>
