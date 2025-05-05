<!--
id:socksend
category:Network
-->
# socksend
Sends data to other processes using the low-level UDP or TCP protocols.

Transmits data directly using the UDP (_socksend_ and _socksends_) or TCP (_stsend_) protocol onto a network. The data is not subject to any encoding or special routing. The _socksends_ opcode send a stereo signal interleaved.

## Syntax
=== "Modern"
    ``` csound-orc
    socksend(asig, Sipaddr, iport, ilength)
    socksend(ksig, Sipaddr, iport, ilength)
    socksends(asigl, asigr, Sipaddr, iport, ilength)
    stsend(asig, Sipaddr, iport)
    ```

=== "Classic"
    ``` csound-orc
    socksend asig, Sipaddr, iport, ilength
    socksend ksig, Sipaddr, iport, ilength
    socksends asigl, asigr, Sipaddr, iport, ilength
    stsend asig, Sipaddr, iport
    ```

### Initialization

_Sipaddr_ -- a string that is the IP address of the receiver in standard 4-octet dotted form.

_iport_ -- the number of the port that is used for the communication.

_ilength_ -- the length of the individual packets in UDP transmission. This number must be sufficiently small to fit a single MTU, which is set to the save value of 1456.  In UDP transmissions the receiver needs to know this value

### Performance

_asig, ksig, asigl, asigr_ -- data to be transmitted.

## Examples

The example shows a simple sine wave being sent just once to a computer called "172.16.0. 255", on port 7777 using UDP. Note that .255 is often used for broadcasting.

``` csound-orc
        sr = 44100
        ksmps = 100
        nchnls = 1


        instr   1
        a1 oscil        20000,441,1
           socksend     a1, "172.16.0.255",7777, 200
        endin
```

## See also

[Network](../oscnetwork/Network.md)

## Credits

Author: John ffitch<br>
2006<br>
