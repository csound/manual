<!--
id:readks
category:Signal I/O:File I/O
-->
# readks
Reads strings from a text file at regular intervals during performance.

Use `readks` for a timed list of text cues or commands. Each read advances through the file, and the output holds the last string between reads.

## Syntax

=== "Modern"
    ``` csound-orc
    Stext = readks(Sfilename, iprd)
    Stext = readks(ifilcod, iprd)
    ```

=== "Classic"
    ``` csound-orc
    Stext readks Sfilename, iprd
    Stext readks ifilcod, iprd
    ```

### Initialization

`Sfilename` is the filename or path of a text file. Csound searches the current directory and the directories in `SFDIR` and `SSDIR`.

`ifilcod` is a numeric file code. It can select a filename assigned with [strset](strset.md), or be a score p-field containing a quoted filename. Without a matching string assignment, integer code N selects `readk.N`.

`iprd` is the read interval in seconds. Both arguments are required. The interval is fixed at initialization and measured in whole control cycles. Csound truncates `iprd * kr` to an integer and enforces a minimum of one cycle. Use 0 to read every control cycle. Negative values also select that minimum.

For example, with `kr = 1000`, an interval of 0.0029 seconds becomes two cycles, or 0.002 seconds. In an instrument with local `ksmps`, the calculation uses its local control rate.

The file opens at initialization. A missing or unreadable file causes an initialization error. Each opcode instance has its own file position, and reinitialization reopens the file from the beginning.

### Performance

`Stext` is a string updated at performance time. The first read happens on the first control cycle. Later reads follow `iprd`, and the same text remains available between them. Repeated output values do not mean that another line was read.

A read stops after a newline, at the end of the file, or after 1022 bytes, whichever comes first. Longer lines arrive in separate chunks on later reads. The limit counts bytes rather than characters, so use short lines for multibyte text.

Spaces, tabs and newline characters remain in the returned string. A blank line returns its newline, and comment markers have no special meaning. The file opens in binary mode, so a carriage return before a newline also remains in the text. This opcode reads text, not arbitrary data containing zero bytes.

### End of file

The opcode has no end-of-file output. A read that finds no more bytes reports `Read failure in readks` as a performance error. A final line without a newline can still be returned, but the next read fails.

Stop the reader after a known number of entries or use a marker in the file, as in the example. [readf](readf.md) provides a line-number output that reports end of file when that behavior is needed.

## Examples

The example reads [readks.txt](../examples/readks.txt) every half second and prints each cue. It stops when a line begins with `END`, before trying to read past the file. No audio plays.

Run it with `readks.txt` in the current directory or on Csound's sound-file search path. The supplied file has four cues followed by the stop marker.

It uses [readks.csd](../examples/readks.csd).

``` csound-csd title="Read a timed list of text cues" linenums="1"
--8<-- "examples/readks.csd"
```

## See also

[readk](readk.md), [readf](readf.md), [strset](strset.md), [File Input and Output](../sigio/fileio.md)

## Credits

Author John ffitch, 2010.
