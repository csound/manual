<!--
id:centroid
category:Spectral Processing:Other
-->
# centroid
Calculate the spectral centroid of an audio signal on a given trigger.

## Syntax
=== "Modern"
    ``` csound-orc
    kcent = centroid(asig, ktrig, ifftsize)
    ```

=== "Classic"
    ``` csound-orc
    kcent centroid asig, ktrig, ifftsize
    ```

### Initialization

_ifftsize_  -- fftsize. Non pow-of-two values are converted to the next pow-of-two not smaller than ifftsize.

### Performance

_kcent_ -- the spectral centroid in Hz

_asig_ -- an input audio signal

_ktrig_ -- 1 to calculate a new centroid, 0 to skip the process (and output previous value).

## Examples

=== "Modern"
    Here is an example of the centroid opcode. It uses the file [centroid-modern.csd](../examples/centroid-modern.csd).
    ``` csound-csd title="Example of the centroid opcode." linenums="1"
    --8<-- "examples/centroid-modern.csd"
    ```

=== "Classic"
    Here is an example of the centroid opcode. It uses the file [centroid.csd](../examples/centroid.csd).
    ``` csound-csd title="Example of the centroid opcode." linenums="1"
    --8<-- "examples/centroid.csd"
    ```

## See also

[Sensing and Control: Tempo and Pitch estimation](../control/sensing.md)

## Credits

Author: V Lazzarini;<br>
August 2012<br>
