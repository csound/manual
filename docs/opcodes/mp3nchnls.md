<!--
id:mp3nchnls
category:Signal I/O:Soundfile Queries
-->
# mp3nchnls
Returns the number of channels encoded in an MP3 file.

Use `mp3nchnls` to check whether a file is mono or stereo before choosing how to route its audio. The opcode reads file information at initialization and produces no audio.

## Syntax

=== "Modern"
    ``` csound-orc
    ichannels = mp3nchnls(Sfilename)
    ichannels = mp3nchnls(ifilcod)
    ```

=== "Classic"
    ``` csound-orc
    ichannels mp3nchnls Sfilename
    ichannels mp3nchnls ifilcod
    ```

### Initialization

`Sfilename` is the filename or path of the MP3 file. Csound searches the current directory and the directories in `SFDIR` and `SSDIR`.

`ifilcod` is a numeric file code. It can select a filename assigned with [strset](strset.md), or be a score p-field containing a quoted filename. Without a matching string assignment, a numeric code selects a name such as `soundin.1`. Use integer codes for this form. A filename argument is required and has no default.

`ichannels` is 1 for mono or 2 for stereo. Joint stereo and dual-channel MPEG modes also return 2. The result describes the channels encoded in the file, regardless of Csound's `nchnls` setting or any channel conversion used during playback.

The opcode returns one i-rate value from the stream header found during initialization. It does not monitor the file during playback or count Csound's output channels.

### Availability and errors

`mp3nchnls` uses Csound's bundled MPEG decoder. It does not require the separate `mp3out` plugin or libsndfile's MP3 support. A build must include Csound's MP3 opcodes to provide it. For files in other audio formats, use [filenchnls](filenchnls.md).

A missing file or a stream the decoder cannot read causes an initialization error. The opcode does not return 0 to indicate failure. An open-file error may name `mp3in`, which shares the file-reading code.

## Examples

The example reads [beats.mp3](../examples/beats.mp3) and prints its channel count and a mono or stereo label. It also prints Csound's output-channel count to show that this is a separate setting. No audio plays.

Run it with `beats.mp3` in the current directory or on Csound's sound-file search path. Change `SFile` to inspect another MP3 file.

It uses [mp3nchnls.csd](../examples/mp3nchnls.csd).

``` csound-csd title="Check whether an MP3 file is mono or stereo" linenums="1"
--8<-- "examples/mp3nchnls.csd"
```

## See also

[filenchnls](filenchnls.md), [mp3len](mp3len.md), [strset](strset.md), [Sound File Queries](../sigio/queries.md)

## Credits

Author Victor Lazzarini, 2014.
