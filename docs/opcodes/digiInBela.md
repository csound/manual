<!--
id:digiInBela
category:Signal I/O:Signal Input
-->
# digiInBela
Reads a Bela digital input pin.

This opcode requires the Bela Csound host. See [Bela digital input and output](../oscnetwork/bela.md) for setup, pin numbering and shared-pin rules.

## Syntax

=== "Modern"
    ``` csound-orc
    kstate = digiInBela(ipin)
    astate = digiInBela(ipin)
    ```

=== "Classic"
    ``` csound-orc
    kstate digiInBela ipin
    astate digiInBela ipin
    ```

### Initialization

`ipin` selects a digital channel from 0 to 15. It is required and fixed at initialization. Fractional values are truncated, then limited to this range. The opcode sets the pin to input on its first performance call.

### Performance

`kstate` or `astate` is 1 when the pin is high and 0 when it is low. The k-rate form reads one digital sample per control cycle. The a-rate form reads successive samples throughout the audio block.

The opcode does not average the readings or debounce a switch. Use the a-rate form when transitions within a control cycle matter. For a changing pin number, use [digiIOBela](digiIOBela.md).

## Examples

The example gates a quiet sine tone from digital input 0. Provide a defined high or low logic level with a properly wired switch or logic source, following your Bela board's wiring guidance. An unconnected input need not have a stable value.

A short smoothing time softens changes in volume. It does not debounce the input.

It uses [digiInBela.csd](../examples/digiInBela.csd), which must run on the Bela host.

``` csound-csd title="Gate a tone with a Bela digital input" linenums="1"
--8<-- "examples/digiInBela.csd"
```

## See also

[digiOutBela](digiOutBela.md), [digiIOBela](digiIOBela.md), [Bela digital input and output](../oscnetwork/bela.md)

## Credits

Author Victor Lazzarini, 2017.
