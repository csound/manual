<!--
id:sdif2ad
category:Utilities
-->
# sdif2ad
Convert files Sound Description Interchange Format (SDIF) to the format usable by Csound's _adsyn_ opcode.

As of Csound version 4.10, _sdif2ad_ was available only as a standalone program for Windows console and DOS.

## Syntax
```
sdif2ad [flags] infilename outfilename
```

### Initialization

Flags:

* _-sN_ -- apply amplitude scale factor N
* _-pN_ -- keep only the first N partials. Limited to 1024 partials. The source partial track indices are used directly to select internal storage. As these can be arbitrary values, the maximum of 1024 partials may not be realized in all cases.
* _-r_ -- byte-reverse output file data. The byte-reverse option  is there to facilitate transfer across platforms, as Csound's [adsyn](../opcodes/adsyn.md) file format is not portable.

If the filename passed to [hetro](../utility/hetro.md) has the extension &#8220;.sdif&#8221;, data will be written in SDIF format as 1TRC frames of additive synthesis data. The utility program _sdif2ad_ can be used to convert any SDIF file containing a stream of 1TRC data to the Csound [adsyn](../opcodes/adsyn.md) format. _sdif2ad_ allows the user to limit the number of partials retained, and to apply an amplitude scaling factor. This is often necessary, as the SDIF specification does not, as of the release of _sdif2ad_, require amplitudes to be within a particular range. _sdif2ad_ reports information about the file to the console, including the frequency range.

The main advantages of SDIF over the _adsyn_ format, for Csound users, is that SDIF files are fully portable across platforms (data is &#8220;big-endian&#8221;), and do not have the duration limit of 32.76 seconds imposed by the 16 bit _adsyn_ format. This limit is necessarily imposed by _sdif2ad_. Eventually, SDIF reading will be incorporated directly into _adsyn_, thus enabling files of any length (subject to system memory limits) to be analysed and processed.

Users should remember that the SDIF formats are still under development. While the 1TRC format is now fairly well established, it can still change.

For detailed information on  the Sound Description Interchange Format, refer to the CNMAT website:

[http://cnmat.CNMAT.Berkeley.EDU/SDIF](http://cnmat.CNMAT.Berkeley.EDU/SDIF)

Some other SDIF resources (including a viewer) are available via the NC_DREAM website:

[http://www.bath.ac.uk/~masjpf/NCD/dreamhome.html](http://www.bath.ac.uk/~masjpf/NCD/dreamhome.html)

## Credits

Author: Richard Dobson

Somerset, England

August, 2000

New in Csound version 4.08
