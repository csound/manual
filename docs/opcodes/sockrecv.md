<!--
id:sockrecv
category:Network
-->
# sockrecv
Receives data from other processes using the low-level UDP or TCP protocols.

Uses the UDP (_sockrecv_ and _sockrecvs_) or TCP (_strecv_) protocol onto a network. The data is not subject to any encoding or special routing. The _sockrecvs_ opcode receives a stereo signal interleaved.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = sockrecv(iport, ilength)
    ksig = sockrecv(iport, ilength)
    asigl, asigr = sockrecvs(iport, ilength)
    String = sockrecv(iport, ilength)
    asig [,kstate] = strecv(Sipaddr, iport)
    ```

=== "Classic"
    ``` csound-orc
    asig sockrecv iport, ilength
    ksig sockrecv iport, ilength
    asigl, asigr sockrecvs iport, ilength
    String sockrecv iport, ilength
    asig [,kstate] strecv Sipaddr, iport
    ```

### Initialization

_Sipaddr_ -- a string that is the IP address of the sender in standard 4-octet dotted form.

_iport_ -- the number of the port that is used for the communication.

_ilength_ -- the length of the individual packets in UDP transmission. This number must be sufficiently small to fit a single MTU, which is set to the save value of 1456.  In UDP transmissions the sender and receiver needs agree on this value

### Performance

_asig, asigl, asigr_ -- audio data to be received.

_ksig_ -- control data to be received.

_String_ -- string data to be received.

_kstate_ -- optional output to give the state of the receipt.  Gives the number of bytes transferred in the current performance cycle or -1 if the sender has ceased writing.

## Examples

The example shows a mono signal being received on port 7777 using UDP.

``` csound-orc
        sr = 44100
        ksmps = 100
        nchnls = 1


        instr   1
        a1 sockrecv   7777, 200
           out        a1
        endin
```

## See also

[Network](../oscnetwork/Network.md)

## Credits

Author: John ffitch<br>
2006<br>

kstate optional output new in 6.14
