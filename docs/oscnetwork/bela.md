# Bela digital input and output

Bela runs Csound alongside its audio and hardware I/O. These opcodes access its digital pins.

* [digiInBela](../opcodes/digiInBela.md) reads a fixed pin.
* [digiOutBela](../opcodes/digiOutBela.md) writes a fixed pin.
* [digiIOBela](../opcodes/digiIOBela.md) selects the pin and direction during performance.

## Setup

Use a Bela Csound project or the `belacsound` host from Csound's Bela integration. The host registers the digital opcodes and supplies their hardware context. Loading a CSD into ordinary desktop Csound does not provide them.

The standalone host is built with `BUILD_BELA` enabled and requires the Bela libraries and Csound library. See the [Csound Bela build instructions](https://github.com/csound/csound/blob/develop/Bela/README.md). For Bela IDE projects, see [Bela's Csound guide](https://learn.bela.io/using-bela/languages/csound/).

Enable digital I/O in the Bela project. Match Csound's sample rate to Bela's audio sample rate. The examples use 44100 Hz and leave `ksmps` unset so the standalone host can choose its audio block size. If setting `ksmps` explicitly, choose a size that divides the Bela audio block evenly.

The examples can be passed to the standalone host with a command such as `belacsound --csd=digiInBela.csd`. Stop the Bela project when finished.

## Pins and rates

Pin numbers are Bela digital channel indices from 0 to 15. They are separate from analog channel numbers and physical header positions. Use the pin diagram for your board to locate them. Bela's [digital I/O reference](https://docs.bela.io/group__iofunctions.html) describes the pin functions and points to board diagrams.

The opcodes truncate fractional pin numbers and clamp the result to 0 through 15. Choose a valid integer explicitly so a mistyped value cannot select a different pin. All arguments are required.

Input values are 0 or 1. Outputs go high for values greater than 0 and low for zero or negative values. An audio-rate digital signal is still a sequence of binary states, not an analog voltage waveform.

The k-rate forms read or write once per control cycle. A k-rate input can miss pulses shorter than that interval. The a-rate forms process successive digital samples. Neither input form debounces a switch.

## Sharing pins

Keep one owner for each pin. Do not let several opcode instances or other Bela code set conflicting directions or output values. When changing direction, ensure the external circuit allows it. An externally driven input must not become a competing output.

Changing the pin selected by `digiIOBela` does not reset the previous pin. These opcodes also have no per-note cleanup that drives an output low. Write the required final value before ending the instrument, or explicitly hand control to another owner.
