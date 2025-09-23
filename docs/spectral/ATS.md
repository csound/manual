# **ATS Spectral Processing**

These opcodes can read, transform and resynthesize ATS analysis files. Please note that you need the ATS application to produce analysis files. From the ATS Reference Manual:

"_ATS is a software library of functions for spectral Analysis, Transformation, and Synthesis of sound based on a sinusoidal plus critical-band noise model. A sound in ATS is a symbolic object representing a spectral model that can be sculpted using a variety of transformation functions._"

For more information on ATS visit: [https://ccrma.stanford.edu/~juan/ATS_manual.html](https://ccrma.stanford.edu/~juan/ATS_manual.html).

ATS analysis files can be produced using the ATS software or the csound utility [ATSA](../utility/atsa.md).

The opcodes for ATS processing are:

* [ATSinfo](../opcodes/ATSinfo.md): reads data out of the header of an ATS file.
* [ATSread](../opcodes/ATSread.md), [ATSreadnz](../opcodes/ATSreadnz.md), [ATSbufread](../opcodes/ATSbufread.md), [ATSinterpread](../opcodes/ATSinterpread.md), [ATSpartialtap](../opcodes/ATSpartialtap.md): read data from an ATS file or buffer.
* [ATSadd](../opcodes/ATSadd.md), [ATSaddnz](../opcodes/ATSaddnz.md), [ATScross](../opcodes/ATScross.md), [ATSsinnoi](../opcodes/ATSsinnoi.md): Resynthesize sound.

## Credits

Author: Alex Norman<br>
Seattle,Washington<br>
2004<br>
