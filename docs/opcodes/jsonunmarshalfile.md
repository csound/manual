<!--
id:jsonunmarshalfile
category:Signal I/O:File I/O
-->
# jsonunmarshalfile

Reads a JSON file into a declared user-defined type or a one-dimensional typed array.

The opcode opens a text file through Csound's file handling, reads one complete JSON document, and closes the file. It uses the same type mappings, options and validation as [jsonunmarshal](jsonunmarshal.md).

## Syntax

=== "Modern"
    ``` csound-orc
    value:Type = jsonunmarshalfile(Spath [, iflags [, imaxdepth]])
    values:T[] = jsonunmarshalfile(Spath [, iflags [, imaxdepth]])
    ```

=== "Classic"
    ``` csound-orc
    value:Type jsonunmarshalfile Spath [, iflags [, imaxdepth]]
    values:T[] jsonunmarshalfile Spath [, iflags [, imaxdepth]]
    ```

`Type` stands for a declared UDT. `T` stands for `i`, `k`, `b`, `B`, `S`, or a supported UDT. The file's root must match the destination: an object for a UDT or an array for a typed array.

### Initialization

`Spath` is the filename or path. Csound opens it read-only. It first tries a relative filename in the current directory, then uses its search paths from `INCDIR`, `SSDIR` and `SFDIR`. An absolute path selects a specific file. See [Environment Variables](../invoke/environment-variables.md) for path setup. The JSON opcode does not add a search path of its own.

For example, keep `settings.json` in a directory named `presets` and add that directory to `INCDIR`:

``` sh
csound --env:INCDIR+=presets piece.csd
```

Then read it as `jsonunmarshalfile("settings.json")` into a declared destination type. Csound can also add paths from the CSD location under its normal command-line rules; an explicit path or configured search directory avoids relying on a front end's working directory.

`value` or `values` receives the decoded value. Arrays take their length from the file. On a successful read, the opcode replaces the whole destination. On a failed read, it leaves the destination unchanged and reports an initialization error.

`iflags` defaults to `0` for strict JSON. Set `1` to allow comments, `2` to allow trailing commas, or `3` for both. The file extension does not change the parser: a `.jsonc` file still needs the appropriate flags.

`imaxdepth` defaults to `0`, which selects a limit of 256 nested JSON containers. Set an integer from `1` to `256` for an explicit limit. The root object or array counts as one, and every nested object or array adds one. Supply `iflags` before `imaxdepth`, even when the flags are zero. All options must be finite integers in these ranges.

### Errors and host filesystems

A missing or unreadable file causes a `cannot open file` initialization error. An empty file, malformed JSON or extra text after the document causes a parse error with a byte position. The file must hold a single JSON document; a stream of separate objects, such as JSON Lines, is not supported.

Every UDT member must occur exactly once with the right type. Unknown fields, missing fields, duplicates, `null`, invalid strings, unsupported types and excessive nesting cause an error. File input has no looser type rules than string input. See [type mappings](../strings/json.md#type-mappings) and [fault handling](../strings/json.md#fault-tolerance-and-errors) for the full rules.

In a browser or an embedded host, the file must exist in the filesystem that the host exposes to Csound. The opcode does not fetch an HTTP URL or read an arbitrary file on the user's computer. Put the file in the host's virtual filesystem first, or pass text that the host already has to [jsonunmarshal](jsonunmarshal.md).

### Performance

The opcode runs once at initialization. It reads and parses the whole file and allocates memory; it does not stream notes or watch the file for changes. File I/O and JSON conversion are not safe for a real-time audio callback. Load before live playback or use an offline render.

## Examples

### Read a score with a UDO

Download both [jsonunmarshalfile.csd](../examples/jsonunmarshalfile.csd) and [jsonunmarshalfile-score.json](../examples/jsonunmarshalfile-score.json) into the same directory. Run Csound from that directory:

``` sh
csound jsonunmarshalfile.csd
```

The example writes `json-score.wav`. It prints `A short JSON score: 4 notes, 2.50 seconds` and allows another 0.1 seconds before ending the performance.

``` json title="jsonunmarshalfile-score.json"
{
  "title": "A short JSON score",
  "tempo": 120,
  "notes": [
    {"start": 0, "duration": 0.8, "pitch": 60, "amplitude": 0.15, "pan": 0.2},
    {"start": 1, "duration": 0.8, "pitch": 64, "amplitude": 0.15, "pan": 0.4},
    {"start": 2, "duration": 0.8, "pitch": 67, "amplitude": 0.15, "pan": 0.6},
    {"start": 3, "duration": 2, "pitch": 72, "amplitude": 0.15, "pan": 0.8}
  ]
}
```

``` csound-csd title="A UDO that reads and schedules a JSON score" linenums="1"
--8<-- "examples/jsonunmarshalfile.csd"
```

`PlayJsonScore` reads the score, checks its musical values, then schedules the notes with [eventi](event_i.md). JSON starts and durations use beats; the UDO converts them to seconds with `60 / tempo`. Pitches use MIDI note numbers, amplitudes use the example's `0dbfs = 1`, and pan runs from 0 (left) to 1 (right). The amplitude limit of 0.25 is a choice made by this UDO, not a JSON restriction; many overlapping notes can still sum above full scale.

The UDO checks all notes before scheduling any. It rejects non-positive tempo or duration, negative starts, out-of-range MIDI pitches, and amplitudes or pan positions outside its chosen limits. JSON type checks alone cannot enforce those musical rules. The UDO sends all notes to the fixed `JsonTone` instrument and returns the last note's end time in seconds. `LoadScore` uses that value to end the performance, so changing the score length does not require changing `<CsScore>`.

An empty `notes` array schedules no notes. For another score format, change the struct declarations and the UDO's checks together. To accept comments or trailing commas in a file, pass the chosen flags to the UDO's `jsonunmarshalfile` call.

## See also

[jsonunmarshal](jsonunmarshal.md), [jsonmarshal](jsonmarshal.md), [JSON data](../strings/json.md), [User Defined Opcodes](../orch/user-defined-opcodes.md), [eventi](event_i.md), [File Input and Output](../sigio/fileio.md)

## Availability

New in Csound 7.
