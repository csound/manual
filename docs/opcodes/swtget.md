<!--
id:swtget
category:Spectral Processing:Streaming
-->
# swtget
Reads one coefficient band from an SWT stream into a k-rate vector.

## Syntax
=== "Modern"
    ``` csound-orc
    kcoeffs:k[] = swtget(wswt, iband)
    ```

=== "Classic"
    ``` csound-orc
    kcoeffs:k[] swtget wswt, iband
    ```

### Initialization

_wswt_ -- SWT stream produced by [swtanal](../opcodes/swtanal.md), [swtset](../opcodes/swtset.md), or an equivalent source.

_iband_ -- band selector. The default, `-1`, selects the whole flat coefficient vector. `0` selects the approximation band `cA_J`. Values from `1` to the number of levels select detail bands `cD_J` to `cD_1`, in coarsest-to-finest order. Values greater than the number of levels are invalid.

A single band returns a vector of `N` coefficients, where `N` is the analysis frame size. Selector `-1` returns all `(levels + 1) * N` coefficients in the layout `[cA_J | cD_J | ... | cD_1]`.

### Performance

`swtget` copies the current frame's selected coefficients to the output vector on each k-cycle. It does not consume frames and does not change the stream's frame count or revision.

If no new frame has been produced since the previous k-cycle, the same coefficients are copied again. Coefficient values are the values stored at analysis time, including any edits made by `swtset`.

## Examples

Here is an example that reads the whole coefficient vector. It uses the file [swtset.csd](../examples/swtset.csd).

``` csound-csd title="Example of the swtget and swtset opcodes." linenums="1"
--8<-- "examples/swtset.csd"
```

## See also

- [swtanal](../opcodes/swtanal.md)
- [swtset](../opcodes/swtset.md)
- [swtsynth](../opcodes/swtsynth.md)
