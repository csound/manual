<!--
id:cs
category:Utilities
-->
# cs
Starts Csound with a set of options that can be controlled by environment variables, and input and output files determined by the specified filename stem.

## Syntax
``` csound-orc
cs [-OPTIONS] <name> [CSOUND OPTIONS ... ]
```

### Initialization

Flags:

* -_OPTIONS_ = OPTIONS is a sequence of alphabetic characters that can be used for selecting the Csound executable to be run, as well as the command line flags (see below). There is a default for the option 'r' (selects real-time output), but it can be overridden.
* _&lt;name&gt;_ = this is the filename stem for selecting input files; it may contain a path. Files that have .csd, .orc, or .sco extension are searched, and either a CSD or an orc/sco pair that matches &lt;name&gt; the best are selected. MIDI files with a .mid extension are also searched, and if one that matches &lt;name&gt; at least as close as the CSD or orc/sco pair, it is used with the -F flag.

    > :memo: **NOTE**
    >
    > The MIDI file is not used if any -M or -F flag is specified by the user (new in version 4.24.0) Unless there is any option (-n or -o) related to audio output, an output file name with the appropriate extension is automatically generated (based on the name of selected input files and format options). The output file is always written to the current directory.

    > :memo: **NOTE**
    >
    > file name extensions are not case sensitive.

* _[CSOUND OPTIONS ... ]_ = any number of additional options for Csound that are simply copied to the final command line to be executed.

The command line that is executed is generated from four parts:

1. Csound executable (possibly with options). This is exactly one of the following (the last one has the highest precedence):
    * a built-in default
    * the value of the CSOUND environment variable
    * environment variables with a name in the format of CSOUND_x where x is an uppercase letter selected by characters of the -OPTIONS string. Thus, if the -dcba option is used, and the environment variables CSOUND_B and CSOUND_C are defined, the value of CSOUND_B will take effect.
2. Any number of option lists, added in the following order:
    * either some built-in defaults, or the value of the CSFLAGS environment variable if it is defined.
    * environment variables with a name in the format of CSFLAGS_x where x is an uppercase letter selected by characters of the -OPTIONS string. Thus, if the -dcba option is used, and the environment variables CSFLAGS_A and CSFLAGS_C are defined as '-M 1 -o dac' and '-m231 -H0', respectively, the string '-m231 -H0 -M 1 -o dac' will be added.
3. The explicit options of [CSOUND OPTIONS ... ].
4. Any options and file names generated from &lt;name&gt;.

> :memo: **NOTE**
>
> Quoted options that contain spaces are allowed.

## Examples

Assuming the following environment variables:

```
CSOUND    = csoundfltk.exe -W
CSOUND_D  = csound64.exe -J
CSOUND_R  = csoundfltk.exe -h

CSFLAGS   = -d -m135 -H1 -s
CSFLAGS_D = -f
CSFLAGS_R = -m0 -H0 -o dac1 -M "MIDI Yoke NT:  1" -b 200 -B 6000
```

And a directory that contains:

```
foo.orc                 piano.csd
foo.sco                 piano.mid
im.csd                  piano2.mid
ImproSculpt2_share.csd  foobar.csd
```

The following commands will execute as shown:

```
cs foo           => csoundfltk.exe -W -d -m135 -H1 -s -o foo.wav  \
foo.orc foo.sco

cs foob          => csoundfltk.exe -W -d -m135 -H1 -s             \
-o foobar.wav foobar.csd

cs -r imp -i adc => csoundfltk.exe -h -d -m135 -H1 -s -m0 -H0     \
-o dac1 -M "MIDI Yoke NT:  1"  \
-b 200 -B 6000 -i adc          \
ImproSculpt2_share.csd

cs -d im         => csound64.exe -J -d -m135 -H1 -s -f -o im.sf   \
im.csd

cs piano         => csoundfltk.exe -W -d -m135 -H1 -s             \
-F piano.mid -o piano.wav      \
piano.csd

cs piano2        => csoundfltk.exe -W -d -m135 -H1 -s             \
-F piano2.mid -o piano2.wav    \
piano.csd
```

## Credits

Author: Istvan Varga

Jan 2003
