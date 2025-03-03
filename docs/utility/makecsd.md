<!--
id:makecsd
category:Utilities
-->
# makecsd
Creates a CSD file from the specified input files.

The first input file that has a .orc extension (case is not significant) is put to the &lt;CsInstruments&gt; section, and the first input file that has a .sco extension becomes &lt;CsScore&gt;. Any remaining files are Base64 encoded and added as &lt;CsFileB&gt; tags. An empty &lt;CsOptions&gt; section is always added.

Some text filtering is performed on the orchestra and score file:

*  newlines are converted to the native format of the system on which makecsd is being run.
*  blank lines are removed from the beginning and end of files.
*  any trailing whitespace is removed from the end of lines.
*  optionally, tabs can be expanded to spaces with an user specified tabstop size.
*  optionally, a MIDI file can be included.
*  optionally, a Licence can be specified as either a file or a common one.
*  if required a score processor can be specified for the &lt;CsScore&gt; section.

## Syntax
```
makecsd [OPTIONS ... ] infile1 [ infile2 [ ... ]]
```

### Initialization

Flags:

* -_t n_ = expand tabs to spaces using tabstop size n (default: disabled). This applies only to the orchestra and score file.
* -_w n_ = set Base64 line width to n (default: 72). Note: the orchestra and score are not wrapped.
* -_o fname_ = output file name (default: stdout)
* -_m fname_ = specify a MIDI file to include (default: none)
* -_b progname_ = specify the program to process the score (default: none)
* -_L fname_ = file name containing the licence text (default: none)
* -_l integer_ = specify a standard licence (default: none). The ones available are:

    0: All rights reserved<br>
    1: CC BY-NC-ND<br>
    2: CC BY-NC-SA<br>
    3: CC BY-NC<br>
    4: CC BY-ND<br>
    5: CC BY-SA<br>
    6: CC BY<br>
    7: Licenced under BSD

## Examples

```
makecsd -t 6 -w 78 -o file.csd file.mid file.orc file.sco sample.aif
```

This creates a CSD from file.orc and file.sco (tabs are expanded to spaces assuming a tabstop size of 6 characters), and file.mid and sample.aif are added as &lt;CsFileB&gt; tags containing Base64 encoded data with a line width of 78 characters. The output file is file.csd.

## Credits

Author: Istvan Varga<br>
Jan 2003

Author: John ffitch<br>
Feb 2011

Options for MIDI, score processing and licence new in version 5.14
