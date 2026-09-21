<!--
id:midipgm
category:Real-time MIDI:Input
-->
# midipgm
Reads the last program number received on a MIDI channel.

## Syntax
=== "Modern"
    ``` csound-orc
    iprogram = midipgm([ichannel])
    ```

=== "Classic"
    ``` csound-orc
    iprogram midipgm [ichannel]
    ```

### Initialization

_iprogram_ is the program number, from 1 to 128. MIDI messages carry values from 0 to 127, so `midipgm` adds 1. It returns 0 if the channel has not received a Program Change message or if no channel is available.

_ichannel_ is optional and defaults to 0. With 0, the opcode uses the MIDI channel that started the current note. A score note has no such channel, so it returns 0 unless you give an explicit channel number.

Use a positive integer to read a specific channel. A single MIDI port has channels 1 to 16. Csound also accepts channel numbers up to 1024 for input mapped from multiple ports. A number above 1024 causes an initialization error.

`midipgm` reads the stored program at initialization. A later Program Change message does not update this note's result. The next note reads the new value. The result does not include the bank number.

Reading a program does not change MIDI instrument assignments. Use [pgmassign](pgmassign.md) to control those assignments. With `pgmassign 0, 0`, Program Change messages still update the number that `midipgm` reads, but they do not select a different Csound instrument.

## Examples

Use a MIDI keyboard's program selector to choose a sound for each new note. Program 2 selects a brighter tone. Other programs, including the initial value 0, select a sine tone. A held note keeps its sound when the program changes.

The example listens to MIDI device 0 for one minute. Change `-M0` to suit your MIDI device. If your keyboard labels programs from 0 to 127, select program 1 to hear the brighter tone.

It uses [midipgm.csd](../examples/midipgm.csd).

``` csound-csd title="Choose a tone with MIDI Program Change" linenums="1"
--8<-- "examples/midipgm.csd"
```

To read channel 3 from a score note, use `iprogram = midipgm(3)`.

## See also

[pgmassign](pgmassign.md), [massign](massign.md), [midichn](midichn.md), [midiin](midiin.md), [MIDI input](../midi/input.md)

## Credits

Author Istvan Varga, 2006.
