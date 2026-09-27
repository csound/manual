<!--
id:pvsbandwidth
category:Spectral Processing:Streaming
-->
# pvsbandwidth
Calculate the spectral bandwidth of a signal from its discrete Fourier transform.

## Syntax
=== "Modern"
    ``` csound-orc
    kbnd = pvsbandwidth(fsig)
    ```

=== "Classic"
    ``` csound-orc
    kbnd pvsbandwidth fsig
    ```

### Performance

_kbnd_ -- the spectral bandwidth, in Hz

_fsig_ -- an input pv stream in amplitude-frequency or amplitude-phase format

The bandwidth is the standard deviation of the FFT bin centre frequencies,
weighted by their magnitudes. It measures their spread around the spectral
centroid. The calculation uses bin positions, not the frequency or phase
values stored in the bins. A silent frame returns zero.

For frame-based input, the output updates when a new frame arrives and holds
the result between frames. For sliding input, it uses the first active sample
of each control block.

## Examples

Here is an example of the use of the _pvsbandwidth_ opcode. It uses the file [pvsbandwidth.csd](../examples/pvsbandwidth.csd).

``` csound-csd title="Example of the pvsbandwidth opcode." linenums="1"
--8<-- "examples/pvsbandwidth.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
March 2020<br>
