# **The Utility Programs**

The Csound Utilities are _soundfile preprocessing_ programs that return information on a soundfile or create some analyzed version of it for use by certain Csound generators. Though different in goals, they share a common soundfile access mechanism and are describable as a set. The Soundfile Utility programs can be invoked in two equivalent forms:

```
csound -U utilname flags filenames
```

```
utilname flags filenames
```

In the first, the utility is invoked as part of the Csound executable, while in the second it is called as a standalone program. The second is smaller by about 200K, but the two forms are identical in function. The first is convenient in not requiring the maintenance and use of several independent programs - one program does all. When using this form, a [-U flag](../invoke/cs-options-by-category.md#-u-utility-utilityutility) detected in the command line will cause all subsequent flags and names to be interpreted as per the named utility; i.e. Csound generation will not occur, and the program will terminate at the end of utility processing.

## Directories

Filenames are of two kinds, source soundfiles and resultant analysis files. Each has a hierarchical naming convention, influenced by the directory from which the Utility is invoked. Source soundfiles with a full pathname (begins with dot (.), slash (/), or for ThinkC includes a colon (:)), will be sought only in the directory named. Soundfiles without a path will be sought first in the current directory, then in the directory named by the [SSDIR](../invoke/environment-variables.md) environment variable (if defined), then in the directory named by [SFDIR](../invoke/environment-variables.md). An unsuccessful search will return a &quot;cannot open&quot; error.

Resultant analysis files are written into the current directory, or to the named directory if a path is included. It is tidy to keep analysis files separate from sound files, usually in a separate directory known to the SADIR variable. Analysis is conveniently run from within the SADIR directory. When an analysis file is later invoked by a Csound generator it is sought first in the current directory, then in the directory defined by SADIR.

## Soundfile Formats

Csound can read and write audio files in a variety of formats. Write formats are described by Csound command flags. On reading, the format is determined from the soundfile header, and the data automatically converted to floating-point during internal processing. When Csound is installed on a host with local soundfile conventions (SUN, NeXT, Macintosh) it may conditionally include local packaging code which creates soundfiles not portable to other hosts. However, Csound on any host can always generate and read AIFF files, which is thus a portable format. Sampled sound libraries are typically AIFF, and the variable [SSDIR](../invoke/environment-variables.md) usually points to a directory of such sounds. If defined, the [SSDIR](../invoke/environment-variables.md) directory is in the search path during soundfile access. Note that some AIFF sampled sounds have an audio looping feature for sustained performance; the analysis programs will traverse any loop segment once only.

For soundfiles without headers, an SR value may be supplied by the [-r flag](../invoke/cs-options-by-category.md#-r-num-sample-ratenum) (or its default). If both the [SR header](../opcodes/sr.md) and the command-line flag are present, the flag value will override the header.

When sound is accessed by the audio Analysis programs, only a single channel is read. For stereo or quad files, the default is channel one; alternate channels may be obtained on request.

## Credits

Dan Ellis<br>
MIT Media Lab<br>
Cambridge, Massachussetts
