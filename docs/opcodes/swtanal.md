<!--
id:swtanal
category:Spectral Processing:Streaming
-->
# swtanal
Generates a stationary wavelet transform (SWT) stream from a mono audio signal.

## Syntax
=== "Modern"
    ``` csound-orc
    wswt = swtanal(asig, iN, iH, ifamily, iorder [, ilevels [, iboundary [, iwindow [, iola]]]])
    ```

=== "Classic"
    ``` csound-orc
    w:swt swtanal asig, iN, iH, ifamily, iorder, [ilevels], [iboundary], [iwindow], [iola]
    ```

### Initialization

_asig_ -- input audio signal.

_iN_ -- analysis frame size. It must be at least 2. It also sets the synthesis latency in samples.

_iH_ -- hop size in samples. It must be in the range `1` to `iN`. A hop smaller than the frame size produces overlapping frames.

_ifamily_ -- wavelet family: `0` for Haar, `1` for Daubechies, `2` for Symlet, or `3` for Coiflet.

_iorder_ -- wavelet order. Haar supports order `1`, Daubechies orders `1` to `8`, Symlet orders `2` to `8`, and Coiflet orders `1` to `5`. The filter length must fit inside one frame.

_ilevels_ -- number of decomposition levels. When omitted or negative, the largest number of levels that fits the frame and wavelet is used. A value of `0` selects one level.

_iboundary_ -- boundary mode. Only `0` (periodic/circular) is currently supported, and it is the default.

_iwindow_ -- analysis window: `0` for no window, or `1` for the square-root Hann window used for overlap-add. The default is `1`. A window is required when `iH < iN`.

_iola_ -- synthesis mode: `0` for automatic, `1` for direct reconstruction, or `2` for overlap-add. The default is `0`. Automatic mode chooses direct reconstruction when `iH == iN` and overlap-add otherwise. Direct mode requires `iH == iN`; overlap-add mode requires a window.

The coefficients are stored in one flat vector per frame. The layout is `[cA_J | cD_J | ... | cD_1]`, where `cA_J` is the approximation band at the coarsest level and `cD_1` is the finest detail band. Each band has `iN` samples, so the frame capacity is `(ilevels + 1) * iN`.

### Performance

`swtanal` fills one frame every `iH` samples after the first `iN` samples have been collected. Each frame covers the input interval `[m * iH, m * iH + iN)`.

`swtsynth` begins output for frame `m` at sample `m * iH + iN`. The first `iN` output samples therefore contain the startup latency. With direct reconstruction and no coefficient edits, the steady-state output reproduces the input delayed by `iN` samples. With overlap-add, matching analysis and synthesis windows are applied and normalised by the accumulated window power.

Each new frame increments the stream's frame count and revision. Host code can inspect the frame, metadata, and layout through the `csoundGetSwtData()` and `csoundSwtData*()` accessors declared in `swtdat.h`.

Invalid frame or hop sizes, unsupported wavelet families or orders, unsupported boundary modes, missing windows for overlap-add, and direct mode with `iH != iN` are reported as initialisation errors.

## Examples

Here is a simple analysis and resynthesis example. It uses the file [swtanal.csd](../examples/swtanal.csd).

``` csound-csd title="Example of the swtanal and swtsynth opcodes." linenums="1"
--8<-- "examples/swtanal.csd"
```

## See also

- [swtget](../opcodes/swtget.md)
- [swtset](../opcodes/swtset.md)
- [swtsynth](../opcodes/swtsynth.md)
