<!--
id:pvsinfo
category:Spectral Processing:Streaming
-->
# pvsinfo
Get information from a PVOC-EX formatted source.

Get format information about fsrc, whether created by an opcode such as pvsanal, or obtained from a PVOCEX file by pvsfread. This information is available at init time, and can be used to set parameters for other pvs opcodes, and in particular for creating function tables (e.g. for pvsftw), or setting the number of oscillators for pvsadsyn.

## Syntax
=== "Modern"
    ``` csound-orc
    ioverlap, inumbins, iwinsize, iformat = pvsinfo(fsrc)
    ```

=== "Classic"
    ``` csound-orc
    ioverlap, inumbins, iwinsize, iformat pvsinfo fsrc
    ```

### Initialization

_ioverlap_ -- The stream overlap size.

_inumbins_ -- The number of analysis bins (amplitude+frequency) in fsrc. The underlying FFT size is calculated as (inumbins -1) * 2.

_iwinsize_ -- The analysis window size. May be larger than the FFT size.

_iformat_ -- The analysis frame format. If fsrc is created by an opcode, iformat will always be 0, signifying amplitude+frequency. If fsrc is defined from a PVOC-EX file, iformat may also have the value 1 or 2 (amplitude+phase, complex).

## Examples

Here is an example of the pvsinfo opcode. It uses the file [pvsinfo.csd](../examples/pvsinfo.csd).

``` csound-csd title="Example of the pvsinfo opcode." linenums="1"
--8<-- "examples/pvsinfo.csd"
```

The example will produce the following output:

```
instr 1:  iovl = 256.000  inb = 513.000  iws = 2048.000  ifmt = 0.000
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

New in version 4.13
