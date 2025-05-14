<!--
id:chnset
category:Signal I/O:Software Bus
-->
# chnset
Writes data to a channel of the named software bus.

Implies declaring the channel with _imod_=2 (see also [chn_k, chn_a, and chn_S](../opcodes/chn.md)).

## Syntax
=== "Modern"
    ``` csound-orc
    chnset(ival, Sname)
    chnset(kval, Sname)
    chnset(aval, Sname)
    chnset(Sval, Sname)
    chnsetks(Sval, Sname)
    chnseti(ival[], []Sname)
    chnsetk(kval[], []Sname)
    chnseta(aval[], []Sname)
    chnsets(Sval[], []Sname)
    ```

=== "Classic"
    ``` csound-orc
    chnset ival, Sname
    chnset kval, Sname
    chnset aval, Sname
    chnset Sval, Sname
    chnsetks Sval, Sname
    chnseti ival[], []Sname
    chnsetk kval[], []Sname
    chnseta aval[], []Sname
    chnsets Sval[], []Sname
    ```

### Initialization

_Sname_ -- a string that indicates which named channel of the software bus to write.

_Sname[]_ -- an array of string that indicates which named channels of the software bus to write to.

_ival_ -- the control value to write at i-time.

_ival[]_ -- an array of control values to write at i-time.

_Sval_ -- the string value to write at i-time.

_Sval[]_ -- an array of string values to write at i-time.

### Performance

_kval_ -- the control value to write at performance time.

_aval_ -- the audio signal to write at performance time.

_Sval_ -- the string value to write at perf-time. The opcode chnset with strings works at both i- and perf-time, whereas chnsetks works only a perf-time. Channel contents are only updated if the string variable is modified.

_kval[]_ -- an array of control values to write at performance time.

_aval[]_ -- an array of audio vectors to write at performance time.

> :memo: **Note**
>
> Although it is possible to loop through channel names from an array with _chnget_ and _chnset_, using the array based channel opcodes is more efficient.

## Examples

The example shows the software bus being used to write pitch information to a controlling program.

``` csound-orc linenums="1"
sr = 44100
kr = 100
ksmps = 1

instr 1
    a1    in
    kp,ka pitchamdf a1
          chnset    kp, "pitch"
endin
```

=== "Modern"
    Here is another example of the chnset opcode. It uses the file [chnset-modern.csd](../examples/chnset-modern.csd).
    ``` csound-csd title="Example of the chnset opcode." linenums="1"
    --8<-- "examples/chnset-modern.csd"
    ```

=== "Classic"
    Here is another example of the chnset opcode. It uses the file [chnset.csd](../examples/chnset.csd).
    ``` csound-csd title="Example of the chnset opcode." linenums="1"
    --8<-- "examples/chnset.csd"
    ```

## See also

[Software Bus](../sigio/softbus.md)

## Credits

Author: Istvan Varga<br>
2005<br>
Array based channel opcodes added in version 6.14 - Rory Walsh<br>
