# JSON data

Csound 7 can exchange typed data with JSON files and strings. Use it for hand-edited presets, scores made by another program, numeric datasets, or exports for a web page or analysis script.

| Opcode | Input | Output |
| --- | --- | --- |
| [jsonunmarshal](../opcodes/jsonunmarshal.md) | JSON text in a string | A declared UDT or typed array |
| [jsonunmarshalfile](../opcodes/jsonunmarshalfile.md) | A filename or path | A declared UDT or typed array |
| [jsonmarshal](../opcodes/jsonmarshal.md) | A supported UDT or typed array | Compact or indented JSON text |

All three run at initialization. Parsing, encoding, allocation and file access can take time that an audio callback cannot spare. Load or export before live playback, or while rendering offline. Putting a call in an instrument that starts during playback does not make it safe for real-time use.

## Declare the data first

A [user-defined type](../orch/data-types.md#user-defined-types), or UDT, gives the names and types of the JSON object's fields. Declare it with `struct` in the orchestra header. The same declaration governs both reading and writing.

``` csound-orc
struct Preset name:S, gain:i

instr 1
  preset:Preset = jsonunmarshal({{ {"name":"soft","gain":0.2} }})
  prints("%s: gain %.1f\n", preset.name, preset.gain)
  compact:S = jsonmarshal(preset)
  indented:S = jsonmarshal(preset, 1)
  prints("%s\n", indented)
endin
```

The Csound `{{ ... }}` delimiters hold a string with JSON double quotes. The outer delimiters belong to Csound; the single pair of braces inside them belongs to JSON. JSON still requires its own string escapes.

No type declaration travels in the JSON output. The receiver must choose the destination type. For example, an object containing a number can initialize either an `i` or a `k` member, but the JSON itself does not record its Csound rate.

These opcodes do not create dynamic dictionaries or infer types from the input. Field names must match the declaration exactly, including case and any prefix in the member's name. A member declared as `iGain:i` requires a key named `"iGain"`, not `"gain"`. Field order in the input does not matter. Output object keys follow declaration order.

## Type mappings

The following table lists all supported member and array element types. The same rules apply in nested structs and at every array element.

| Csound type | JSON read | JSON write | Notes |
| --- | --- | --- | --- |
| `i` | Finite number | Number | Stored as a 64-bit double or 32-bit float, depending on the build |
| `k` | Finite number | Number | Initialized or read once, at initialization |
| `b` | `true` or `false` | `true` or `false` | Init-time boolean; no numeric coercion |
| `B` | `true` or `false` | `true` or `false` | Control-time boolean, initialized or read once |
| `S` | Valid UTF-8 string without NUL | JSON string | Quotes, backslashes and control characters use JSON escapes |
| A UDT | Object | Object | Every declared member must have a supported type |
| `i[]`, `k[]` | Array of numbers | Array of numbers | One dimension; all elements must be finite |
| `b[]`, `B[]` | Array of booleans | Array of booleans | `0` and `1` do not stand for JSON booleans |
| `S[]` | Array of strings | Array of strings | The string rules apply to each element |
| `Type[]` for a UDT | Array of objects | Array of objects | Every object has the same declared fields |

The root must be an object mapped to a UDT or a one-dimensional typed array. Root numbers, booleans, strings and `null` are unsupported. Wrap a single value when needed:

``` csound-orc
struct Gain value:i

instr 1
  gain:Gain = jsonunmarshal({{ {"value":0.2} }})
  numbers:i[] = jsonunmarshal("[0.2]")
  prints("%s\n%s\n", jsonmarshal(gain), jsonmarshal(numbers))
endin
```

There is no mapping for `null`, nullable or optional members, mixed-type arrays, audio (`a`), spectral (`f`) data, complex values, or live handles such as `Instr`, `Opcode` and `OpcodeDef`. Convert such data to supported values first. For example, represent a complex value with a UDT containing numeric `real` and `imaginary` members. A table number alone does not export a table: [copy its values to an array](../opcodes/jsonmarshal.md#export-a-function-table).

The converter checks declared member types even when an array has no elements. An empty array of a struct containing an audio member still fails.

### Numbers and precision

JSON integers and fractional numbers both map to Csound floating-point numbers. Decimal exponents, negative numbers and zero are valid. Quoted numbers such as `"440"` are strings and fail for `i` or `k` members. Booleans cannot substitute for numbers, and numbers cannot substitute for booleans.

A double-precision build uses 64-bit double values. A single-precision build uses 32-bit float values. Reading rounds to that precision. All integers through magnitude `2^53` in a double build, or `2^24` in a single build, are exactly representable; above that, some integers lose precision. Use strings for identifiers that must keep every digit.

Writing preserves the stored finite value without a user-selected rounding step. It does not preserve the spelling from the source JSON: `60`, `60.0` and `6e1` may produce the same output. A finite value can round-trip through writing and reading at the same build precision. A reader with less precision may round it again. Non-finite values, including `NaN` and infinity, cause errors. Input that overflows the build's finite numeric range also fails.

### Strings and Unicode

Input may contain UTF-8 characters directly or valid JSON Unicode escapes, including paired surrogates for characters outside the basic multilingual plane. The parser rejects invalid UTF-8, malformed escapes and unpaired surrogates. Keys and string values cannot contain NUL, including `\u0000`. Empty strings are valid.

Csound and JSON each have string syntax. When constructing JSON inside orchestra code, account for both; a JSON file is often clearer for text with many backslashes. The writer escapes quotes, backslashes and control characters and preserves valid Unicode text. It expects normal NUL-terminated Csound strings, not arbitrary binary bytes; encode binary data as text before passing it to these opcodes.

Decoded strings and the complete encoded document must fit Csound's string-size limit and available memory. The file reader also parses the whole document into memory. Use another format or a host-side streaming reader for data too large to hold at once.

### Arrays and nested data

The reader allocates each array to match its JSON length, so a prior `init` is not needed. Array order is preserved. `[]` creates a zero-length array, and the writer returns `[]` for an empty, valid typed array. Each element must have the declared type; there is no per-element type inference.

Nested UDTs and arrays of UDTs can express a score containing tracks, notes and envelopes. Every array itself must have one dimension. Direct arrays of arrays, including rectangular `[[1,2],[3,4]]` and ragged `[[1,2],[3]]`, do not map to a multidimensional Csound array.

For rows or tracks of different lengths, use an array of structs containing arrays:

``` csound-orc
struct Row values:i[]

instr 1
  rows:Row[] = jsonunmarshal({{ [{"values":[1,2]},{"values":[3]}] }})
  prints("Second row length: %d\n", lenarray(rows[1].values))
endin
```

The [complete type example](../opcodes/jsonunmarshal.md#examples) includes all five scalar types, their array forms, a nested struct, arrays of structs, an empty array and rows of different lengths.

## Fault tolerance and errors

The reader can tolerate comments and trailing commas when requested. It does not repair broken JSON or relax the declared data shape. Both read opcodes accept these flags:

| `iflags` | Syntax accepted |
| --- | --- |
| `0` (default) | Strict JSON |
| `1` | Also `//` and `/* ... */` comments |
| `2` | Also trailing commas in arrays and objects |
| `3` | Both extensions |

These are the only syntax extensions. Single-quoted strings, unquoted keys, `NaN` and infinity remain invalid. `//` inside a quoted string is ordinary text. The extension `.jsonc` is a naming choice and does not enable flags. [The options example](../examples/jsonunmarshal-options.csd) shows how to read both extensions and export strict JSON. The writer always drops comments and trailing commas.

### What happens on failure

The reader first builds and validates a temporary value. It replaces the destination only after the whole conversion succeeds. A bad field late in a large array therefore cannot leave earlier elements partly updated. An existing destination, including its strings and arrays, keeps its previous values after a failed conversion. The writer likewise updates its output string only after encoding succeeds.

This protects the data; it does not turn failure into a recoverable return value. All three opcodes report initialization errors. They have no status output, `try` mode, fallback argument, option to ignore unknown fields, or option to skip malformed notes. Do not rely on a statement after a failed call to repair the data and continue that initialization.

For `struct Settings gain:i, name:S`, these cases illustrate the read rules:

| Input or condition | Result |
| --- | --- |
| `{"name":"soft","gain":0.2}` | Accepted; field order does not matter |
| `{"gain":0.2}` | Missing `name` field |
| `{"gain":0.2,"name":"soft","extra":1}` | Unknown `extra` field |
| `{"gain":0.2,"gain":0.3,"name":"soft"}` | Duplicate `gain` field; not “last value wins” |
| `{"Gain":0.2,"name":"soft"}` | Unknown `Gain` field; names are case-sensitive |
| `{"gain":"0.2","name":"soft"}` | Wrong type at `gain` |
| `{"gain":true,"name":"soft"}` | Boolean where a number is required |
| `{"gain":null,"name":"soft"}` | No null-to-default conversion |
| `{"gain":0.2,"name":"soft",}` | Rejected with flags `0` or `1`; accepted with `2` or `3` |
| Empty text, unfinished JSON, or extra text after the document | Parse error |
| Missing or unreadable file | File-open error |
| Unsupported member or array type | Type error, even for an empty array |
| Too many nested containers | Depth error; no truncation |

Syntax diagnostics include the opcode name and a byte position. Type and field diagnostics include a path where possible. `$` denotes the root, `.name` a member, and `[2]` the third array element. For example:

``` text
jsonunmarshal: missing field at $.name
jsonunmarshal: expected a finite number in MYFLT range at $.gain
```

A file-open diagnostic names the path. Some errors, such as an option error or a depth check before field mapping, do not identify a specific member. Byte positions count bytes, not Unicode characters.

### Application checks and defaults

Matching the declared types does not establish that the values make sense for a piece. A negative duration is still a valid JSON number. Check tempo, note duration, pitch range, amplitude, pan and any other musical constraints before using the data. The [score UDO example](../opcodes/jsonunmarshalfile.md#read-a-score-with-a-udo) makes a full validation pass before it schedules notes.

For an editable preset format with optional fields, let the program that prepares the JSON fill in defaults and remove or reject unknown keys before Csound reads it. Initializing a Csound struct with defaults does not make missing JSON members optional. A successful read replaces the whole destination; it is not a patch operation.

If a host needs to keep playing after a bad update, validate the document before passing it to Csound, keep the last valid data in the host, and perform any Csound initialization checks outside the live audio callback. The opcode's unchanged destination guarantee alone does not provide that workflow.

### Nesting limits and options

Both read opcodes and the writer accept `imaxdepth`. The default `0` selects a maximum of 256 nested containers. Set an integer from `1` to `256` to choose an explicit limit. Count only objects and arrays:

| JSON shape | Minimum depth limit |
| --- | --- |
| `{"pitch":60}` | `1` |
| `[60,64,67]` | `1` |
| `[{"pitch":60}]` | `2` |
| `{"notes":[{"pitch":60}]}` | `3` |

The reader checks the entire parsed document, including containers under unknown keys. The limit bounds nesting, not the file's byte size or total number of notes. An over-limit value fails instead of being cut short.

All options must be finite integers. Read flags must be `0` through `3`; the writer's `ipretty` must be `0` or `1`; depth must be `0` through `256`. Set a depth by supplying the preceding option too: `jsonunmarshal(source, 0, 8)` or `jsonmarshal(value, 1, 8)`.

## Choosing a use case

| Task | Approach |
| --- | --- |
| Load a preset edited by hand | Declare a UDT and call `jsonunmarshalfile`; enable comments if useful |
| Receive JSON text from a host | Pass the text to `jsonunmarshal` during a suitable initialization step |
| Read a score made in another program | Use an array of note structs; validate musical values and schedule with a UDO |
| Export a preset | Call `jsonmarshal(preset, 1)` for readable JSON |
| Export function-table values | Copy to an i-rate array, then call `jsonmarshal` |
| Exchange a numeric dataset | Read or write `i[]` at the root; use structs for metadata |

The [file reference](../opcodes/jsonunmarshalfile.md) explains Csound search paths and browser virtual filesystems. The [writer reference](../opcodes/jsonmarshal.md#export-a-function-table) includes a table export with file saving and a read-back check. The [string reference](../opcodes/jsonunmarshal.md#examples) shows typed presets, all supported arrays and the optional JSON syntax extensions.
