<!--
id:assert
category:Miscellaneous:Testing
-->
# assert
Checks a condition when testing is enabled.

`assert`, `assert_true` and `asserttrue` check that a value is true. `assert_false` and `assertfalse` check that it is false. All five names use the same testing option and reporting rules.

## Syntax

=== "Modern"
    ``` csound-orc
    assert(condition)
    assert_true(condition)
    asserttrue(condition)
    assert_false(condition)
    assertfalse(condition)
    ```

=== "Classic"
    ``` csound-orc
    assert condition
    assert_true condition
    asserttrue condition
    assert_false condition
    assertfalse condition
    ```

### Initialization

`condition` is a Boolean expression or a numeric value. Zero is false. Any nonzero number is true, including a negative number. The opcodes have no outputs and take no message argument.

| Opcode names | Passes when |
| --- | --- |
| `assert`, `assert_true`, `asserttrue` | The condition is true or the number is nonzero |
| `assert_false`, `assertfalse` | The condition is false or the number is zero |

The current implementation checks at initialization only. It accepts constants, p-fields, i-rate and k-rate numeric values, and i-rate and k-rate Boolean inputs. A k-rate input does not make the assertion run on every control cycle. Use values and expressions that are ready at initialization, since a k-rate expression may not yet have been evaluated.

Audio signals, strings and arrays are not accepted directly. To check an array, for example, compare its length or an individual numeric element.

### Enabling checks

Add `--run-unit-tests` to the command line or `<CsOptions>` to enable the checks. Without this option, the assertions record no checks or failures, so you can leave them in a musical composition for normal playback. Their argument expressions still follow the usual Csound evaluation rules.

When a check fails, Csound adds an error and continues running. At the end it prints a unit test report, and the command-line program returns a nonzero exit status if errors occurred. These opcodes do not print a separate message for each failed check.

## Examples

The main use is testing Csound itself in command-line tests. Assertions can also check assumptions in a composition, such as whether moving up twelve MIDI notes doubles the frequency.

This example plays two notes and checks their pitch calculations and amplitude. It uses [assert.csd](../examples/assert.csd).

``` csound-csd title="Check a pitch calculation in a musical instrument" linenums="1"
--8<-- "examples/assert.csd"
```

Play the notes with checks disabled.

``` sh
csound assert.csd
```

Run the same piece as a test without audio output.

``` sh
csound --run-unit-tests -n assert.csd
```

The report should show six assertions passed, three for each note. To see a failure, change the expected octave ratio from `2 * iFrequency` to `3 * iFrequency`. Each note will then fail one check when testing is enabled.

## See also

[Testing](../misc/testing.md), [Command-line options](../invoke/cs-options-alphabetically.md#-run-unit-tests)

## Credits

Opcodes by Hlöðver Sigurðsson, 2025.

New in Csound 7.
