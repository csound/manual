<!--
id:fold
category:Signal Modifiers:Sample Level Operators
-->
# fold
Adds artificial foldover to an audio signal.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = fold(asig, kincr)
    ```

=== "Classic"
    ``` csound-orc
    ares fold asig, kincr
    ```

### Performance

_asig_ -- input signal

_kincr_ -- amount of foldover expressed in multiple of sampling rate. Must be &gt;= 1

_fold_ is an opcode which creates artificial foldover.  For example, when _kincr_ is equal to 1 with sr=44100, no foldover is added. When _kincr_ is set to 2, the foldover is equivalent to a downsampling to 22050, when it is set to 4, to 11025 etc. Fractional values of _kincr_ are possible, allowing a continuous variation of foldover amount. This can be used for a wide range of special effects.

## Examples

Here is an example of the fold opcode. It uses the file [fold.csd](../examples/fold.csd).

``` csound-csd title="Example of the fold opcode." linenums="1"
--8<-- "examples/fold.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1999<br>

New in Csound version 3.56
