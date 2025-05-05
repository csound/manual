<!--
id:paulstretch
category:Spectral Processing:Other
-->
# paulstretch
Extreme time-stretching algorithm by Nasca Octavian Paul.

The _paulstretch_ opcode is a lightweight implementation of the PaulStretch time-stretching algorithm by Nasca Octavian Paul. It is ideal for timestretching a signal by very large amounts.

The Paulstretch algorithm works very similarly to other STFT-based timestretching methods, using overlap-add with a hanning window. Unique to paulstretch are the use of scrambled phase and very large window sizes (specified in seconds).

## Syntax
=== "Modern"
    ``` csound-orc
    asig = paulstretch(istretch, iwindowsize, ift)
    ```

=== "Classic"
    ``` csound-orc
    asig paulstretch istretch, iwindowsize, ift
    ```

### Initialization

_istretch_ -- Stretch factor.

_iwindowsize_ -- Window size, in seconds.

_ift_ -- source signal function table. Deferred-allocation tables (see [GEN01](../scoregens/gen01.md)) are accepted, but the opcode expects a mono source.

## Examples

Here is an example of the paulstretch opcode. It uses the file [paulstretch.csd](../examples/paulstretch.csd)

``` csound-csd title="Example of the paulstretch opcode." linenums="1"
--8<-- "examples/paulstretch.csd"
```

## See also

[Special Effects](../sigmod/speciale.md)

## Credits

Author: Paul Batchelor<br>
May 2016<br>
