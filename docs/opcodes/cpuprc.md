<!--
id:cpuprc
category:Instrument Control:Realtime Performance Control
-->
# cpuprc
Control allocation of cpu resources on a per-instrument basis, to optimize realtime output.

## Syntax
=== "Modern"
    ``` csound-orc
    cpuprc(insnum, ipercent)
    cpuprc(Sinsname, ipercent)
    ```

=== "Classic"
    ``` csound-orc
    cpuprc insnum, ipercent
    cpuprc Sinsname, ipercent
    ```

### Initialization

_insnum_ -- instrument number or string

_Sinsname_ -- instrument number or string

_ipercent_ -- percent of cpu processing-time to assign. Can also be expressed as a fractional value.

### Performance

_cpuprc_ sets the cpu processing-time percent usage of an instrument, in order to avoid buffer underrun in realtime performances, enabling a sort of polyphony theshold. The user must set _ipercent_ value for each instrument to be activated in realtime. Assuming that the total theoretical processing time of the cpu of the computer is 100%, this percent value can only be defined empirically, because there are too many factors that contribute to limiting realtime polyphony in different computers.

For example, if _ipercent_ is set to 5% for instrument 1, the maximum number of voices that can be allocated in realtime, is 20 (5% * 20 = 100%). If the user attempts to play a further note while the 20 previous notes are still playing, Csound inhibits the allocation of that note and will display the following warning message:

```
cannot allocate last note because it exceeds 100% of cpu time
```

In order to avoid audio buffer underruns, it is suggested to set the maximum number of voices slightly lower than the real processing power of the computer. Sometimes an instrument can require more processing time than normal. If, for example, the instrument contains an oscillator which reads a table that does not fit in cache memory, it will be slower than normal. In addition, any program running concurrently in multitasking, can subtract processing power to varying degrees.

At the start, all instruments are set to a default value of _ipercent_ = 0.0% (i.e. zero processing time or rather infinite cpu processing-speed). This setting is OK for deferred-time sessions.

All instances of _cpuprc_ must be defined in the header section, not in the instrument body.

## Examples

Here is an example of the cpuprc opcode. It uses the file [cpuprc.csd](../examples/cpuprc.csd).

``` csound-csd title="Example of the cpuprc opcode." linenums="1"
--8<-- "examples/cpuprc.csd"
```

## See also

[Real-time Performance Control](../control/realtime.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
July, 1999<br>

New in Csound version 3.57; named instruments added version 5.13
