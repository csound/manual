<!--
id:pvsmaska
category:Spectral Processing:Streaming
-->
# pvsmaska
Modify amplitudes using a function table, with dynamic scaling.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsmaska(fsrc, ifn, kdepth)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsmaska fsrc, ifn, kdepth
    ```

### Initialization

_ifn_ -- The mask table, with one value per analysis bin, from DC through Nyquist. Use [pvsinfo](pvsinfo.md) to get the bin count and [ftgen](ftgen.md) to create a table of that size. Values between 0 and 1 attenuate the signal; values above 1 amplify it. At initialization, pvsmaska replaces negative values in the table with zero.

### Performance

_kdepth_ -- Blends between unchanged amplitudes (0) and the full mask (1). Values outside this range are clipped with a warning. For each bin, the gain is `(1 - kdepth) + kdepth * mask_value`.

_fsrc_ must use amplitude+frequency (format 0) or amplitude+phase (format 1). The output keeps the input frequencies or phases unchanged. Reinitialize pvsmaska when changing the input's analysis properties, such as FFT size or sliding mode.

For ordinary analysis frames, the mask and depth take effect when a new input frame arrives. For sliding signals, they apply to every active sample in the control block. Samples before the note starts or after it ends have zero output.

For a power-of-two FFT size, use a table size of `ifftsize / 2 + 1` so you can set the Nyquist-bin value explicitly. A power-of-two table size uses its guard point for that bin, which may repeat the first table value.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the use of the _pvsmaska_ opcode. It uses the file [pvsmaska.csd](../examples/pvsmaska.csd).

``` csound-csd title="Example of the _pvsmaska_ opcode." linenums="1"
--8<-- "examples/pvsmaska.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

New in version 4.13
