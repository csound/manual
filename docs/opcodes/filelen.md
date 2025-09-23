<!--
id:filelen
category:Signal I/O:Soundfile Queries
-->
# filelen
Returns the length of a sound file.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = filelen(ifilcod, [iallowraw])
    ```

=== "Classic"
    ``` csound-orc
    ir filelen ifilcod, [iallowraw]
    ```

### Initialization

_ifilcod_ -- sound file to be queried

_iallowraw_ -- Allow raw sound files (default=1)

### Performance

_filelen_ returns the length of the sound file _ifilcod_ in seconds. _filelen_ can return the length of convolve and PVOC files if the "allow raw sound file" flag is not zero (it is non-zero by default).

## Examples

Here is an example of the filelen opcode. It uses the file [filelen.csd](../examples/filelen.csd), [Mathews.wav](../examples/Mathews.wav), and [drumsSlp.wav](../examples/drumsSlp.wav).

``` csound-csd title="Example of the filelen opcode." linenums="1"
--8<-- "examples/filelen.csd"
```

The mono audio file &#8220;Mathews.wav&#8221; is about 2.8 seconds long, and the stereo file &#8220;drumsSlp.wav&#8221; is 4.0 seconds. So _filelen_'s output should include a line for the mono and the stereo file like this:

```
lenght of sample = 15.598 seconds
lenght of sample = 4.000 seconds
```

## See also

[Sound File Queries](../sigio/queries.md)

## Credits

Author: Matt Ingalls<br>
July 1999<br>

New in Csound version 3.57
