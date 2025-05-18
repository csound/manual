<!--
id:midifilein
category:Instrument Control:Sensing and Control
-->
# midifilein
Returns a generic MIDI message from a MIDI file.


## Syntax
=== "Modern"
    ``` csound-orc
    status:i,chan:i,data1:i,data2:i,time:i = midifilein(index:i,[id:i])
    status:k, chan:k, data1:k, data2:k, time:k = midifilein(index:k,[id:k])
    ```

=== "Classic"
    ``` csound-orc
    istatus, ichan, idata1, idata2, itime midifilein iindex, id
    kstatus, kchan, kdata1, kdata2, ktime midifilein kindex, kid
    ```

### Initiatialization 

_index_ -- MIDI event index in MIDI file (0 - midifilevents()].

_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.

_status_ -- the type of MIDI message. Can be:

* 128 (note off)
* 144 (note on)
* 160 (polyphonic aftertouch)
* 176 (control change)
* 192 (program change)
* 208 (channel aftertouch)
* 224 (pitch bend)
* 0 if no MIDI message are pending in the MIDI IN buffer

_chan_ -- MIDI channel (1-16 if only one input port is used, higher
if channel is port mapped.)

_data1, data2_ -- message-dependent data values

### Performance

Same as above, but operational only at performance time. Users should
select the appropriate overload for init or perf-time.

## Examples

Here is an example of the midifilein opcode. It uses the file [midifilein.csd](../examples/midifilein.csd).

``` csound-csd title="Example of the midifilein opcode." linenums="1"
--8<-- "examples/midifilein.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
May 2025<br>
New in Csound 7<br>
