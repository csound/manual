# Command Line Options

Listed below are the command line options available in Csound 7, organized [alphabeticaly](cs-options-alphabetically.md) or by [categories](cs-options-by-category.md). (Various platform implementations may not react the same way to different flags.)

The command line arguments are of two types: *flag* arguments (beginning with `-` or `--` or `-+`) and *name* arguments (such as filenames). Certain flag arguments take a following name or numeric argument. Flags that start with `--` and `-+` usually take an argument themselves using `=`.

**Examples**

- `-o dac` or `-odac` — write Csound audio output to digital-to-analog-converter  
- `--output=dac` — same in long version  
- `--env:SSDIR+=../samples` — add the directory "samples" (one level on top) to Csound's search path for the Sound Sample Directory  
- `-m 128` — reduce console message output to amplitudes and benchmark information