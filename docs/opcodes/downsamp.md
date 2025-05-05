<!--
id:downsamp
category:Signal Modifiers:Sample Level Operators
-->
# downsamp
Modify a signal by down-sampling.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = downsamp(asig [, iwlen])
    ```

=== "Classic"
    ``` csound-orc
    kres downsamp asig [, iwlen]
    ```

### Initialization

_iwlen_ (optional) -- window length in samples over which the audio signal is averaged to determine a downsampled value. Maximum length is _ksmps_; 0 and 1 imply no window averaging. The default value is 0.

### Performance

_downsamp_ converts an audio signal to a control signal by downsampling. It produces one kval for each audio control period. The optional window invokes a simple averaging process to suppress foldover.

## Examples

Here is an example of the downsamp opcode. It uses the file [downsamp.csd](../examples/downsamp.csd).

``` csound-csd title="Example of the downsamp opcode." linenums="1"
--8<-- "examples/downsamp.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)
