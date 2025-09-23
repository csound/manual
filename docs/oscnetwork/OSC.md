# **OSC**

_OSC_ enables interaction between different audio processes, and in particular between Csound and other synthesis engines.

Multiple OSC servers can be set up, separately or together with the Csound ([UDP server](../overview/udp-server.md)).

The following opcodes are available:

* [OSCinit](../opcodes/OSCinit.md) - Start an OSC listener thread.
* [OSClisten](../opcodes/OSClisten.md) - Receive OSC messages.
* [OSCsend](../opcodes/OSCsend.md) - Send an OSC message.
* [OSCinitM](../opcodes/OSCinitM.md) - Start to list for multicast OSC messages.
* [OSCraw](../opcodes/OSCraw.md) - Listen for all OSC messages.
* [OSCcount](../opcodes/OSCcount.md) - Count of OSC messages currently unread.
* [OSCbundle](../opcodes/OSCbundle.md) - Sends data by packing messages in a bundle.

## Credits

By: John ffitch with the liblo library as inspiration and support.<br>
Improvements and extensions by Victor Lazzarini.

UDP server supported added in Csound 7.0.
