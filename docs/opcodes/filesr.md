<!--
id:filesr
category:Signal I/O:Soundfile Queries
-->
# filesr
Returns the sample rate of a sound file.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = filesr(ifilcod [, iallowraw])
    ```

=== "Classic"
    ``` csound-orc
    ir filesr ifilcod [, iallowraw]
    ```

### Initialization

_ifilcod_ -- sound file to be queried

_iallowraw_ -- (Optional) Allow raw sound files (default=1)

### Performance

_filesr_ returns the sample rate of the sound file _ifilcod_. _filesr_ can return the sample rate of convolve and PVOC files if the _iallowraw_ flag is not zero (it is non-zero by default).

## Examples

Here is an example of the filesr opcode. It uses the file [filesr.csd](../examples/filesr.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the filesr opcode." linenums="1"
--8<-- "examples/filesr.csd"
```

The audio file &#8220;drumsMlp.wav&#8221; was sampled at 44.1 KHz. So _filesr_'s output should include a line like this:

```
sample rate = 44100.000000, size = 131072.000000
```

## See also

[Sound File Queries](../sigio/queries.md)

## Credits

Author: Matt Ingalls<br>
July 1999<br>

New in Csound version 3.57
