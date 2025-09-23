<!--
id:ftaudio
category:Table Control:Read/Write Operations
-->
# ftaudio
Write a previously-allocated table to an audio file in a variety of formats.

## Syntax
=== "Modern"
    ``` csound-orc
    ians = ftaudio(ifn, "filename", iformat[, ibeg, iend])
    kans = ftaudio(ktrig, kfn, "filename", kformat [, isync, kbeg, kend])
    ```

=== "Classic"
    ``` csound-orc
    ians ftaudio ifn, "filename", iformat[, ibeg, iend]
    kans ftaudio ktrig, kfn, "filename", kformat [, isync, kbeg, kend]
    ```

### Initialization

_ifn, kfn_ -- Number of table to write.

_"filename"_ -- A quoted string containing the name of the file to save.

_iformat, kformat_ -- Format of the file to save.

*  -1 - format exactly as per global csound output format flags (-A, -W, --format=..., etc).
*  0 - 32-bit floating point samples without header (binary PCM multichannel file)
*  1 - 16-bit integers without header (binary PCM multichannel file)
*  2 - 16-bit integers with a header. The header type depends on the render (-o) format. For example, if the user chooses the AIFF format (using the [-A flag](../invoke/cs-options-alphabetically.md#-a-aiff-formataiff)), the header format will be AIFF type.
*  3 - u-law samples with a header (see iformat=2).
*  4 - 16-bit integers with a header (see iformat=2).
*  5 - 32-bit integers with a header (see iformat=2).
*  6 - 32-bit floats with a header (see iformat=2).
*  7 - 8-bit unsigned integers with a header (see iformat=2).
*  8 - 24-bit integers with a header (see iformat=2).
*  9 - 64-bit floats with a header (see iformat=2).
*  50 - ogg-vorbis format.

In addition Csound allows for explicitly selecting a particular header type by specifying the format as 10 * fileType + sampleFormat, where fileType may be 1 for WAV, 2 for AIFF, 3 for raw (headerless) files, and 4 for IRCAM; sampleFormat is one of the above values in the range 0 to 9, except sample format 0 is taken from the command line (-o), format 1 is 8-bit signed integers, and format 2 is a-law. So, for example, iformat=25 means 32-bit integers with AIFF header.

_isync_ -- if zero the k-rate version waits for the write to finish.  If non-zero (default) the writing of data is delegated to a separate thread which then allows Csound to continue with the rendering.

_ibeg_,_iend_,_kbeg_,_kend_ -- gives limits to start and end of section of the table to write, in samples. Default values of zero means from start to end.

_ians, kans_ -- returns zero if the operation fails or 1 on success.  In the asynchronous mode this is updated when the writing finishes, until when it has the value -1

### Performance

_ktrig_ -- the k-rate version only happens on a k-cycle when ktrig is non-zero.

## Examples

Here is an example of the ftaudio opcode. It uses the file [ftaudio.csd](../examples/ftaudio.csd).

``` csound-csd title="Example of the ftaudio opcode." linenums="1"
--8<-- "examples/ftaudio.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: John ffitch

Example written by John ffitch.

New in version 6.12

Limit to range bnew in 6.13
