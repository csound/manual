# Testing

The built-in assertion opcodes check values when you enable `--run-unit-tests`. Their main use is testing Csound itself in command-line tests. You can also keep checks inside a musical composition and enable them when you want to test it.

During normal playback, Csound ignores the checks. Argument expressions still follow the usual evaluation rules. The current assertion opcodes run at initialization only, so they do not monitor a signal throughout a note.

| Opcode names | Purpose |
| --- | --- |
| [assert](../opcodes/assert.md), [assert_true](../opcodes/assert.md), [asserttrue](../opcodes/assert.md) | Check that a condition is true |
| [assert_false](../opcodes/assert.md), [assertfalse](../opcodes/assert.md) | Check that a condition is false |

## Running a test

Enable assertions on the command line and use `-n` to skip audio output.

``` sh
csound --run-unit-tests -n piece.csd
```

You can put `--run-unit-tests` in `<CsOptions>` instead. Failed checks add errors but let the performance continue. Csound prints a report at the end and returns a nonzero exit status when errors occurred.

For Csound's command-line test runner, include the option in the CSD's `<CsOptions>` or in its `<CsTest>` arguments. For example, put this block before `<CsoundSynthesizer>`.

``` toml
<CsTest>
args = ["-n", "-d", "--run-unit-tests"]

[expect]
exit = 0
</CsTest>
```

See the [command-line test instructions](https://github.com/csound/csound/blob/develop/tests/commandline/README.md) for the runner and metadata format. Some tests include `libassert.orc`, which defines separate user-defined assertion opcodes. Those helpers do not use `--run-unit-tests`.

The [assert reference](../opcodes/assert.md) covers all five built-in names and includes a musical example.
