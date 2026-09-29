<!--
id:jsonunmarshal
category:Strings:Conversion
-->
# jsonunmarshal

Reads JSON text into a declared user-defined type or a one-dimensional typed array.

The output declaration supplies the expected names and types. A JSON object maps to a user-defined type (UDT); a JSON array maps to a typed array. Nested structs and arrays of structs can describe presets, scores and other structured data.

## Syntax

=== "Modern"
    ``` csound-orc
    value:Type = jsonunmarshal(Sjson [, iflags [, imaxdepth]])
    values:T[] = jsonunmarshal(Sjson [, iflags [, imaxdepth]])
    ```

=== "Classic"
    ``` csound-orc
    value:Type jsonunmarshal Sjson [, iflags [, imaxdepth]]
    values:T[] jsonunmarshal Sjson [, iflags [, imaxdepth]]
    ```

`Type` stands for a type declared with `struct`. `T` stands for `i`, `k`, `b`, `B`, `S`, or a supported UDT. These are placeholders, not literal type names.

### Initialization

`Sjson` is the JSON text. It must contain one complete object or array. Use `{{ ... }}` for an inline Csound string containing JSON double quotes. This opcode does not treat its input as a filename; use [jsonunmarshalfile](jsonunmarshalfile.md) to read a file.

`value` or `values` receives the decoded data. Declare the destination type explicitly for a UDT or when the variable name does not imply the type. The opcode allocates arrays to match the input length, including zero for `[]`. A successful call replaces the whole value; it does not merge fields into an existing preset.

`iflags` is an optional integer. Its default is `0`.

| Value | Accepted input |
| --- | --- |
| `0` | Strict JSON |
| `1` | JSON plus `//` line comments and `/* ... */` block comments |
| `2` | JSON plus trailing commas in objects and arrays |
| `3` | Both comments and trailing commas |

The flags do not allow single quotes, unquoted keys, `NaN`, infinity, or missing fields. Comments inside quoted strings remain text. A `.jsonc` filename does not set flags for you.

`imaxdepth` is an optional integer from `0` to `256`. The default `0` selects a limit of 256 nested objects and arrays. Values `1` through `256` set the limit directly. The root counts as one container; scalar members add no level. For example, `{"notes":[{"pitch":60}]}` needs a limit of at least `3`. To set only the depth, supply `0` for `iflags` first. Negative, fractional, non-finite or out-of-range options cause an initialization error.

### Types and errors

| Csound member or array element | Required JSON value |
| --- | --- |
| `i`, `k` | A finite number in the build's numeric range |
| `b`, `B` | `true` or `false` |
| `S` | A valid UTF-8 string without NUL characters |
| A supported UDT | An object with exactly its declared members |
| A one-dimensional typed array member | An array of values of its declared element type |

Every field must occur exactly once. Names are case-sensitive and may appear in any order. Missing, unknown or duplicate fields, `null`, and wrong value types cause an initialization error. The opcode does not convert numeric strings to numbers or numbers to booleans. All array elements must match the declared type. Audio and spectral values, live handles, and multidimensional arrays are unsupported. Root numbers, booleans, strings and `null` are also unsupported; place a scalar in a struct or array.

A failed read leaves the destination unchanged instead of storing part of the input. It still raises an initialization error: there is no success flag, default-value option, or mode that skips bad entries. Syntax errors give a byte position; mapping errors give a field or element path where possible, such as `$.notes[2].pitch`. The depth limit applies to the complete input, including unknown fields.

See [JSON data: type mappings and fault handling](../strings/json.md#type-mappings) for numeric precision, strings, nested arrays, diagnostics and application-level checks.

### Performance

The opcode runs only at initialization. It initializes `k` and `B` data once; later changes to the input string do not trigger another read. Parsing and allocation are not safe for a real-time audio callback. Load data before live playback or while rendering offline. Starting a new instrument during live playback still runs its initialization in the audio processing path.

## Examples

[jsonunmarshal.csd](../examples/jsonunmarshal.csd) covers every supported scalar type, all supported root array element types, empty arrays, nested UDTs, arrays of UDTs and a write/read round trip.

``` csound-csd title="Read typed JSON and write it back" linenums="1"
--8<-- "examples/jsonunmarshal.csd"
```

The output includes `Restored last note: G4`. The `Rows` value shows how to represent rows of different lengths with an array of structs containing arrays.

[jsonunmarshal-options.csd](../examples/jsonunmarshal-options.csd) reads comments and trailing commas, then writes strict JSON and reads it with default flags.

``` csound-csd title="Read JSON with comments and trailing commas" linenums="1"
--8<-- "examples/jsonunmarshal-options.csd"
```

Its compact output is:

``` json
{"gain":0.2,"name":"soft // literal text"}
```

## See also

[jsonunmarshalfile](jsonunmarshalfile.md), [jsonmarshal](jsonmarshal.md), [JSON data](../strings/json.md), [User-defined types](../orch/data-types.md#user-defined-types), [init](init.md), [String Conversion Opcodes](../strings/convert.md)

## Availability

New in Csound 7.
