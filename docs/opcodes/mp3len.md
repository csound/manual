<!--
id:mp3len
category:Signal I/O:Soundfile Queries
-->
# mp3len
Returns the length of an MP3 sound file.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = mp3len(ifilcod)
    ```

=== "Classic"
    ``` csound-orc
    ir mp3len ifilcod
    ```

### Initialization

_ifilcod_ -- sound file to be queried

### Performance

_mp3len_ returns the length of the sound file _ifilcod_ in seconds.

## Examples

Here is an example of the mp3len opcode. It uses the file [mp3len.csd](../examples/mp3len.csd).

``` csound-csd title="Example of the mp3len opcode." linenums="1"
--8<-- "examples/mp3len.csd"
```

## See also

[Sound File Queries](../sigio/queries.md)

## Credits

Author: John ffitch<br>
Feb 2011<br>

New in Csound version 5.14
