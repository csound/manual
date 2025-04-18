# **Waveshaping and Phase Distortion**

These opcodes can perform dynamic waveshaping or phaseshaping (a.k.a. phase distortion).  They differ from traditional table-based methods of waveshaping by directly calculating the transfer function with one or more variable parameters for affecting the amount or results of the shaping.  Most of these opcodes could be used on either an audio signal (for waveshaping) or a phasor (for phaseshaping) but tend to work best for one of these applications.  

These opcodes are good for waveshaping:

* [chebyshevpoly](../opcodes/chebyshevpoly.md)
* [clip](../opcodes/clip.md)
* [distort](../opcodes/distort.md)
* [distort1](../opcodes/distort1.md)
* [polynomial](../opcodes/polynomial.md)
* [powershape](../opcodes/powershape.md)

These opcodes are good for phaseshaping:

* [pdclip](../opcodes/pdclip.md)
* [pdhalf](../opcodes/pdhalf.md)
* [pdhalfy](../opcodes/pdhalfy.md)
* [vps](../opcodes/vps.md)
