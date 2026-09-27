<!--
id:mp3sr
category:Signal I/O:Soundfile Queries
-->
# mp3sr
Returns the sample rate encoded in an MP3 file, in Hz.

Use `mp3sr` to inspect a file before playback or compare its sample rate with the orchestra's rate. It reads file information at initialization and produces no audio.

## Syntax

=== "Modern"
    ``` csound-orc
    ifilerate = mp3sr(Sfilename)
    ifilerate = mp3sr(ifilcod)
    ```

=== "Classic"
    ``` csound-orc
    ifilerate mp3sr Sfilename
    ifilerate mp3sr ifilcod
    ```

### Initialization

`Sfilename` is the filename or path of the MP3 file. Csound searches the current directory and the directories in `SFDIR` and `SSDIR`.

`ifilcod` is a numeric file code. It can select a filename assigned with [strset](strset.md), or be a score p-field containing a quoted filename. Without a matching string assignment, a numeric code selects a name such as `soundin.1`. Use integer codes for this form. A filename argument is required and has no default.

`ifilerate` is the sample rate from the stream header, in samples per second for each channel. For example, a 44.1 kHz file returns 44100. Stereo does not double this value. The compressed bit rate in bits per second is a separate property.

The result is an i-rate value read during initialization. It describes the file's encoded sample rate, independently of Csound's `sr` setting or any sample-rate conversion used during playback. Calling `mp3sr` neither changes `sr` nor resamples the file.

### Availability and errors

`mp3sr` uses Csound's bundled MPEG decoder. It does not require the separate `mp3out` plugin or libsndfile's MP3 support. A build must include Csound's MP3 opcodes to provide it. For files in other audio formats, use [filesr](filesr.md).

A missing file or a stream the decoder cannot read causes an initialization error. The opcode does not return 0 to indicate failure. An open-file error may name `mp3in`, which shares the file-reading code.

## Examples

The example reads [beats.mp3](../examples/beats.mp3) and prints its sample rate beside Csound's `sr` value of 48000 Hz. It reports whether the two rates match. No audio plays.

Run it with `beats.mp3` in the current directory or on Csound's sound-file search path. Change `SFile` to inspect another MP3 file.

It uses [mp3sr.csd](../examples/mp3sr.csd).

``` csound-csd title="Compare an MP3 file's sample rate with the orchestra rate" linenums="1"
--8<-- "examples/mp3sr.csd"
```

## See also

[filesr](filesr.md), [mp3len](mp3len.md), [strset](strset.md), [Sound File Queries](../sigio/queries.md)

## Credits

Author Victor Lazzarini, 2014.
