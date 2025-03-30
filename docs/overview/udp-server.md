# UDP Server

Csound includes a fully-functional UDP server, which can accept a range of commands, including Open Sound Control, and/or orchestra.

## Overview

The UDP server can be started with the following option:
```
   --port=N
```
where N indicates a port number to listen to UDP messages. Csound does not necessarily need to be given a CSD or orchestra, although it is also possible to do so.
    

## Commands

Commands take the form of an opcode followed by one or more arguments. The following commands are accepted by the server:
```
   &[line event]
```
Sends in a line event [live event]. Multiple events can be send on multiple lines. Use this command for single or multiple events that do not need preprocessing.


```
   $[score]
```
Sends in a score [score], to which most preprocessing (except for tempo) can  be applied. Use this option for larger blocks of score events.


```
   @[channel_name] [value]
```
Set a control channel [channel_name] with the value [value].  Example:   if the csd contains the line ' chn_k "freq", 440' then send '@freq 330' sets "freq" to 330


```
   %[channel_name] [string]
```
Set a string channel [channel_name] with the string [string].
  

```
   :@[channel_name] [address] [port]
```
Request the value of the control channel [channel_name] to be sent as a string via UDP to address [address] port [port]. The string will contain the channel name followed by two colons (::) and its current value.


```
   :%[channel_name] [address] [port]
```
Request the contents of the string channel [channel_name] to be sent as a string via UDP to address [address] port [port]. The string will contain the channel name followed by two colons (::) and its current contents.


```
   /[OSC message]
```
A command starting with a slash "/" is interpreted as an Open Sound Control (OSC) Message. The data contents of the command are expected to adhere to the OSC format. See the section below on OSC for more details.



## Orchestra code

In addition to the above commands, the UDP server also accepts a string containing orchestra code, which is compiled immediately. The orchestra string is not prefixed with any special command opcode. This string should be sent in a single UDP message. For example: `scoreline_i "i 2 0 1 550 60"`

If the orchestra code length exceeds the number of characters that are possible in a single message, it can be broken in separate messages. For this to work, the whole orchestra code needs to enclosed in brackets ({ }). The open brackets ({) starts the server taking the code in and the close brackets (}) sends the code for compilation. This way the code can be sent in multiple messages.

## Closing the server

The server (and Csound) can be closed with one of the following commands:

```
    ##close##
```
 or

```
   !!close!!
```

## Open Sound Control

The UDP server can work as an OSC server as it can parse OSC messages sent in from remote clients. Any incoming data block starting with a slash ("/") is expected to be an OSC message. The server parses messages in two groups: system and user-defined.

System messages: these are defined by addresses starting with "/csound" and used for global engine commands. The following are the currently-defined system messages:

```
/csound/compile "s" [string]
```
Compiles the string passed as the message data.

```
/csound/event "s" [string]
```
Sends an event defined by the string passed as the message data.
 
```
/csound/event/instr "fff..." [float data]
```
Instantiates an instrument with p-fields as defined in the message type and data. Only float types are accepted.

```
/csound/channel/a[/b/c...] "..." [float data]
```
Sets software bus channels a[, b, c, ...] according to the message type and data. Floats and strings are allowed, one datum per channel.

```
  /csound/event/end
  /csound/exit
  /csound/close
  /csound/stop
```
 Stops the performance and UDP server 
 
User-defined: these are defined by any other addresses chosen by the user. They are stored in a list and can be retrieved using the OSClisten opcode.

``` csound-orc title="Code example" linenums="1"
<CsoundSynthesizer>
<CsOptions>
-odac  --port=7000  ;;;RT audio out and server port
</CsOptions>
<CsInstruments>

0dbfs = 1

instr 1
 freq:k chnget "freq"
 amp:k  chnget "amp"
    out oscili(0dbfs*amp, p4*freq)
 status:k, f:k, mess:S, n:k OSClisten "/in", "fsi"
 puts mess, status
 printk2 n
 printk2 f
 status, nums:k[] OSClisten "/ina", "fi"
 printk2 nums[0]
 printk2 nums[1] 
endin

instr 2
 OSCsend 0, "localhost", 7000, "/csound/event/instr", "ffff", 1, 0, 1, 300
 OSCsend 1, "localhost", 7000, "/csound/channel/freq/amp", "ff", p4, p5
 OSCsend 2, "localhost", 7000, "/in", "fsi", p5, "hello", p4
 OSCsend 3, "localhost", 7000, "/ina", "fi", p5, p4
 OSCsend 4, "localhost", 7000, "/csound/event", "s", "i3 4 1"
 OSCsend 5, "localhost", 7000, "/csound/compile", "s", "schedule 1,2,2,500"
endin

instr 3
 OSCsend 0, "localhost", 7000, "/csound/stop"
endin

</CsInstruments>
<CsScore>
i2 0 2 1 0.2
</CsScore>
</CsoundSynthesizer>
```
