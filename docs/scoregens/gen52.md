<!--
id:GEN52
category:
-->
# GEN52
Creates an interleaved multichannel table from the specified source tables, in the format expected by the [ftconv](../opcodes/ftconv.md) opcode.

It can also be used to extract a channel from a multichannel table and store it in a normal mono table, copy tables with skipping some samples, adding delay, or store in reverse order, etc.

Three parameters must be given for each channel to be processed. _fsrc_ declares the source f-table number. The parameter _offset_ specifies an offset for the source file. If different to 0, the source file is not read from the beginning, but the  _offset_ number of values are skipped. The _offset_ is used to determine the channel number to be read from interleaved f-tables, e.g. for channel 2, _offset_ must be 1. It can also be used to set a read offset on the source table. This parameter gives absolute values, so if a skip of 20 sample frames for a 2 channel f-table is desired, _offset_ must be set to 40. The _srcchnls_ parameter is used to declare the number of channels in the source f-table. This parameter sets the skip size when reading the source f-table.

When more than one channel (_nchannels_ > 1) is given, source f-tables are interleaved in the newly created table.

If the source f-table is finished before the destination f-table is full, the remaining values are set to 0.

## Syntax
``` csound-orc
f # time size 52 nchannels fsrc1 offset1 srcchnls1 \
                [fsrc2 offset2 srcchnls2 ... fsrcN offsetN srcchnlsN]
```

## Examples

``` csound-sco
; source tables
f 1 0 16384 10 1
f 2 0 16384 10 0 1
; create 2 channel interleaved table
f 3 0 32768 -52 2 1 0 1 2 0 1
; extract first channel from table 3
f 4 0 16384 -52 1 3 0 2
; extract second channel from table 3
f 5 0 16384 -52 1 3 1 2
```

Here is a complete example of the GEN52 generator. It uses the file [gen52.csd](../examples/gen52.csd).

``` csound-csd title="Example of the GEN52 generator." linenums="1"
--8<-- "examples/gen52.csd"
```

This is the diagram of the waveform of the GEN52 routine, as used in the example:

<figure markdown="span">
![f 3 0 262144 -52 3 2 0 4 2 1 4 2 2 4](../images/gen52.png)
<figcaption>f 3 0 262144 -52 3 2 0 4 2 1 4 2 2 4</figcaption>
</figure>

## Credits

Author: Istvan Varga
