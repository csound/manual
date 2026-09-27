# DSSI and LADSPA plugins

The optional `dssi4cs` module hosts LADSPA plugins and DSSI plugins with a LADSPA `run` function. These five opcodes load instances, set controls and process audio. They do not provide DSSI MIDI-event or synth-callback processing.

## Setup

These opcodes require Linux and a Csound build with `BUILD_DSSI_OPCODES=ON`. The option defaults to off. Building the module requires the LADSPA header and ALSA development headers. The Csound source includes the DSSI header. Install the resulting `dssi4cs` module where Csound loads opcode libraries.

Check `csound -z` for the five opcode names. An unknown-opcode error means the module is missing or did not load. Installing an external LADSPA plugin alone does not add these opcodes to Csound.

Install the plugins you want to use and set their search paths before starting Csound. For example, if your plugins are in `/usr/lib/ladspa` and `/usr/lib/dssi`, use the following commands. Change these paths to match your system.

``` sh
export LADSPA_PATH=/usr/lib/ladspa
export DSSI_PATH=/usr/lib/dssi
csound dssilist.csd
```

Each variable can contain several directories separated by colons. `dssilist` needs at least one variable set. `dssiinit` also accepts an absolute library path.

## Using an instance

1. Use [dssilist](../opcodes/dssilist.md) to find library names and plugin indices.
2. Load an instance with [dssiinit](../opcodes/dssiinit.md). Verbose output shows its ports.
3. Set its control inputs with [dssictls](../opcodes/dssictls.md).
4. Activate it with [dssiactivate](../opcodes/dssiactivate.md).
5. Process its audio with [dssiaudio](../opcodes/dssiaudio.md).

Run the control and activation calls before audio processing. Keep one audio-processing call per handle and use the same `ksmps` for loading and processing. Load a separate instance for each independent signal path.

## Examples

The examples use the mono amplifier in the [LADSPA SDK](https://www.ladspa.org/ladspa_sdk/example_plugins.html). Its library is `amp.so`, its index is 0, and its label is `amp_mono`. Port 0 is gain, port 1 is audio input, and port 2 is audio output. Gain 1 leaves the amplitude unchanged.

The audio examples use `/usr/lib/ladspa/amp.so`. Install this plugin and change that absolute path if your system puts it elsewhere. Use an absolute path if loading by library name fails. Other plugins need their own index, port numbers and control values.
