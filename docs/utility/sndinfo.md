<!--
id:sndinfo
category:Utilities
-->
# sndinfo
Displays information about one or more soundfiles.

## Syntax
```
csound -U sndinfo [options] soundfilenames ...
sndinfo [options] soundfilenames ...
```

### Initialization

_sndinfo_ will attempt to find each named file, open it for reading, read in the soundfile header, then print a report on the basic information it finds. The order of search across soundfile directories is as described [above](top.md).  If the file is of type AIFF, some further details are listed first.

 There are two option types:

1. -i or -i1 will print instrument information, which includes looping. The option continues until a -i0 option.

2. The other option is -b which prints the broadcast information for WAV files. It can similarly be negated with -b0.


## Examples
```
csound -U sndinfo test Bosendorfer/"BOSEN mf A0 st" foo foo2
```

where the environment variables SFDIR = /u/bv/sound, and SSDIR = /so/bv/Samples, might produce the following:

```
util  SNDINFO:      
     /u/bv/sound/test:
           srate 22050, monaural, 16 bit shorts, 1.10 seconds
           headersiz 1024, datasiz 48500  (24250 sample frames)
  
    /so/bv/Samples/Bosendorfer/BOSEN mf A0 st:  AIFF, 197586 stereo samples, base Frq 261.6 (MIDI 60), sustnLp: mode 1, 121642 to 197454, relesLp: mode 0
     AIFF soundfile, looping with modes 1, 0
     srate 44100, stereo, 16 bit shorts, 4.48 seconds
  
     headersiz  402, datasiz 790344  (197586 sample frames)
  
     /u/bv/sound/foo:
           no recognizable soundfile header
  
     /u/bv/sound/foo2:
            couldn't find
```

Here is an example of the sndinfo utility. It uses the file [sndinfo.csd](../examples/sndinfo.csd).

``` csound-csd title="Example of the sndinfo utility." linenums="1"
--8<-- "examples/sndinfo.csd"
```
