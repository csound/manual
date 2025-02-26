<!--
id:websocket
category:Signal I/O:File I/O
-->
# websocket
Read and write signals and arrays using a websocket connection.

Plugin opcode in websocketIO. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

_websocket_ reads and writes _N_ signals and arrays using a websocket connection.

## Syntax
``` csound-orc
xout1[, xout2, xout3, ..., xoutN] websocket iport, xin
```

### Initialization

_iport_ the local web port to read/write data.

### Performance

_xout1,... xoutN_ -- The output variables which contain data received from a websocket. On the web side the websocket must send data using a protocol name that matches the output variable name e.g. "ksignal" for a k-rate variable. If an array is intended to be received from a websocket it must be first initialised before being used as an output to the opcode. Otherwise the opcode does not know what size data to expect from the websocket. When sending data to a websocket from the web page it must be sent as a 32 or 64 bit array, depending on the build of Csound that is being used.

_xin_ -- The input variable which contains data to be sent to a websocket. On the web side the websocket receives data using a protocol name that matches the input variable name e.g. "ksignal" for a k-rate variable. When receiving data from a websocket on the web page it must be read as a 32 or 64 bit array, depending on the build of Csound that is being used.

> :memo: **Note**
>
> The total number of input and output arguments is limited to 20.

### Data Formatting

A-rate variables must be send and received as arrays that are _ksmps_ samples large. A-rate arrays similarly are sent and received as _ksmps_ by the number of elements in the array. K-rate variables are sent and received as a single element array. K-rate arrays are sent and received as arrays with matching numbers of elements.

## Examples

Here is a simple example of the websocket opcode. It uses the file [websocket.csd](../../examples/websocket.csd) and [websocket.html](../../examples/websocket.html).

``` csound-csd title="Example of the websocket opcode." linenums="1"
--8<-- "examples/websocket.csd"
```

## See also

[Signal Input](../../sigio/input)

[Signal Output](../../sigio/output)

## Credits

Author: Edward Costello;<br>
NUIM, 2015<br>

New in version 6.06
