<!--
id:ftsamplebank
category:Table Control:Read/Write Operations
-->
# ftsamplebank
Reads a directory for sound files and loads them to a series of GEN01 function tables.

Plugin opcode in ftsamplebank.

## Syntax
=== "Modern"
    ``` csound-orc
    iNumberOfFile = ftsamplebank(SDirectory, iFirstTableNumber, iSkipTime, iFormat, \
                                 iChannel,)
    kNumberOfFile = ftsamplebank(SDirectory, kFirstTableNumber, kTrigger, kSkipTime, \
                                 kFormat, kChannel,)
    ```

=== "Classic"
    ``` csound-orc
    iNumberOfFile ftsamplebank SDirectory, iFirstTableNumber, iSkipTime, iFormat, \
                               iChannel,
    kNumberOfFile ftsamplebank SDirectory, kFirstTableNumber, kTrigger, kSkipTime, \
                               kFormat, kChannel,
    ```

### Initialization

_SDirectory_ -- a string that identifies the directory to browse for files

_FirstTableNumber_ -- this sets the number of the first table into which a soundfile will be loaded

_Trigger_ -- updates the tables when kTrigger is 1, only applicable to k-rate version.

_SkipTime_ -- begin reading at _skiptime_ seconds into the file.

_Format_ -- specifies the audio data-file format:

```
1 - 8-bit signed character    4 - 16-bit short integers
2 - 8-bit A-law bytes         5 - 32-bit long integers
3 - 8-bit U-law bytes         6 - 32-bit floats
```

_Channel_ -- channel number to read in. 0 denotes read all channels.

If _format_ = 0 the sample format is taken from the soundfile header, or by default from the CSound [-o](../invoke/cs-options-alphabetically.md#-o-file-outputfile) command-line flag.

### Performance

_iNumberOfFile_ -- the number of tables that have been created

_kNumberOfFile_ -- the number of tables that have been created

> :memo: **Note**
>
> Loading a lot of sound files into function tables at k-rate may cause some audio dropouts.

## Examples

This example shows ftsamplebank browsing for samples in a fixed location. It loads all samples it finds into GEN01 function tables and then playsa them back in a sequence, one every second. It uses the file [ftsamplebank.csd](../examples/ftsamplebank.csd).

``` csound-csd title="Example of the ftsamplebank opcode." linenums="1"
--8<-- "examples/ftsamplebank.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Rory Walsh<br>
2015<br>
