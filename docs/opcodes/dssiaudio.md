<!--
id:dssiaudio
category:Plugin Hosting:DSSI and LADSPA
-->
# dssiaudio
Processes audio through a LADSPA or DSSI plugin instance.

These opcodes require the optional `dssi4cs` module on Linux. See [DSSI and LADSPA plugins](../plugin/dssi4cs.md) for build requirements and setup.

## Syntax

=== "Modern"
    ``` csound-orc
    aout1 [, aout2, ..., aout9] = dssiaudio(ihandle [, ain1, ain2, ..., ain9])
    ```

=== "Classic"
    ``` csound-orc
    aout1 [, aout2, ..., aout9] dssiaudio ihandle [, ain1, ain2, ..., ain9]
    ```

### Initialization

`ihandle` is the instance handle returned by [dssiinit](dssiinit.md). Use the same `ksmps` as the code that loaded the instance.

### Performance

`ain1` through `ain9` supply audio input channels. `aout1` through `aout9` receive audio output channels. The opcode supports up to nine inputs and nine outputs.

Channels follow the order of the plugin's audio input ports and audio output ports, with control ports skipped. Supply every audio input and request no more outputs than the plugin provides. A plugin with no audio inputs takes only `ihandle`.

Call [dssiactivate](dssiactivate.md) with 1 before processing. While active, `dssiaudio` calls the plugin's LADSPA `run` function once per control cycle. While inactive, it outputs zeros and does not run the plugin.

Input samples are divided by `0dbfs` before they reach the plugin. Output samples are multiplied by `0dbfs` on return. Control values do not receive this scaling.

Use one `dssiaudio` call per handle per control cycle. To process independent signals, load separate instances. DSSI synth-event processing is not part of this opcode.

## Examples

The example passes a sine tone through the SDK mono amplifier at half gain. It sets the control and activates the plugin before processing. It requires `amp.so` and the [Linux setup](../plugin/dssi4cs.md).

``` csound-csd title="dssiaudio example" linenums="1"
--8<-- "examples/dssiaudio.csd"
```

## See also

[dssiinit](dssiinit.md), [dssiactivate](dssiactivate.md), [dssictls](dssictls.md), [dssiaudio](dssiaudio.md), [dssilist](dssilist.md), [DSSI and LADSPA plugins](../plugin/dssi4cs.md)

## Credits

Author Andres Cabrera, 2005. Uses code from Richard Furse's LADSPA SDK.
