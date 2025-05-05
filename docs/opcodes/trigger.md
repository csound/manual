<!--
id:trigger
category:Instrument Control:Sensing and Control
-->
# trigger
Informs when a krate signal crosses a threshold.

## Syntax
=== "Modern"
    ``` csound-orc
    kout = trigger(ksig, kthreshold, kmode)
    ```

=== "Classic"
    ``` csound-orc
    kout trigger ksig, kthreshold, kmode
    ```

### Performance

_ksig_ -- input signal

_kthreshold_ -- trigger threshold

_kmode_ -- can be 0 , 1 or 2

Normally _trigger_ outputs zeroes: only each time _ksig_ crosses _kthreshold_ _trigger_ outputs a 1. There are three modes of using _ktrig_:

* _kmode_ = 0 - (down-up) _ktrig_ outputs a 1 when current value of _ksig_ is higher than _kthreshold,_ while old value of _ksig_ was equal to or lower than _kthreshold_.
* _kmode_ = 1 - (up-down) _ktrig_ outputs a 1 when current value of _ksig_ is lower than _kthreshold_ while old value of _ksig_ was equal or higher than _kthreshold_.
* _kmode_ = 2  - (both) _ktrig_ outputs a 1 in both the two previous cases.

## Examples

Here is an example of the trigger opcode. It uses the file [trigger.csd](../examples/trigger.csd).

``` csound-csd title="Example of the trigger opcode." linenums="1"
--8<-- "examples/trigger.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.49
