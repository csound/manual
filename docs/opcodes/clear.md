<!--
id:clear
category:Mathematical Operations:Comparators and Accumulators
-->
# clear
Zeroes a list of audio signals.

## Syntax
=== "Modern"
    ``` csound-orc
    clear(avar1 [, avar2] [, avar3] [...])
    clear(avar[])
    ```

=== "Classic"
    ``` csound-orc
    clear avar1 [, avar2] [, avar3] [...]
    clear avar[]
    ```

### Performance

_avar1, avar2, avar3,_ ... -- signals to be zeroed

_avar[]_ -- array of signals to be cleared.

_kvar[]_ ... -- array of k-values to be cleared.

> :memo: **Note**
> 
> Before version 6.13 this opcode was not compatible with multicore operations if used with a global variable.

_clear_ sets every sample of each of the given audio signals to zero when it is performed.  This is equivalent to writing _avarN = 0_ in the orchestra for each of the specified variables.  Typically, _clear_ is used with global variables that combine multiple signals from different sources and change with each k-pass (performance loop) through all of the active instrument instances.  After the final usage of such a variable and before the next k-pass, it is necessary to clear the variable so that it does not add the next cycle's signals to the previous result.  _clear_ is especially useful in combination with [vincr](../opcodes/vincr.md) (variable increment) and they are intended to be used together with file output opcodes such as [fout](../opcodes/fout.md).

## Examples

=== "Modern"
    Here is an example of the clear opcode. It uses the file [clear-modern.csd](../examples/clear-modern.csd).
    ``` csound-csd title="Example of the clear opcode." linenums="1"
    --8<-- "examples/clear-modern.csd"
    ```

=== "Classic"
    Here is an example of the clear opcode. It uses the file [clear.csd](../examples/clear.csd).
    ``` csound-csd title="Example of the clear opcode." linenums="1"
    --8<-- "examples/clear.csd"
    ```

See the [fout](../opcodes/fout.md) opcode for another example.

## See also

[File Input and Output](../sigio/fileio.md)

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1999<br>
Author: Victor Lazzarini<br>

New in Csound version 3.56

Revised in Csound version 6.17 for arrays
