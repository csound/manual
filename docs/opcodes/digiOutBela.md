<!--
id:digiOutBela
category:Signal I/O:Signal Output
-->
# digiOutBela
Writes a Bela digital output pin.

This opcode requires the Bela Csound host. See [Bela digital input and output](../oscnetwork/bela.md) for setup, pin numbering and shared-pin rules.

## Syntax

=== "Modern"
    ``` csound-orc
    digiOutBela(kstate, ipin)
    digiOutBela(astate, ipin)
    ```

=== "Classic"
    ``` csound-orc
    digiOutBela kstate, ipin
    digiOutBela astate, ipin
    ```

### Initialization

`ipin` selects a digital channel from 0 to 15. It is required and fixed at initialization. Fractional values are truncated, then limited to this range. The opcode sets the pin to output on its first performance call.

### Performance

`kstate` or `astate` sets the output level. Positive values drive the pin high. Zero and negative values drive it low. Use 0 and 1 for clear low and high states. The opcode has no output arguments.

The k-rate form writes at the current digital frame and holds the value for following frames until another write changes it. The a-rate form writes each digital sample separately. These are digital states, regardless of the argument's rate or amplitude.

For a changing pin number or direction, use [digiIOBela](digiIOBela.md). Ending a note does not make this opcode reset the pin, so send the desired final state before it ends.

## Examples

The example generates a one-Hz pulse on digital output 1, with equal high and low times. Observe it with suitable logic-level test equipment or a correctly wired LED circuit. The final second holds the output low before the instrument ends.

It uses [digiOutBela.csd](../examples/digiOutBela.csd), which must run on the Bela host.

``` csound-csd title="Send a slow pulse to a Bela digital output" linenums="1"
--8<-- "examples/digiOutBela.csd"
```

## See also

[digiInBela](digiInBela.md), [digiIOBela](digiIOBela.md), [Bela digital input and output](../oscnetwork/bela.md)

## Credits

Author Victor Lazzarini, 2017.
