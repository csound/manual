<!--
id:cepsinv
category:Array Operations: Cepstrum
-->
# cepsinv
Calculate the inverse cepstrum of an array.

## Syntax
=== "Modern"
    ``` csound-orc
    kenv = cepsinv(keps[])
    ```

=== "Classic"
    ``` csound-orc
    kenv cepsinv keps[]
    ```

### Performance

_keps[]_ -- the cepstrum input, an array of size N+1, where N is power-of-two, containing the cepstral coefficients.

_kenv_ -- the inverse cepstrum (spectral envelope), an array of N+1 magnitudes.

## Examples

=== "Modern"
    Here is an example of the use of the _cepsinv_ opcode. It uses the file [cepsinv-modern.csd](../examples/cepsinv-modern.csd).
    ``` csound-csd title="Example of the _cepsinv_ opcode." linenums="1"
    --8<-- "examples/cepsinv-modern.csd"
    ```

=== "Classic"
    Here is an example of the use of the _cepsinv_ opcode. It uses the file [cepsinv.csd](../examples/cepsinv.csd).
    ``` csound-csd title="Example of the _cepsinv_ opcode." linenums="1"
    --8<-- "examples/cepsinv.csd"
    ```

## See Also

[Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author: Victor Lazzarini<br>
2014<br>
