<!--
id:vincr
category:Mathematical Operations:Comparators and Accumulators
-->
# vincr
Increments one audio variable with another signal, i.e. it accumulates output.

## Syntax
=== "Modern"
    ``` csound-orc
    vincr(accum, aincr)
    ```

=== "Classic"
    ``` csound-orc
    vincr accum, aincr
    ```

### Performance

_accum_ -- audio-rate accumulator variable to be incremented

_aincr_ -- incrementing signal

_vincr_ (variable increment) and [clear](../opcodes/clear.md) are intended to be used together. _vincr_ stores the result of the sum of two audio variables into the first variable itself (which is intended to be used as an accumulator in polyphony). The accumulator is typically a global variable that is used to combine signals from several sources (different instruments or instrument instances) for further processing (for example, via a global effect that reads the accumulator) or for outputting the combined signal by some means other than one of the _out_ opcodes (eg. via the [fout](../opcodes/fout.md) opcode). After the accumulator is used, the accumulator variable should be set to zero by means of the _clear_ opcode (or it will explode).

## Examples

The following example uses the vincr opcode. It uses the file [vincr.csd](../examples/vincr.csd).

``` csound-csd title="Example of the vincr opcode." linenums="1"
--8<-- "examples/vincr.csd"
```

This is another example uses the vincr opcode. It uses the file [vincr-complex.csd](../examples/vincr-complex.csd).

``` csound-csd linenums="1"
--8<-- "examples/vincr-complex.csd"
```

## See also

[File Input and Output](../sigio/fileio.md)

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1999<br>

New in Csound version 3.56
