# **Phase Vocoder**

> :memo: **Use of PVOC-EX files with the old Csound pvoc opcodes**
> All the original pvoc opcodes can now read a PVOC-EX file, as well as the native non-portable file format. As the PVOC-EX file uses a double-size analysis window, users may find that this gives a useful improvement in quality, for some sounds and processes, despite the fact that the resynthesis does not use the same window size.
>
> Apart from the window size parameter, the main difference between the original .pv format and PVOC-EX is in the amplitude range of analysis frames. While rescaling is applied, so that no significant difference in output level is experienced, whichever file format is used, some slight loss of amplitude can still arise, as the double window usage itself modifies frame amplitudes, of which the resynthesis code is unaware. Note that all the original pvoc opcodes expect a mono analysis file, and multi-channel PVOC-EX files will accordingly be rejected.

These are the original phase vocoder resynthesis opcodes in
Csound. They have been superseeded by [streaming spectral
analysis](../spectral/realtime.md), which is both more efficient
and more flexible to use.

* [pvadd](../opcodes/pvadd.md)
* [pvbufread](../opcodes/pvbufread.md)
* [pvcross](../opcodes/pvcross.md)
* [pvinterp](../opcodes/pvinterp.md)
* [pvoc](../opcodes/pvoc.md)
* [pvread](../opcodes/pvread.md)
* [tableseg](../opcodes/tableseg.md)
* [tablexseg](../opcodes/tablexseg.md)
* [vpvoc](../opcodes/vpvoc.md)

Use the utility [PVANAL](../utility/pvanal.md) to generate pv analysis files.
