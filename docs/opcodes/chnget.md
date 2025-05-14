<!--
id:chnget
category:Signal I/O:Software Bus
-->
# chnget
Reads data from a channel of the inward named software bus.

Implies declaring the channel with _imode_=1 (see also [chn_k, chn_a, and chn_S](../opcodes/chn.md)).

## Syntax
=== "Modern"
    ``` csound-orc
    ival = chnget(Sname)
    kval = chnget(Sname)
    aval = chnget(Sname)
    Sval = chnget(Sname)
    Sval = chngetks(Sname)
    ival[] = chngeti(Sname[])
    kval[] = chngetk(Sname[])
    aval[] = chngeta(Sname[])
    Sval[] = chngets(Sname[])
    ```

=== "Classic"
    ``` csound-orc
    ival chnget Sname
    kval chnget Sname
    aval chnget Sname
    Sval chnget Sname
    Sval chngetks Sname
    ival[] chngeti Sname[]
    kval[] chngetk Sname[]
    aval[] chngeta Sname[]
    Sval[] chngets Sname[]
    ```

### Initialization

_Sname_ -- a string that identifies a channel of the named software bus to read.

_Sname[]_ -- an array of named software channels to query.

_ival_ -- the control value read at i-time.

_Sval_ -- the string value read at i-time.

_ival[]_ -- an array of control values read at i-time.

_Sval{}_ -- an array of strings read at i-time.

### Performance

_kval_ -- the control value read at performance time.

_kval[]_ -- an array of control values read at performance time.

_aval_ -- the audio signal read at performance time.

_aval[]_ -- the array of audio vectors read at performance time.

_Sval_ -- the string value read at k-rate. The chnget opcode works both at i-time and perf-time, whereas chngetks works only at perf-time. String variables are only updated if the channel has changed.

> :memo: **Note**
>
> Although it is possible to loop through channel names from an array with _chnget_ and _chnset_, using the array based variants is more efficient.

## Examples

The example shows the software bus being used as an asynchronous control signal to select a filter cutoff.  It assumes that an external program that has access to the API is feeding the values.

``` csound-orc linenums="1"
sr = 44100
kr = 100
ksmps = 1

instr   1
    kc   chnget    "cutoff"
    a1   oscil     p4, p5, 100
    a2   lowpass2  a1, kc, 200
         out       a2
endin
```

=== "Modern"
    Here is another example of the chnget opcode. It uses the file [chnget-modern.csd](../examples/chnget-modern.csd).
    ``` csound-csd title="Example of the chnget opcode." linenums="1"
    --8<-- "examples/chnget-modern.csd"
    ```

=== "Classic"
    Here is another example of the chnget opcode. It uses the file [chnget.csd](../examples/chnget.csd).
    ``` csound-csd title="Example of the chnget opcode." linenums="1"
    --8<-- "examples/chnget.csd"
    ```

## See also

[Software Bus](../sigio/softbus.md)

## Credits

Author: Istvan Varga<br>
2005<br>
Array based channel opcodes added in version 6.14 - Rory Walsh<br>
