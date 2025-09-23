<!--
id:OSCraw
category:OSC
-->
# OSCraw
Listen for all OSC messages at a given port.

On each k-cycle looks to see if an OSC message has been received at a given port and copies its contents to a string array. All messages are copied. If a bundle of messages is received, the output array will contain all of the messages in it.

## Syntax
=== "Modern"
    ``` csound-orc
    Smess[], klen = OSCraw(iport)
    ```

=== "Classic"
    ``` csound-orc
    Smess[], klen OSCraw iport
    ```

### Initialization

_iport_ -- a port where messages are going to be received from.

### Performance

_Smess[]_ -- an array of strings containing the message components: address, types, and data items. If the array does not exist (ie. has not been initialised), one will be created with size 2. Arrays cannot grow with the size of the message, so if a message with more than 2 items (ie. with any data items) is to be fully copied into the output, a larger array needs to initialised before it is used. If a message has more items than an array has space for, it is truncated.

_klen_ -- number of items placed in the output array. It is 0 if no message has been received, and at least 2 if a message has been received (address, types are the minimum items).

## Examples

``` csound-csd title="OSCraw.csd" linenums="1"
--8<-- "examples/OSCraw.csd"
```

## See also

[OSC (Open Sound Control)](../oscnetwork/OSC.md)

More information on this opcode: [http://www.youtube.com/watch?v=JX1C3TqP_9Y](http://www.youtube.com/watch?v=JX1C3TqP_9Y), made by Andrés Cabrera

## Credits

Authors: Oeyvind Brandtsegg, Victor Lazzarini<br>
2017<br>

Types aAG are new in Csound 6.07
