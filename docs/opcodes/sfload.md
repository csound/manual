<!--
id:sfload
category:Signal Generators:Sample Playback
-->
# sfload
Loads an entire SoundFont2 (SF2) sample file into memory.

These opcodes allow management the sample-structure of SF2 files. In order to understand the usage of these opcodes, the user must have some knowledge of the SF2 format, so a brief description of this format can be found in the [SoundFont2 File Format](../siggen/sample.md) section.

_sfload_ should be placed in the header section of a Csound orchestra.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = sfload("filename")
    ```

=== "Classic"
    ``` csound-orc
    ir sfload "filename"
    ```

### Initialization

_ir_ -- output to be used by other SF2 opcodes. For _sfload_, _ir_ is _ifilhandle_.

_&#8220;filename&#8221;_ -- name of the SF2 file, with its complete path. It must be a string typed within double-quotes with &#8220;/&#8221; to separate directories (this applies to DOS and Windows as well, where using a backslash will generate an error), or an integer that has been the subject of a [strset](../opcodes/strset.md) operation

### Performance

_sfload_ loads an entire SF2 file into memory. It returns a file handle to be used by other opcodes. Several instances of _sfload_ can placed in the header section of an orchestra, allowing use of more than one SF2 file in a single orchestra.

If there is an attempt to load the same file twice the existing load is used with a warning message (from version 6.14).

These opcodes only support the sample structure of SF2 files. The modulator structure of the SoundFont2 format is not supported in Csound. Any modulation or processing to the sample data is left to the Csound user, bypassing all restrictions forced by the SF2 standard.

It should be noted that before version 5.12 a maximum of 10 sound fonts could be loaded, a restriction since relaxed.

## Examples

Here is an example of the sfload opcode. It uses the file [sfload.csd](../examples/sfload.csd).

``` csound-csd title="Example of the sfload opcode." linenums="1"
--8<-- "examples/sfload.csd"
```

## See also

[Soundfonts](../siggen/sample.md)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
May 2000<br>

New in Csound Version 4.07
