<!--
id:oscsendlo
category:OSC
-->
# oscsendlo
Sends OSC messages over UDP using liblo.

`OSCsend_lo` is the older, deprecated alias. Both names use the same implementation. Use `oscsendlo` in new code.

## Syntax

=== "Modern"
    ``` csound-orc
    oscsendlo(kwhen, Shost, kport, Spath [, Stypes, xdata1, xdata2, ...])
    ```

=== "Classic"
    ``` csound-orc
    oscsendlo kwhen, Shost, kport, Spath [, Stypes, xdata1, xdata2, ...]
    ```

### Build requirements

This opcode belongs to the `osc` module. Csound must be built with `BUILD_OSC_OPCODES=ON` and the liblo development headers and library available. CMake looks for `LibLO`. A build without liblo does not provide this opcode. When Csound builds separate opcode modules, install the `osc` module where Csound can load it.

The opcode is available on platforms supported by Csound and liblo. It is not limited to Linux. Check `csound -z` for `oscsendlo` or `OSCsend_lo` in your installation.

### Arguments

`Shost` is a hostname or IP address. An empty string selects the local computer. The opcode uses liblo's UDP address handling. It does not offer a TCP transport option. Multicast is not supported by this sender.

`kport` is the destination UDP port. Use an integer from 1 to 65535. Keep the host and port fixed for each opcode instance.

`Spath` is the OSC address, such as `/tone/frequency`.

`Stypes` describes the following data arguments. Omit the leading OSC comma. You can omit both the type string and data to send a message with no arguments. Match each type to the right Csound value.

| Type | Csound value and OSC representation |
| --- | --- |
| `i` | Numeric value rounded to a 32-bit integer. |
| `h` or `l` | Numeric value rounded and sent as an OSC 64-bit integer with tag `h`. |
| `f` | Numeric value sent as a 32-bit float. |
| `d` | Numeric value sent as a 64-bit double. |
| `s` | Csound string. |
| `c` | Numeric character code. |
| `m` | Numeric value packed into four native-order bytes for an OSC MIDI packet. |
| `b` | Boolean. Zero sends OSC true, and a nonzero value sends OSC false. |
| `tt` | Two numeric values for one OSC timetag, seconds followed by the fractional word. |
| `G` | Function table number. Sends table samples as a blob. |
| `a` | Audio signal. Sends the block length followed by the current block as a blob. |
| `A` | Numeric array blob. See the limitation below. |

The Boolean convention is specific to this opcode. It is the reverse of `oscsend`. A timetag needs two consecutive `t` characters and two arguments. It becomes one `t` in the outgoing message. A timetag argument does not schedule delivery.

The `a` and `G` blobs contain native Csound sample values. A receiver must know the sample size and byte order. The `A` implementation does not send a complete array with its shape and values, so use `oscsend` for array transfer. `D` and symbol type `S` are not supported here.

### Performance

`kwhen` controls when to send. The opcode sends on its first performance call, even when `kwhen` is zero. It sends again whenever `kwhen` changes. A constant value sends once. Changing only the data does not send another message.

Use an increasing counter for repeated messages. A pulse that returns to zero causes a send on both transitions. Data values are read when a message is sent.

The call runs during performance and has no output or delivery status. UDP does not confirm receipt. Check messages at the receiver when testing a connection.

## Differences from oscsend

| Behavior | `oscsendlo` | `oscsend` |
| --- | --- | --- |
| Dependency | Requires liblo and the `osc` module. | Uses Csound's socket sender without liblo. |
| Host | Accepts hostnames, IP addresses and an empty string for the local host. | Uses a numeric IPv4 address or `localhost`. |
| Boolean `b` | Zero is true. Nonzero is false. | Zero is false. Nonzero is true. |
| Timetag format | `"tt"` with two values. | `"t"` with two values. |
| Arrays | `A` does not send a complete array. `D` is unsupported. | Supports array blobs with `A` and `D`. |

Both send on the first call and when `kwhen` changes. Check the type string and receiver expectations when switching between them.

## Examples

The example sends a counter and frequency to UDP port 7770 on the local computer. Start an OSC receiver on that port first and listen for `/tone` with types `if`. It sends once at the start and again as the counter changes to 1 and 2. With `-n`, Csound runs faster than real time, so the messages arrive close together.

``` csound-csd title="Send a counter and frequency with liblo" linenums="1"
--8<-- "examples/oscsendlo.csd"
```

## See also

[OSCsend_lo](OSCsend_lo.md), [oscsend](OSCsend.md), [OSC](../oscnetwork/OSC.md), [liblo documentation](https://liblo.sourceforge.net/docs/group__liblo.html)

## Credits

Author John ffitch, 2005.
