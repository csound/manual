<!--
id:swtset
category:Spectral Processing:Streaming
-->
# swtset
Creates a modified copy of an SWT stream by writing coefficients from a k-rate vector.

## Syntax
=== "Modern"
    ``` csound-orc
    wout = swtset(wswt, kcoeffs [, iband])
    ```

=== "Classic"
    ``` csound-orc
    w:swt wout swtset wswt, kcoeffs, [iband]
    ```

### Initialization

_wswt_ -- source SWT stream, normally produced by [swtanal](../opcodes/swtanal.md).

_kcoeffs_ -- input vector containing the replacement coefficients. It must contain at least `N` samples for a single band, or `(levels + 1) * N` samples for `iband = -1`.

_iband_ -- band selector. The default, `-1`, replaces the whole flat coefficient vector. `0` replaces the approximation band `cA_J`. Values from `1` to the number of levels replace detail bands `cD_J` to `cD_1`, in coarsest-to-finest order. Values greater than the number of levels are invalid.

`swtset` copies the source stream's metadata and history to the output stream, so the result can be resynthesised with [swtsynth](../opcodes/swtsynth.md) independently of the source.

### Performance

`swtset` writes the vector to the selected band of the output stream on each k-cycle and increments the stream's revision. Writing zeros mutes the selected band; leaving other bands unchanged preserves them.

The operation edits the current coefficients rather than creating a new analysis frame. The frame count and frame timing remain those of the source stream.

## Examples

Here is an example that removes the approximation band. It uses the file [swtset.csd](../examples/swtset.csd).

``` csound-csd title="Example of the swtget and swtset opcodes." linenums="1"
--8<-- "examples/swtset.csd"
```

## See also

- [swtanal](../opcodes/swtanal.md)
- [swtget](../opcodes/swtget.md)
- [swtsynth](../opcodes/swtsynth.md)
