<!--
id:trigseq
category:Instrument Control:Sensing and Control
-->
# trigseq
Accepts a trigger signal as input and outputs a group of values.

## Syntax
=== "Modern"
    ``` csound-orc
    trigseq(ktrig_in, kstart, kloop, kinitndx, kfn_values, kout1 [, kout2] [...])
    ```

=== "Classic"
    ``` csound-orc
    trigseq ktrig_in, kstart, kloop, kinitndx, kfn_values, kout1 [, kout2] [...]
    ```

### Performance

_ktrig_in_ -- input trigger signal

_kstart_ -- start index of looped section

_kloop_ -- end index of looped section

_kinitndx_ -- initial index

> :memo: **Note**
>
> Although _kinitndx_ is listed as k-rate, it is in fact accessed only at init-time. So if you are using a k-rate argument, it must be assigned with [init](../opcodes/init.md).

_kfn_values_ -- number of a table containing a sequence of groups of values

_kout1_ -- output values

_kout2, ..._ (optional) -- more output values

This opcode handles timed-sequences of groups of values stored into a table.

_trigseq_ accepts a trigger signal (_ktrig_in_) as input and outputs group of values (contained in the _kfn_values_ table) each time _ktrig_in_ assumes a non-zero value. Each time a group of values is triggered, table pointer is advanced of a number of positions corresponding to the number of group-elements, in order to point to the next group of values. The number of elements of groups is determined by the number of _koutX_ arguments.

It is possible to start the sequence from a value different than the first, by assigning to _kinitndx_ an index different than zero (which corresponds to the first value of the table). Normally the sequence is looped, and the start and end of loop can be adjusted by modifying _kstart_ and _kloop_ arguments. User must be sure that values of these arguments (as well as _kinitndx_) correspond to valid table numbers, otherwise Csound will crash because no range-checking is implemented.

It is possible to disable loop (one-shot mode) by assigning the same value both to _kstart_ and _kloop_ arguments. In this case, the last read element will be the one corresponding to the value of such arguments. Table can be read backward by assigning a negative _kloop_ value.

_trigseq_ is designed to be used together with [seqtime](../opcodes/seqtime.md) or [trigger](../opcodes/trigger.md) opcodes.

## Examples

Here is an example of the trigseq opcode. It uses the file [trigseq.csd](../examples/trigseq.csd).

``` csound-csd title="Example of the trigseq opcode." linenums="1"
--8<-- "examples/trigseq.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Gabriel Maldonado

November 2002. Added a note about the _kinitndx_ parameter, thanks to Rasmus Ekman.

January 2003. Thanks to a note from Øyvind Brandtsegg, I corrected the credits.

New in version 4.06
