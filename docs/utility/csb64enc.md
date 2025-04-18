<!--
id:csb64enc
category:Utilities
-->
# csb64enc
Converts a binary file to a Base64 encoded text file.

The _csb64enc_ utility generates a Base64 encoded text file from a binary file, such as a standard MIDI file (.mid) or any type of audio file. It is useful to convert a file in the format accepted by the [&lt;CsFileB&gt;](../invoke/the-csd-file-format.md#included-base64-files-csfileb) section of a csd file, to include the file within it.

## Syntax
``` csound-orc
csb64enc [OPTIONS ... ] infile1 [ infile2 [ ... ]]
```

### Initialization

Flags:

* -_w n_ = set line width of the output file to n (default: 72)
* -_o fname_ = output file name (default: stdout)

## Examples

```
csb64enc -w 78 -o file.txt file.mid
```

This command produces a Base64 encoded text file from the standard MIDI file _file.mid_. This file can now be pasted within a csd file's [&lt;CsFileB&gt;](../invoke/the-csd-file-format.md#included-base64-files-csfileb) section.

## See also

[makecsd](../utility/makecsd.md)

## Credits

Author: Istvan Varga

Jan 2003
