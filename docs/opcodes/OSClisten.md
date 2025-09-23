<!--
id:OSClisten
category:OSC
-->
# OSClisten
Listen for OSC messages to a particular path, either from a custom-defined OSC server or from the Csound UDP server.

Plugin opcode in osc; internal opcode (for UDP server)

On each k-cycle looks to see if an OSC message has been sent to a given path of a given type.

## Syntax
=== "Modern"
    ``` csound-orc
    kans = OSClisten(ihandle, idest, itype [, xdata1, xdata2, ...])
    kans, kdata[] = OSClisten(ihandle, idest, itype)
    kans, ... = OSClisten(idest, itype)
    ```

=== "Classic"
    ``` csound-orc
    kans OSClisten ihandle, idest, itype [, xdata1, xdata2, ...]
    kans, kdata[] OSClisten ihandle, idest, itype
    kans, ... OSClisten idest, itype
    ```

### Initialization

_ihandle_ -- In the first two versions (overloads) of the opcode, a handle returned by an earlier call to OSCinit, to associate OSClisten with a particular port number. The third overload does not take a handle as it will listen for messages sent to the Csound [UDP server](../overview/udp-server.md).

_idest_ -- a string that is the destination address. This takes the form of a path prefixed with a forward slash, with optional subdirectories separated by forward slashes. Csound processes incoming messages that match this address.

_itype_ -- a string that indicates the types of the optional arguments that are to be read. The string can contain the characters "acdfhisAG" which stand for audio, character, double, float, 64-bit integer, 32-bit integer, string, scalar array and f-table. All types other than 'asA' require a k-rate variable; 's' requires a string variable, 'a' an audio variable and 'A' an i- or k- rate array. For type 'G', a variable or constant can be used.

A handler is inserted into the listener (see OSCinit) to intercept messages that match this pattern.

### Performance

_kans_ -- set to 1 if a new message was received, or 0 if not. If multiple messages are received in a single control period, the messages are buffered, and OSClisten can be called again until zero is returned.

If there was a message the _xdata_ variables are set to the incoming values, as interpretted by the _itype_ parameter. Note that although the _xdata_ variables are on the right of an operation, they are actually outputs, and so must be variables of type a, ga, k, gk, S, gS, k[] and gk[] and may need to be declared with init, or = in the case of string variables, before calling OSClisten.

Alternatively, if  the message to be received is a series of values all of the same scalar numeric type (e.g., one of "dfhi"), then the return parameter _kdata_ may be used in place of _xdata_ variables. _kdata_ must be an array, it must be declared with init before calling OSClisten, or used with the [] syntax.  It will be created to sufficient size if it is other that a one dimensional array of size greater or equal to length as the format string. If a message is received, this array will be filled with the incoming values. See below for an example of this usage.

The third overload uses a different number of outputs of different types (k or S) to store messages matching address and type, which are coming into the UDP server. It only accepts scalar values ("dfhi")  or strings ("s").

## Examples

This example shows a pair of floating point numbers being received on port 7770.

``` csound-orc
  sr = 44100
  ksmps = 100
  nchnls = 2

  gihandle OSCinit 7770

  instr   1
    kf1 init 0
    kf2 init 0
nxtmsg:
    kk  OSClisten gihandle, "/foo/bar", "ff", kf1, kf2
if (kk == 0) goto ex
    printk 0,kf1
    printk 0,kf2
    kgoto nxtmsg
ex:
  endin
```

This example shows use of the alternate form of the opcode, where an array is used to receive a list of scalar values. In this case, the OSC sender is simulating a set of radio buttons (as is done, for example by a Lemur "Switches" object set in this mode), where the button that is set will have value 1.0 and all other buttons will have value 0.0.

``` csound-orc
    gihandle OSCinit 7770
    instr   1
      ; the UI object behind the OSC sender has 5 buttons arranged as radio buttons
      kdata[] init 5
  nxtmsg:
      kk, kdata  OSClisten gihandle, "/foo/bar", "fffff"
  if (kk == 0) goto ex
      ; the only button with a non-zero value will be the one that is set,
      ; so maxarray is used to get the index of that element
      kmax, kidx maxarray kdata
      printks "button %d (zero-based) is set\n", 0, kidx
      kgoto nxtmsg
  ex:
    endin
```

The following two .csd files demonstrate the usage of the OSC opcodes in csound. The first file, [OSCmidisend.csd](../examples/OSCmidisend.csd), transforms received real-time MIDI messages into OSC data. The second file, [OSCmidircv.csd](../examples/OSCmidircv.csd), can take these OSC messages, and intrepret them to generate sound from note messages, and store controller values. It will use controller number 7 to control volume. Note that these files are designed to be on the same machine, but if a different host address (in the IPADDRESS macro) is used, they can be separate machines on a network, or connected through the internet.

``` csound-csd title="OSCmidisend.csd" linenums="1"
--8<-- "examples/OSCmidisend.csd"
```

``` csound-csd title="OSCmidircv.csd." linenums="1"
--8<-- "examples/OSCmidircv.csd"
```

The next example demonstrates the usage of the third overload of the OSClisten opcode. It uses the file [OSClistenex2.csd](../examples/OSClistenex2.csd).

``` csound-csd title="OSClistenex2.csd" linenums="1"
--8<-- "examples/OSClistenex2.csd"
```

## See also

[OSC (Open Sound Control)](../oscnetwork/OSC.md)

More information on this opcode: [http://www.youtube.com/watch?v=JX1C3TqP_9Y](http://www.youtube.com/watch?v=JX1C3TqP_9Y), made by Andrés Cabrera

## Credits

Author: John ffitch Victor Lazzarini<br>
2005, 2024<br>
Examples by: David Akbari, Andrés Cabrera and Jonathan Murphy 2007; Victor Lazzarini 2024<br>

Types aAG are new in Csound 6.07<br>
The use an an array for outputs is new in Csound 6.12<br>
UDP server support new in Csound 7.0<br>
