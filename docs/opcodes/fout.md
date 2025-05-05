<!--
id:fout
category:Signal I/O:File I/O
-->
# fout
Outputs a-rate signals to a specified file of an arbitrary number of channels.

## Syntax
=== "Modern"
    ``` csound-orc
    fout(ifilename, iformat, aout1 [, aout2, aout3,...,aoutN])
    fout(ifilename, iformat, array[])
    ```

=== "Classic"
    ``` csound-orc
    fout ifilename, iformat, aout1 [, aout2, aout3,...,aoutN]
    fout ifilename, iformat, array[]
    ```

### Initialization

_ifilename_ -- the output file's name (in double-quotes).

_iformat_ -- a flag to choose output file format (note: Csound versions older than 5.0 may only support formats 0, 1, and 2):

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

In addition, Csound versions 5.0 and later allow for explicitly selecting a particular header type by specifying the format as 10 * fileType + sampleFormat, where fileType may be 1 for WAV, 2 for AIFF, 3 for raw (headerless) files, and 4 for IRCAM; sampleFormat is one of the above values in the range 0 to 9, except sample format 0 is taken from the command line (-o), format 1 is 8-bit signed integers, and format 2 is a-law. So, for example, iformat=25 means 32-bit integers with AIFF header.

### Performance

_aout1,... aoutN_ -- signals to be written to the file. In the case of raw files, the expected range of audio signals is determined by the selected sample format; for sound files with a header like WAV and AIFF, the audio signals should be in the range -0dbfs to 0dbfs.

_fout_ (file output) writes samples of audio signals to a file with any number of channels. Channel number depends by the number of _aoutN_ variables (i.e. a mono signal with only an a-rate argument, a stereo signal with two a-rate arguments etc.) Maximum number of channels is fixed to 64. Multiple _fout_ opcodes can be present in the same instrument, referring to different files.

Notice that, unlike [out](../opcodes/out.md), [outs](../opcodes/outs.md) and [outq](../opcodes/outq.md), _fout_ does not zero the audio variable so you must zero it after calling it. If polyphony is to be used, you can use [vincr](../opcodes/vincr.md) and [clear](../opcodes/clear.md) opcodes for this task.

Notice that _fout_ and [foutk](../opcodes/foutk.md) uses a string containing a file pathname. Whereas, with [fouti](../opcodes/fouti.md) and [foutir](../opcodes/foutir.md), the target file can be only specified by means of a handle-number.

> :memo: **Note**
>
> If you are using _fout_ to generate an audio file for the global output of csound, you might want to use the [monitor](../opcodes/monitor.md) opcode, which can tap the output buffer, to avoid having to route

## Examples

Here is a simple example of the fout opcode. It uses the file [fout.csd](../examples/fout.csd).

``` csound-csd title="Example of the fout opcode." linenums="1"
--8<-- "examples/fout.csd"
```

Here is another example of _fout_, using it to save the contents of a table to an audio file. It uses the file [fout_ftable.csd](../examples/fout_ftable.csd) and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the fout opcode to save the contents of an f-table." linenums="1"
--8<-- "examples/fout_ftable.csd"
```

## See also

[File Input and Output](../sigio/fileio.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1999<br>
Author: John ffitch<br>
NUIM, 2013<br>

New in Csound version 3.56

October 2002. Added a note from Richard Dobson.

Array version new in 6.01
