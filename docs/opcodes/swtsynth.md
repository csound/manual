<!--
id:swtsynth
category:Spectral Processing:Streaming
-->
# swtsynth
Resynthesises an SWT stream as audio.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = swtsynth(wswt)
    ```

=== "Classic"
    ``` csound-orc
    aout swtsynth wswt
    ```

### Performance

_wswt_ -- SWT stream produced by [swtanal](../opcodes/swtanal.md), [swtset](../opcodes/swtset.md), or an equivalent source.

`swtsynth` uses the frame size, hop size, number of levels, wavelet, and synthesis mode stored in the stream. It reads the newest frame available at each k-cycle and reconstructs audio from the flat coefficient vector `[cA_J | cD_J | ... | cD_1]`.

Output for frame `m` starts at sample `m * H + N`, where `H` is the analysis hop and `N` is the frame size. The first `N` samples are therefore the analysis latency. Samples before the note starts or after it ends within a control block are zero.

When the analysis used direct mode (`H == N` and no window), synthesis applies the inverse transform without windowing. When it used overlap-add mode, synthesis applies the matching square-root Hann window and divides by the accumulated window power. This allows coefficient edits made with `swtset` to be heard while keeping overlap-add reconstruction continuous.

The stream must be initialised and its metadata must remain unchanged after `swtsynth` starts. An uninitialised frame or incompatible metadata is reported as an initialisation error.

## Examples

Here is a simple analysis and resynthesis example. It uses the file [swtanal.csd](../examples/swtanal.csd).

``` csound-csd title="Example of the swtanal and swtsynth opcodes." linenums="1"
--8<-- "examples/swtanal.csd"
```

## See also

- [swtanal](../opcodes/swtanal.md)
- [swtget](../opcodes/swtget.md)
- [swtset](../opcodes/swtset.md)
