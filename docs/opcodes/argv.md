<!--
id:argv
category:Strings:Definition
-->
# argv
Returns application arguments as a string array.

Use `argv` to pass file paths or settings to an orchestra without editing the CSD. Put them after `--` on the command line, with the CSD filename and all Csound options before it.

## Syntax

=== "Modern"
    ``` csound-orc
    Sargs[] = argv()
    ```

=== "Classic"
    ``` csound-orc
    Sargs[] argv
    ```

### Initialization

`argv` takes no inputs. It fills `Sargs[]` at initialization with one string for each argument after `--`, in the order given, leaving out the separator itself and everything before it.

Array indices start at zero. Use [lenarray](lenarray.md) to check how many arguments you have before reading an element. With no application arguments, the array is empty.

For example, `csound piece.csd -- flute 440` returns `"flute"` at index 0 and `"440"` at index 1. Both are strings. Use [strtod](strtod.md) or [strtol](strtol.md) when you need a number.

Quote an argument that contains spaces, such as `"field recording.wav"`, to keep it in one array element. An empty quoted argument, `""`, also occupies one element. After the separator, even a value such as `--quiet` is an application argument and Csound does not treat it as an option.

You can also put `--` and application arguments in `<CsOptions>`. A command-line `--` replaces that list, and a command-line `--` with nothing after it clears the list.

A host using the Csound API can supply the list with `csoundSetCommandLineArgs()`. The opcode copies the current list when it initializes and does not refresh it during performance.

## Examples

This small command-line tool prints the length of each sound file you pass to it. It produces no audio. Download [argv.csd](../examples/argv.csd), [fox.wav](../examples/fox.wav) and [beats.wav](../examples/beats.wav) into the same folder, then run the following command from that folder.

``` sh
csound argv.csd -- fox.wav beats.wav
```

To inspect your own recording, pass its path instead.

``` sh
csound argv.csd -- "field recording.wav"
```

``` csound-csd title="Print the length of each sound file" linenums="1"
--8<-- "examples/argv.csd"
```

Running `csound argv.csd` without arguments prints a short usage message.

## See also

[lenarray](lenarray.md), [strtod](strtod.md), [strtol](strtol.md), [filelen](filelen.md)

## Credits

Opcode by Hlöðver Sigurðsson, 2026.

New in Csound 7.
