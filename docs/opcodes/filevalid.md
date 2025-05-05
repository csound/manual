<!--
id:filevalid
category:Signal I/O:Soundfile Queries
-->
# filevalid
Checks that a file can be read at initialisation or performance time.

Returns 1 if the sound file exists and is readable, or 0 if not.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = filevalid(ifilcod)
    kr = filevalid(ifilcod)
    ```

=== "Classic"
    ``` csound-orc
    ir filevalid ifilcod
    kr filevalid ifilcod
    ```

### Initialization

_ifilcod_ -- sound file to be queried

_ir_ -- return code (1 if the sound file _ifilcod_ can be read).

### Performance

_kr_ -- return code (1 if the sound file _ifilcod_ can be read).

## Examples

Here is an example of the filevalid opcode. It uses the file [filevalid.csd](../examples/filevalid.csd).

``` csound-csd title="Example of the filevalid opcode." linenums="1"
--8<-- "examples/filevalid.csd"
```

The output should include a line like this:

```
Audiofile 'frox.wav' does not exist!
```

## See also

[Sound File Queries](../sigio/queries.md)

## Credits

Author: Matt Ingalls<br>
July 2010<br>

New in Csound version 5.13
