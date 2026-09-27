<!--
id:dssictls
category:Plugin Hosting:DSSI and LADSPA
-->
# dssictls
Writes a value to a plugin control input port.

These opcodes require the optional `dssi4cs` module on Linux. See [DSSI and LADSPA plugins](../plugin/dssi4cs.md) for build requirements and setup.

## Syntax

=== "Modern"
    ``` csound-orc
    dssictls(ihandle, iport, kvalue, ktrigger)
    ```

=== "Classic"
    ``` csound-orc
    dssictls ihandle, iport, kvalue, ktrigger
    ```

### Initialization

`ihandle` is the instance handle returned by [dssiinit](dssiinit.md).

`iport` is a fixed, zero-based port number from the plugin's full port list. Audio ports count in this numbering too. Use the numbers printed by verbose `dssiinit`, and select a control input port. Do not use an audio port or an output port.

### Performance

`kvalue` is the value to send. Use the plugin's units and allowed range. The opcode does not clamp values, round integer controls or convert decibels.

`ktrigger` must equal 1 to write the value. A constant 1 updates the control every cycle. Any other value leaves the stored control unchanged. This is a level test, not a rising-edge trigger.

For a port with the LADSPA sample-rate hint, the opcode multiplies `kvalue` by the sample rate before storing it. For example, a frequency of 440 Hz needs `440 / sr` on such a port. Consult the plugin's range hints for these units.

Place control updates before [dssiaudio](dssiaudio.md) to use them in the same control cycle. Set each required control explicitly before the first audio block. The opcode has no output and does not read control output ports.

## Examples

The example changes the SDK mono amplifier gain from 0 to 1 over four seconds. Port 0 is its gain control. A constant trigger of 1 sends each new value. It requires `amp.so` and the [Linux setup](../plugin/dssi4cs.md).

``` csound-csd title="dssictls example" linenums="1"
--8<-- "examples/dssictls.csd"
```

## See also

[dssiinit](dssiinit.md), [dssiactivate](dssiactivate.md), [dssictls](dssictls.md), [dssiaudio](dssiaudio.md), [dssilist](dssilist.md), [DSSI and LADSPA plugins](../plugin/dssi4cs.md)

## Credits

Author Andres Cabrera, 2005. Uses code from Richard Furse's LADSPA SDK.
