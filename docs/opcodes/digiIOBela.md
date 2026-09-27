<!--
id:digiIOBela
category:Signal I/O:Signal Output
-->
# digiIOBela
Reads or writes a Bela digital pin with a changing pin number and direction.

This opcode requires the Bela Csound host. See [Bela digital input and output](../oscnetwork/bela.md) for setup and pin ownership.

## Syntax

=== "Modern"
    ``` csound-orc
    digiIOBela(kstate, kpin, kdir)
    digiIOBela(astate, apin, adir)
    ```

=== "Classic"
    ``` csound-orc
    digiIOBela kstate, kpin, kdir
    digiIOBela astate, apin, adir
    ```

### Performance

All three arguments are required. Use three k-rate signals or three a-rate signals. The audio-rate form needs audio-rate pin and direction signals too, even when their values stay constant.

`kpin` or `apin` selects a Bela digital channel from 0 to 15. The opcode truncates fractional values and clamps the result to this range. The selected pin can change during performance.

`kdir` or `adir` sets direction. A positive value selects output. Zero or a negative value selects input. Use 1 for output and 0 for input.

`kstate` or `astate` must be a writable signal variable. The opcode has no separate output argument. In input mode, it replaces this variable with the pin reading, either 0 or 1. Read the variable after calling the opcode. Do not pass a literal or expression as the first argument when reading input.

In output mode, the opcode sends the variable's value to the pin. Positive values drive it high, while zero and negative values drive it low. Assign the value before the call. Output mode does not replace the variable with a pin reading.

The k-rate form sets direction and reads or writes once per control cycle. Direction and output writes persist for following digital frames until changed. The a-rate form sets direction and reads or writes each digital sample separately.

Selecting a different pin leaves the previous pin's state and direction in place. Avoid changing an externally driven input into an output unless the connected circuit supports that use. See [digiInBela](digiInBela.md) and [digiOutBela](digiOutBela.md) for fixed-direction alternatives.

## Examples

The example reads digital pin 0 and copies its state to digital pin 1. One call uses input mode and the other uses output mode. The input call changes `kInput` in place before the output value is assigned.

Supply a defined logic level to pin 0 and observe pin 1 with suitable logic-level equipment. Keep pin 1 free of other output drivers. During the final second, the example drives pin 1 low before ending.

It uses [digiIOBela.csd](../examples/digiIOBela.csd), which must run on the Bela host.

``` csound-csd title="Read one Bela pin and write its state to another" linenums="1"
--8<-- "examples/digiIOBela.csd"
```

## See also

[digiInBela](digiInBela.md), [digiOutBela](digiOutBela.md), [Bela digital input and output](../oscnetwork/bela.md)

## Credits

Author Victor Lazzarini, 2018.
