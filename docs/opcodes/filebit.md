<!--
id:filebit
category:Signal I/O:Soundfile Queries
-->
# filebit
Returns the number of bits in each sample in a sound file.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = filebit(ifilcod [, iallowraw])
    ```

=== "Classic"
    ``` csound-orc
    ir filebit ifilcod [, iallowraw]
    ```

### Initialization

_ifilcod_ -- sound file to be queried

_iallowraw_ -- (Optional) Allow raw sound files (default=1)

### Performance

_filebit_ returns the number of bits in each sample in the sound file _ifilcod_. In the case of floating point samples the value -1 is returned for floats and -2 for doubles. For non-PCM formats the value is negative, and based on libsndfile's format encoding.

## Examples

Here is an example of the filebit opcode. It uses the file [filebit.csd](../examples/filebit.csd), and [stereoJungle.wav](../examples/stereoJungle.wav).

``` csound-csd title="Example of the filebit opcode." linenums="1"
--8<-- "examples/filebit.csd"
```
The output should include a line like this:


```
bit depth = 16 bit
```

## See also

[Sound File Queries](../sigio/queries.md)

## Credits

Author: Victor Lazzarini<br>
July 1999<br>

New in Csound version 5.11
