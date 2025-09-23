<!--
id:filenchnls
category:Signal I/O:Soundfile Queries
-->
# filenchnls
Returns the number of channels in a sound file.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = filenchnls(ifilcod [, iallowraw])
    ```

=== "Classic"
    ``` csound-orc
    ir filenchnls ifilcod [, iallowraw]
    ```

### Initialization

_ifilcod_ -- sound file to be queried

_iallowraw_ -- (Optional) Allow raw sound files (default=1)

### Performance

_filenchnls_ returns the number of channels in the sound file _ifilcod_. _filechnls_ can return the number of channels of convolve and PVOC files if the _iallowraw_ flag is not zero (it is non-zero by default).

## Examples

Here is an example of the filenchnls opcode. It uses the file [filenchnls.csd](../examples/filenchnls.csd), [fox.wav](../examples/fox.wav), and [drumsSlp.wav](../examples/drumsSlp.wav).

``` csound-csd title="Example of the filenchnls opcode." linenums="1"
--8<-- "examples/filenchnls.csd"
```

The audio file &#8220;fox.wav&#8221; is monoaural (1 channel), while &#8220;drumsSlp.wav&#8221; is stereo (2 channels) So _filenchnls_'s output should include lines like this:

```
number of channels = 1
number of channels = 2
```

## See also

[Sound File Queries](../sigio/queries.md)

## Credits

Author: Matt Ingalls<br>
July 1999<br>

New in Csound version 3.57
