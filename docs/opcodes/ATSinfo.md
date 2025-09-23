<!--
id:ATSinfo
category:Spectral Processing:ATS
-->
# ATSinfo
Reads data out of the header of an ATS file.

## Syntax
=== "Modern"
    ``` csound-orc
    idata = ATSinfo(iatsfile, ilocation)
    ```

=== "Classic"
    ``` csound-orc
    idata ATSinfo iatsfile, ilocation
    ```

### Initialization

_iatsfile_ – the ATS number (n in ats.n) or the name in quotes of the analysis file made using [ATSA](../utility/atsa.md).

_ilocation_ – indicates which location in the header file to return. The data in the header gives information about the data contained in the rest of the ATS file. The possible values for _ilocation_ are given in the following list:

0. Sample rate (Hz)
1. Frame Size (samples)
2. Window Size (samples)
3. Number of Partials
4. Number of Frames
5. Maximum Amplitude
6. Maximum Frequency (Hz)
7. Duration (seconds)
8. ATS file Type

### Performance

Macros can really improve the legibility of your csound code, I have provided my Macro Definitions below:

``` csound-orc
#define ATS_SAMP_RATE #0#
#define ATS_FRAME_SZ #1#
#define ATS_WIN_SZ #2#
#define ATS_N_PARTIALS #3#
#define ATS_N_FRAMES #4#
#define ATS_AMP_MAX #5#
#define ATS_FREQ_MAX #6#
#define ATS_DUR #7#
#define ATS_TYPE #8#
```

_ATSinfo_ can be useful for writing generic instruments that will work with many ATS files, even if they have different lengths and different numbers of partials etc. Example 2 is a simple application of this.

## Examples

=== "Modern"
    Here is an example of the ATSinfo opcode. It uses the file [ATSinfo-modern.csd](../examples/ATSinfo-modern.csd).
    ``` csound-csd title="Example of the ATSinfo opcode." linenums="1"
    --8<-- "examples/ATSinfo-modern.csd"
    ```

=== "Classic"
    Here is an example of the ATSinfo opcode. It uses the file [ATSinfo.csd](../examples/ATSinfo.csd).
    ``` csound-csd title="Example of the ATSinfo opcode." linenums="1"
    --8<-- "examples/ATSinfo.csd"
    ```

### Other examples

1. 
``` csound-orc
imax_freq     ATSinfo "cl.ats", $ATS_FREQ_MAX
```
    In the example above we get the maximum frequency value from the ATS file "cl.ats" and store it in imax_freq. We use the Csound Macro (defined above) $ATS_FREQ_MAX, which is equivalent to the number 6.
2. 
``` csound-orc
  i_npartials   ATSinfo p4, $ATS_N_PARTIALS
  i_dur         ATSinfo p4, $ATS_DUR
  ktimepnt      line    0, p3, i_dur
  aout          ATSadd  ktimepnt, 1, p4, 1, i_npartials
```
    In the example above we use _ATSinfo_ to retrieve the duration and number of partials in the ATS file indicated by p4. With this info we synthesize the partials using atsadd. Since the duration and number of partials are not "hard-coded" we can use this code with any ATS file.

## See also

[ATS Spectral Processing](../spectral/ATS.md)

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
