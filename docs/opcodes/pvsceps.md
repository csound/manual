<!--
id:pvsceps
category:Spectral Processing:Streaming
-->
# pvsceps
Calculate the cepstrum of a pvs input, optionally liftering coefficients.

## Syntax
=== "Modern"
    ``` csound-orc
    keps[] = pvsceps(fsig[, icoefs])
    ```

=== "Classic"
    ``` csound-orc
    keps[] pvsceps fsig[, icoefs]
    ```

### Initialization

_icoefs_ -- the number of retained coefficients in the cepstrum output. By default, no coefficients are liftered.

### Performance

_keps[]_ -- the cepstrum output, an array of size N/2+1, where N is equivalent to the FFT size of the input fsig.

_fsig_ -- an input pv stream

## Examples

Here is an example of the use of the _pvsceps_ opcode. It uses the file [pvsceps.csd](../examples/pvsceps.csd).

``` csound-csd title="Example of the _pvsceps_ opcode." linenums="1"
--8<-- "examples/pvsceps.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
2014<br>
