<!--
id:dssiactivate
category:Plugin Hosting:DSSI and LADSPA
-->
# dssiactivate
Activates or deactivates a LADSPA or DSSI plugin instance.

These opcodes require the optional `dssi4cs` module on Linux. See [DSSI and LADSPA plugins](../plugin/dssi4cs.md) for build requirements and setup.

## Syntax

=== "Modern"
    ``` csound-orc
    dssiactivate(ihandle, kactive)
    ```

=== "Classic"
    ``` csound-orc
    dssiactivate ihandle, kactive
    ```

### Initialization

`ihandle` is the instance handle returned by [dssiinit](dssiinit.md).

### Performance

Use `kactive = 1` to activate the instance and `kactive = 0` to deactivate it. Keep the value at 0 or 1. The opcode changes state when needed, so a constant 1 does not repeatedly activate the plugin.

Activation allows [dssiaudio](dssiaudio.md) to run the plugin. Deactivation makes that opcode output silence and stop calling the plugin's processing function. This is not an audio bypass.

The host calls the plugin's activation and deactivation callbacks when available. It also tracks the active state for plugins that have no such callbacks.

Place this call before `dssiaudio` so the change takes effect in the same control cycle. The active state belongs to the shared handle. Ending the instrument that calls `dssiactivate` does not itself deactivate the instance.

## Examples

The example activates the SDK mono amplifier for the first two seconds, deactivates it for two seconds, then activates it again. The middle section is silent. It requires `amp.so` and the [Linux setup](../plugin/dssi4cs.md).

``` csound-csd title="dssiactivate example" linenums="1"
--8<-- "examples/dssiactivate.csd"
```

## See also

[dssiinit](dssiinit.md), [dssiactivate](dssiactivate.md), [dssictls](dssictls.md), [dssiaudio](dssiaudio.md), [dssilist](dssilist.md), [DSSI and LADSPA plugins](../plugin/dssi4cs.md)

## Credits

Author Andres Cabrera, 2005. Uses code from Richard Furse's LADSPA SDK.
