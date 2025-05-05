<!--
id:tempest
category:Instrument Control:Sensing and Control
-->
# tempest
Estimate the tempo of beat patterns in a control signal.


## Syntax
=== "Modern"
    ``` csound-orc
    ktemp = tempest(kin, iprd, imindur, imemdur, ihp, ithresh, ihtim, ixfdbak, \
                    istartempo, ifn [, idisprd] [, itweek])
    ```

=== "Classic"
    ``` csound-orc
    ktemp tempest kin, iprd, imindur, imemdur, ihp, ithresh, ihtim, ixfdbak, \
                  istartempo, ifn [, idisprd] [, itweek]
    ```

### Initialization

_iprd_ -- period between analyses (in seconds). Typically about .02 seconds.

_imindur_ -- minimum duration (in seconds) to serve as a unit of tempo. Typically about .2 seconds.

_imemdur_ -- duration (in seconds) of the _kin_ short-term memory buffer which will be scanned for periodic patterns. Typically about 3 seconds.

_ihp_ -- half-power point (in Hz) of a low-pass filter used to smooth input _kin_ prior to other processing. This will tend to suppress activity that moves much faster. Typically 2 Hz.

_ithresh_ -- loudness threshold by which the low-passed _kin_ is center-clipped before being placed in the short-term buffer as tempo-relevant data. Typically at the noise floor of the incoming data.

_ihtim_ -- half-time (in seconds) of an internal forward-masking filter that masks new _kin_ data in the presence of recent, louder data. Typically about .005 seconds.

_ixfdbak_ -- proportion of this unit's _anticipated value_ to be mixed with the incoming _kin_ prior to all processing. Typically about .3.

_istartempo_ -- initial tempo (in beats per minute). Typically 60.

_ifn_ -- table number of a stored function (drawn left-to-right) by which the short-term memory data is attenuated over time.

_idisprd_ (optional) -- if non-zero, display the short-term past and future buffers every _idisprd_ seconds (normally a multiple of _iprd_). The default value is 0 (no display).

_itweek_ (optional) -- fine-tune adjust this unit so that it is stable when analyzing events controlled by its own output. The default value is 1 (no change).

### Performance

_tempest_ examines _kin_ for amplitude periodicity, and estimates a current tempo. The input is first low-pass filtered, then center-clipped, and the residue placed in a short-term memory buffer (attenuated over time) where it is analyzed for periodicity using a form of autocorrelation. The period, expressed as a _tempo_ in beats per minute, is output as _ktemp_. The period is also used internally to make predictions about future amplitude patterns, and these are placed in a buffer adjacent to that of the input. The two adjacent buffers can be periodically displayed, and the predicted values optionally mixed with the incoming signal to simulate expectation.

This unit is useful for sensing the metric implications of any k-signal (e.g.- the RMS of an audio signal, or the second derivative of a conducting gesture), before sending to a [tempo](../opcodes/tempo.md) statement.

## Examples

Here is an example of the tempest opcode. It uses the file [tempest.csd](../examples/tempest.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the tempest opcode." linenums="1"
--8<-- "examples/tempest.csd"
```

The tempo of the audio file &#8220;drumsMlp.wav&#8221; is 120 beats per minute. In this examples, tempest will print out its best guess as the audio file plays. Its output should include lines like this:

```
. i1   118.24654
. i1   121.72949
```

## See also

[Sensing and Control: Tempo and Pitch estimation](../control/sensing.md)
