<!--
id:jsonmarshal
category:Strings:Conversion
-->
# jsonmarshal

Converts a user-defined type or a one-dimensional typed array to JSON text.

The opcode returns a Csound string containing strict JSON. Use it to export presets, score data, numeric arrays or function-table values. It does not write a file itself.

## Syntax

=== "Modern"
    ``` csound-orc
    Sjson = jsonmarshal(value:Type [, ipretty [, imaxdepth]])
    Sjson = jsonmarshal(values:T[] [, ipretty [, imaxdepth]])
    ```

=== "Classic"
    ``` csound-orc
    Sjson jsonmarshal value [, ipretty [, imaxdepth]]
    Sjson jsonmarshal values [, ipretty [, imaxdepth]]
    ```

`value` must be a declared UDT, and `values` must be a one-dimensional array of a supported type. `Type` and `T` are placeholders. Use `i`, `k`, `b`, `B`, `S`, or a supported UDT for `T`.

### Initialization

`Sjson` receives the complete JSON document. A UDT produces an object whose keys are its member names in declaration order. An array produces a JSON array in element order. Empty arrays produce `[]`.

`ipretty` defaults to `0` for compact output. Set `1` for output with line breaks and four-space indentation. Both forms contain the same values. No other value is valid, and there is no separate indentation-width option.

`imaxdepth` defaults to `0`, which selects a limit of 256 nested objects and arrays. An integer from `1` to `256` sets the limit directly. The root counts as one container; each nested object or array adds one. Scalar values do not add a level. To set a depth limit while keeping compact output, supply `0` for `ipretty`. Negative, fractional, non-finite or out-of-range options cause an initialization error.

### Types and output

| Csound member or array element | JSON output |
| --- | --- |
| Finite `i` or `k` | Number |
| `b` or `B` | Boolean `true` or `false` |
| `S` | String, with JSON escaping for quotes, backslashes and control characters |
| A supported UDT | Object |
| A one-dimensional typed array member | Array |

The root must be a UDT or a typed array. Wrap a lone number, string or boolean in a struct or array. Audio signals, spectral data, live instrument/opcode handles, other unsupported types and multidimensional arrays cause an error, including unsupported member types in an empty array of structs. Nested structs and arrays of structs are supported.

The opcode writes the stored numeric value without a decimal-place setting. Reading and writing use 64-bit double or 32-bit float values, depending on the build. An integer-looking input such as `60` may come back as `60.0`; number spelling, input field order, comments and whitespace do not survive a round trip. `NaN` and infinity cause an error instead of becoming `null`. See [type mappings](../strings/json.md#type-mappings) for precision and string limits.

Encoding errors report an initialization error and leave `Sjson` unchanged. These include unsupported types, non-finite numbers, invalid array storage, excessive nesting, invalid UTF-8 and output beyond Csound's string-size limit. No partial JSON or status code is returned.

### Performance

The opcode runs only at initialization. It reads `k` and `B` members at that time; it does not update `Sjson` when those members change during performance. Initialize the data before calling it. Conversion allocates memory and is not safe for a real-time audio callback. Export before or after live playback, or during an offline render.

## Examples

### Export a function table

The opcode accepts arrays, not table numbers. First use [copyf2array](copyf2array.md) to copy the table's values into an i-rate array, then call `jsonmarshal` on the array. This exports values in index order and excludes the table's guard point. It does not include the table number, GEN routine, sample rate, channels or loop metadata. Put any metadata you need in a UDT alongside the array.

[jsonmarshal.csd](../examples/jsonmarshal.csd) exports eight values in compact and indented form. It saves the indented form to `jsonmarshal-table.json`, reads it back, and copies the restored array into a new table.

``` csound-csd title="Export a table to JSON and read it back" linenums="1"
--8<-- "examples/jsonmarshal.csd"
```

Run it from a directory where you can write files. It replaces any existing `jsonmarshal-table.json`. The output includes:

``` text
Table as JSON: [0.0,0.25,0.5,0.75,1.0,0.75,0.5,0.25]
Restored 8 values; table[4] = 1.00
```

The example opens the file with [fiopen](fiopen.md) in mode `0`, writes through its handle with [fprints](fprints.md), and closes it with [ficlose](ficlose.md) before reading it. Use a fixed `"%s"` format for JSON text; a percent sign inside a JSON string must not act as a print-format instruction. Writing one complete document to a freshly opened file also avoids appending a second document to an old one.

`fprints` has its own output-size limit; this small example is not a general writer for large sample tables. For large exports, pass the returned string to a host that can save it in full, or divide the data into separate, complete documents. `jsonmarshal` itself also needs memory for the whole result. For Csound-native table files, consider [ftsave](ftsave.md).

For nested structs, booleans, strings and all supported array types, see the [jsonunmarshal example](jsonunmarshal.md#examples), which marshals each of those types and reads a preset back.

## See also

[jsonunmarshal](jsonunmarshal.md), [jsonunmarshalfile](jsonunmarshalfile.md), [JSON data](../strings/json.md), [copyf2array](copyf2array.md), [copya2ftab](copya2ftab.md), [fprints](fprints.md), [String Conversion Opcodes](../strings/convert.md)

## Availability

New in Csound 7.
