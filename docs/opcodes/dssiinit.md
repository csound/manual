<!--
id:dssiinit
category:Plugin Hosting:DSSI and LADSPA
-->
# dssiinit
Loads an instance of a LADSPA or DSSI plugin.

These opcodes require the optional `dssi4cs` module on Linux. See [DSSI and LADSPA plugins](../plugin/dssi4cs.md) for build requirements and setup.

## Syntax

=== "Modern"
    ``` csound-orc
    ihandle = dssiinit(Slibrary, iplugindex [, iverbose])
    ```

=== "Classic"
    ``` csound-orc
    ihandle dssiinit Slibrary, iplugindex [, iverbose]
    ```

### Initialization

`Slibrary` names the plugin's shared library, usually a `.so` file. An absolute path selects the file directly. For a library name, the loader searches `LADSPA_PATH`, then `DSSI_PATH`. If `LADSPA_PATH` is unset, it uses `/usr/lib/ladspa/`, or `/usr/lib64/ladspa/` in a build with `LIB64` defined. It also tries adding `.so` when needed and falls back to the system library loader.

`iplugindex` is the plugin's zero-based index within the library. It is required. A library may contain several plugins. Use a valid index from the plugin's documentation or [dssilist](dssilist.md). The index is different from the plugin's UniqueID.

`iverbose` defaults to 1. A nonzero value prints plugin details and numbered ports. Zero reduces this output but does not silence every message.

`ihandle` identifies the new instance. Pass it unchanged to the other DSSI opcodes. Each call creates a separate instance, even when the library and index match.

The instance starts inactive, with control values set to zero. Set the required controls with [dssictls](dssictls.md), then activate it with [dssiactivate](dssiactivate.md) before processing audio. Plugin default-value hints do not set the initial controls.

Load plugins before real-time playback to avoid delays while opening libraries and allocating buffers. Use the same `ksmps` when loading and processing an instance.

The plugin must provide a LADSPA `run` function. DSSI plugins that only provide synth callbacks cannot run through this interface.

## Examples

This example loads the LADSPA SDK mono amplifier from `amp.so` at index 0 and prints its ports. Install the plugin and adjust its absolute path as described in the [setup guide](../plugin/dssi4cs.md). It does not process audio.

``` csound-csd title="dssiinit example" linenums="1"
--8<-- "examples/dssiinit.csd"
```

## See also

[dssiinit](dssiinit.md), [dssiactivate](dssiactivate.md), [dssictls](dssictls.md), [dssiaudio](dssiaudio.md), [dssilist](dssilist.md), [DSSI and LADSPA plugins](../plugin/dssi4cs.md)

## Credits

Author Andres Cabrera, 2005. Uses code from Richard Furse's LADSPA SDK.
