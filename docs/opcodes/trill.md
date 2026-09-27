<!--
id:trill
category:Signal I/O:Signal Input
-->
# trill
Reads touch data from a Trill sensor through the Bela Csound host.

## Syntax

=== "Modern"
    ``` csound-orc
    kcount, ksizes[], kvertical[], khorizontal[] = trill(inumTouches, isensor)
    ```

=== "Classic"
    ``` csound-orc
    kcount, ksizes[], kvertical[], khorizontal[] trill inumTouches, isensor
    ```

### Setup

This opcode requires the Bela Csound host and a connected Trill sensor. Ordinary desktop Csound does not register it. Use a Bela Csound project with Trill support or the `belacsound` host built with `BUILD_BELA=ON`. See the [Csound Bela build instructions](https://github.com/csound/csound/blob/develop/Bela/README.md) and [Bela's Trill connection guide](https://learn.bela.io/using-trill/get-started-with-trill/).

Connect the sensor before starting the project. The host scans I²C bus 1 at addresses `0x20` through `0x50` and prints the devices it finds. It skips Trill Craft. The opcode does not choose the bus, change the sensor mode or rescan for devices during performance.

### Initialization

`inumTouches` is the number of entries in each output array. It is required and must be a positive integer. Allocate all three arrays before calling `trill`, with exactly this many entries.

For a one-axis sensor, reserve enough entries for every touch it can report. Use 5 for Trill Bar or Ring. This value is storage capacity, not a limit on the number of touches the sensor detects. For a two-axis sensor such as Square or Hex, one entry is enough because the opcode reports a single combined touch.

`isensor` is the sensor's zero-based position in the host's detected-device list. It is required and fixed at initialization. With one supported sensor connected, use 0. With several sensors, IDs follow increasing I²C address order. The ID is not an I²C address. Selecting an ID that is absent from the list causes an initialization error.

### Performance

`kcount` gives the number of active touch entries. Use entries 0 through `kcount - 1`. The opcode sets unused array entries to zero.

`ksizes[]` contains touch sizes from the Trill library. These reflect capacitive activation and depend on the sensor and contact. They are not calibrated pressure readings.

`kvertical[]` contains positions along the first axis. In touch-detection mode, positions run from 0 to 1 across that axis. On Bar or Ring, this is the one-dimensional touch position. Use `khorizontal[]` for the second axis on a two-axis sensor.

For one-axis sensors, the opcode reports separate touches. For two-axis sensors, it returns either zero or one active entry. That entry uses the Trill library's combined position and size across the detected touches, rather than separate pairs of coordinates. See the [Trill library reference](https://docs.bela.io/classTrill.html) for the meaning of a compound touch.

The opcode reads the latest sensor data each control cycle. The host reads I²C in a separate task, with a 10 ms pause between scans. Several control cycles can therefore return the same reading. Smooth values before using them to control sound.

The implementation also has a raw-data path for hosts that configure sensors in RAW, DIFF or BASELINE mode. In that path, `kcount` counts returned pads, `ksizes[]` holds pad readings, and `kvertical[]` holds pad indices. Do not use `khorizontal[]` in raw mode. The standard host does not expose mode selection and does not add Craft devices to its list.

## Examples

Connect one Trill Bar and run [trill.csd](../examples/trill.csd) on the Bela host. The example allocates five entries in each array and uses the first active touch to control a quiet sine tone from 220 to 880 Hz. Releasing all touches fades the tone out.

The example uses 44100 Hz. Match this to the Bela audio rate. It leaves `ksmps` unset so the standalone host can supply its block size. If you set `ksmps`, use a value that divides the Bela audio block evenly.

``` csound-csd title="Control a tone with Trill Bar" linenums="1"
--8<-- "examples/trill.csd"
```

Run it with `belacsound --csd=trill.csd` when using the standalone host. Stop the Bela project when finished.

## See also

[Non-MIDI devices](../oscnetwork/nonMIDIdevices.md), [Trill sensor overview](https://learn.bela.io/products/trill/about-trill/)

## Credits

Author Bernt Isak Wærstad, 2020. Further sensor support by Giulio Moro.
