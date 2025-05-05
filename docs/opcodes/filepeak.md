<!--
id:filepeak
category:Signal I/O:Soundfile Queries
-->
# filepeak
Returns the peak absolute value of a sound file.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = filepeak(ifilcod [, ichnl])
    ```

=== "Classic"
    ``` csound-orc
    ir filepeak ifilcod [, ichnl]
    ```

### Initialization

_ifilcod_ -- sound file to be queried

_ichnl_ (optional, default=0) -- channel to be used in calculating the peak value. Default is 0.

*  _ichnl_ = 0 returns peak value of all channels
*  _ichnl_ &gt; 0 returns peak value of _ichnl_

### Performance

_filepeak_ returns the peak absolute value of the sound file _ifilcod_.

## Examples

Here is an example of the filepeak opcode. It uses the file [filepeak.csd](../examples/filepeak.csd), and [Church.wav](../examples/Church.wav).

``` csound-csd title="Example of the filepeak opcode." linenums="1"
--8<-- "examples/filepeak.csd"
```

The _filepeak_'s output should include lines like this:

```
Peak value in file 'Church.wav' is 0.909363 (-0.825 dB).
Peak value in file 'Church_norm.wav' is 0.501190 (-6.000 dB).
```

## See also

[Sound File Queries](../sigio/queries.md)

## Credits

Author: Matt Ingalls<br>
July 1999<br>

New in Csound version 3.57
