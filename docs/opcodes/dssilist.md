<!--
id:dssilist
category:Plugin Hosting:DSSI and LADSPA
-->
# dssilist
Prints the plugins found in the DSSI and LADSPA search paths.

These opcodes require the optional `dssi4cs` module on Linux. See [DSSI and LADSPA plugins](../plugin/dssi4cs.md) for build requirements and setup.

## Syntax

=== "Modern"
    ``` csound-orc
    dssilist()
    ```

=== "Classic"
    ``` csound-orc
    dssilist
    ```

### Initialization

This opcode takes no arguments and returns no values. It scans at initialization and prints library paths, plugin indices, names, UniqueIDs and labels to Csound's messages.

Set `LADSPA_PATH`, `DSSI_PATH`, or both before starting Csound. Each variable holds directories separated by colons. The scan checks `LADSPA_PATH` first, then `DSSI_PATH`. It does not search subdirectories.

Unlike [dssiinit](dssiinit.md), `dssilist` has no default directory when both variables are unset. It reports the missing paths and fails initialization in that case.

The scanner looks for libraries that export `ladspa_descriptor`, even in `DSSI_PATH`. A DSSI-only library that exports only `dssi_descriptor` will not appear. Listing a plugin also does not prove it meets every requirement of `dssiinit`.

Use the printed library path and index with `dssiinit`. Listing does not create an instance handle or print control port details. Load a plugin with verbose output to see those ports.

## Examples

Run this example after setting at least one plugin search path. It lists plugins without producing audio. See the [setup guide](../plugin/dssi4cs.md) for a shell command.

``` csound-csd title="dssilist example" linenums="1"
--8<-- "examples/dssilist.csd"
```

## See also

[dssiinit](dssiinit.md), [dssiactivate](dssiactivate.md), [dssictls](dssictls.md), [dssiaudio](dssiaudio.md), [dssilist](dssilist.md), [DSSI and LADSPA plugins](../plugin/dssi4cs.md)

## Credits

Author Andres Cabrera, 2005. Uses code from Richard Furse's LADSPA SDK.
