<!--
id:peak
category:Instrument Control:Sensing and Control
-->
# peak
Maintains the output equal to the highest absolute value received.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = peak(asig)
    kres = peak(ksig)
    ```

=== "Classic"
    ``` csound-orc
    kres peak asig
    kres peak ksig
    ```

### Performance

_kres_ -- Output equal to the highest absolute value received so far. This is effectively an input to the opcode as well, since it reads _kres_ in order to decide whether to write something higher into it.

_ksig_ -- k-rate input signal.

_asig_ -- a-rate input signal.

## Examples

Here is an example of the peak opcode. It uses the file [peak.csd](../examples/peak.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the peak opcode." linenums="1"
--8<-- "examples/peak.csd"
```

Its output should include lines like this:

```
i   1 time     0.00000:     0.00118
i   1 time     0.50068:     0.71418
i   1 time     1.00136:     0.80155
i   1 time     1.50204:     0.89209
i   1 time     2.00272:     0.89209
i   1 time     2.50340:     0.89209
```

## See also

[Sensing and Control: Envelope followers](../control/sensing.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

Example written by Kevin Conder.
