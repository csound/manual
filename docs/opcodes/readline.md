<!--
id:readline
category:Signal I/O:File I/O
-->
# readline
Reads a line from standard input without waiting for the user to finish typing.

`readline` polls input during performance, so audio can continue while the user edits a line. It returns submitted text and a status value that tells the instrument when to use it.

## Syntax

=== "Modern"
    ``` csound-orc
    Sline, kstatus = readline(Sprompt)
    ```

=== "Classic"
    ``` csound-orc
    Sline, kstatus readline Sprompt
    ```

### Prompt and input

`Sprompt` is a required string with no default. Use an empty string for no prompt. On an interactive terminal, the opcode prints the prompt before the first line and again before each following line. Include any desired trailing space in the string.

The prompt appears only when both standard input and standard output are terminals. Redirected input on POSIX systems can still supply lines, but prompts and terminal editing displays are suppressed. The prompt goes to standard output.

Enter submits a line. Left and right arrows move the cursor, and Backspace removes the preceding character. Spaces and tabs remain in the text. The input buffer grows as needed.

### Outputs

`Sline` holds the submitted line without its terminating newline or carriage return. Enter on an empty line returns an empty string. Read the string when `kstatus` is 1, rather than treating it as a view of unfinished typing.

| `kstatus` | Meaning |
| --- | --- |
| 0 | No completed line is ready this control cycle |
| 1 | A completed line is ready on this cycle |
| -1 | Input has ended |

Status 1 lasts for one control cycle. Status -1 persists on later cycles. After a submitted line, the opcode starts another prompt automatically. It does not need a trigger argument.

On an empty input line, Ctrl-D or Ctrl-Z ends input. Actual end of file also ends input. A final fragment without Enter is not returned as a completed line, so terminate each line when feeding text through a pipe. Carriage return and newline each submit a line, so use newline-only input in pipes to avoid an extra empty line from a CRLF pair.

The opcode processes at most one input character per control cycle. Large blocks of pasted or queued text therefore take several cycles to arrive. Terminal output may also delay the status update until the submitted line's display is complete.

### Input ownership

Use one active `readline` at a time. A second prompt in the same Csound instance fails at initialization. A prompt in another Csound instance within the same process also fails while the first owns input.

Initialization fails if Csound has already assigned standard input to another task, such as reading score, MIDI or audio data. Avoid combining `readline` with other keyboard readers such as [sensekey](sensekey.md), or with host code that reads the same input independently.

The opcode releases ownership and restores terminal settings when input ends, the instrument ends, or a read error occurs. A new prompt can then claim input. An input or terminal-output failure reports a performance error rather than returning a separate error status.

### Platforms and hosts

Terminal input and editing are supported on Windows and on POSIX systems with terminal support, including Linux and macOS. POSIX input can also come from a pipe or redirected file. The Windows console path uses keyboard input rather than redirected standard input.

A host application can supply text through Csound's keyboard-text callback or `csoundReadlinePushText`. Host input still uses the same status values and ownership rules. On builds without native terminal input, use host-supplied text. A graphical front end must provide such input if it has no usable terminal.

## Examples

Run the example in a terminal. Type a label and press Enter to print it, or type `quit` to stop. Empty lines are accepted. The example also stops at end of input or after 60 seconds.

It uses audio output to keep performance at real-time speed while you type, but sends only silence. An offline render with `-n` can finish before a person has time to respond.

It uses [readline.csd](../examples/readline.csd).

``` csound-csd title="Read labels while Csound keeps running" linenums="1"
--8<-- "examples/readline.csd"
```

## See also

[sensekey](sensekey.md), [readf](readf.md), [File Input and Output](../sigio/fileio.md)

## Credits

Author Hlöðver Sigurðsson, 2026.

New in Csound 7.
