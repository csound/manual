<!--
id:mp3bitrate
category:Signal I/O:Soundfile Queries
-->
# mp3bitrate
Returns the reported bit rate of an MP3 file in kilobits per second.

Use `mp3bitrate` to inspect the compressed data rate before playback or display it beside a filename. It reads file information at initialization and produces no audio.

## Syntax

=== "Modern"
    ``` csound-orc
    ibitrate = mp3bitrate(Sfilename)
    ibitrate = mp3bitrate(ifilcod)
    ```

=== "Classic"
    ``` csound-orc
    ibitrate mp3bitrate Sfilename
    ibitrate mp3bitrate ifilcod
    ```

### Initialization

`Sfilename` is the filename or path of the MP3 file. Csound searches the current directory and the directories in `SFDIR` and `SSDIR`.

`ifilcod` is a numeric file code. It can select a filename assigned with [strset](strset.md), or be a score p-field containing a quoted filename. Without a matching string assignment, a numeric code selects a name such as `soundin.1`. Use integer codes for this form. A filename argument is required and has no default.

`ibitrate` is the decoder's reported bit rate in kilobits per second, where one kilobit is 1000 bits. A result of 128 means 128000 bits per second. Divide by 8 to express the rate in kilobytes per second. This is the rate for the compressed stream as a whole, including all channels.

The opcode returns one i-rate value. It does not follow changes in bit rate during playback. Sample rate in Hz and decoded sample bit depth are separate properties.

### Variable-rate files

When the decoder finds usable frame-count metadata, it estimates the average bit rate from the stream size, frame count and sample rate. Otherwise it reports the bit rate from the MPEG frame header found during initialization. It does not scan every frame to calculate an average.

For variable-rate files, treat the result as metadata-dependent. It may be an average estimate or the rate of one frame. Do not assume it is the exact average for the whole file or an exact measure of its size.

### Availability and errors

`mp3bitrate` uses Csound's bundled MPEG decoder. It does not require the separate `mp3out` plugin or libsndfile's MP3 support. A build must include Csound's MP3 opcodes to provide it.

A missing file or a stream the decoder cannot read causes an initialization error. The opcode does not return a special failure value. An open-file error may name `mp3in`, which shares the file-reading code.

## Examples

The example prints the bit rate of [beats.mp3](../examples/beats.mp3) in kilobits and bits per second. Run it with that file in the current directory or on Csound's sound-file search path. It reads the information without playing the file.

It uses [mp3bitrate.csd](../examples/mp3bitrate.csd).

``` csound-csd title="Read an MP3 file's compressed data rate" linenums="1"
--8<-- "examples/mp3bitrate.csd"
```

## See also

[mp3len](mp3len.md), [filebit](filebit.md), [strset](strset.md), [Sound File Queries](../sigio/queries.md)

## Credits

Author Victor Lazzarini, 2014.
